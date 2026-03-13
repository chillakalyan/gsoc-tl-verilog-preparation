\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   /boat
      |pipe
         @0
            // Faster forward looping
            $x[9:0] =
               (>>1$x > 10'd750) ? 10'd0 :
               >>1$x + 10'd8;

            // Wave phase counter
            $y[7:0] = >>1$y + 8'd1;

      \viz_js
         box: {left: 0, top: 0, width: 800, height: 500, strokeWidth: 0},

         init() {

            // ---------- SKY ----------
            var sky = new fabric.Rect({
               left: 0,
               top: 0,
               width: 800,
               height: 500,
               fill: "#87CEEB",
               strokeWidth: 0
            });

            // ---------- SUN ----------
            var sunGlow = new fabric.Circle({
               left: 100,
               top: 60,
               radius: 60,
               fill: "rgba(255,223,0,0.25)",
               strokeWidth: 0
            });

            var sunCore = new fabric.Circle({
               left: 120,
               top: 80,
               radius: 35,
               fill: "yellow",
               strokeWidth: 0
            });

            // ---------- CLOUD ----------
            var cloud = new fabric.Group([
               new fabric.Circle({ left: 0, top: 0, radius: 20, fill: "white" }),
               new fabric.Circle({ left: 20, top: -8, radius: 25, fill: "white" }),
               new fabric.Circle({ left: 45, top: 0, radius: 20, fill: "white" })
            ], {
               left: 300,
               top: 90
            });

            // ---------- WATER ----------
            var water = new fabric.Path(
               "M 0 0 Q 100 20 200 0 T 400 0 T 600 0 T 800 0 L 800 300 L 0 300 Z",
               { fill: "#1E90FF", strokeWidth: 0 }
            );
            water.top = 200;

            // ---------- FOAM ----------
            var foam = new fabric.Path(
               "M 0 10 Q 100 30 200 10 T 400 10 T 600 10 T 800 10",
               { stroke: "white", fill: "", strokeWidth: 2 }
            );
            foam.top = 200;

            // ---------- BOAT ----------
            var hull = new fabric.Path(
               "M -40 0 Q 0 20 40 0 L 30 10 Q 0 30 -30 10 Z",
               { fill: "black", strokeWidth: 0 }
            );

            var sail1 = new fabric.Path(
               "M 0 0 Q -20 -80 10 -100 Q 40 -60 0 0 Z",
               { fill: "white", strokeWidth: 0 }
            );

            var sail2 = new fabric.Path(
               "M 15 0 Q 60 -60 45 -20 Z",
               { fill: "white", strokeWidth: 0 }
            );

            var boat = new fabric.Group([hull, sail1, sail2], {
               left: 100,
               top: 260
            });

            return { sky, water, foam, sunGlow, sunCore, cloud, boat };
         },

         render() {

            var x = '|pipe$x'.asInt();
            var y = '|pipe$y'.asInt();
            var objs = this.getObjects();

            // -------- Multi-frequency Wave --------
            var wave1 = Math.sin(y * 0.08);
            var wave2 = Math.sin(y * 0.17) * 0.5;
            var waveHeight = (wave1 + wave2) * 6;

            // Wave slope for tilt
            var slope = Math.cos(y * 0.08) * 0.05;

            // Sun slow parallax
            objs.sunGlow.left = 100 + (x * 0.05);
            objs.sunCore.left = 120 + (x * 0.05);

            // Cloud faster parallax
            objs.cloud.left = 300 + (x * 0.2);

            // Water bob
            objs.water.top = 200 + waveHeight;
            objs.foam.top  = 200 + waveHeight;

            // Boat wave interaction
            var boatWave = Math.sin((x * 0.02) - (y * 0.08)) * 6;

            objs.boat.left = 100 + x;
            objs.boat.top  = 260 + boatWave;

            // Boat tilt
            objs.boat.angle = slope * 60;
         },

         where: {left: 0, top: 0, width: 800, height: 500}

   *passed = *cyc_cnt > 3000;
   *failed = 1'b0;

\SV
   endmodule
