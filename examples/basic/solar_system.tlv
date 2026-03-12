\m5_TLV_version 1d: tl-x.org
\m5

\SV
   m5_makerchip_module
\TLV

   /test
      |pipe
         @0
            $sun[7:0] = >>1$sun + 8'd1;

      \viz_js
         box: {left:0, top:0, width:800, height:500, strokeWidth:0},

         init() {

            var stars = {}

            for (var i = 0; i < 120; i++) {
               stars["star"+i] = new fabric.Circle({
                  radius:1.5,
                  fill:"white",
                  left: Math.random()*800,
                  top: Math.random()*500
               })
            }

            return Object.assign({

               sky: new fabric.Rect({
                  left:0, top:0, width:800, height:500,
                  fill:"black", strokeWidth:0
               }),

              
               sun: new fabric.Circle({
                  radius:40,
                  fill:"yellow",
                  left:420,
                  top:250,
                  originX:"center",
                  originY:"center",
                  shadow:{
                     color:"rgba(255,255,0,0.8)",
                     blur:60,
                     offsetX:0,
                     offsetY:0
                  }
               }),

               mercury: new fabric.Circle({
                  radius:6,
                  fill:"#808080",
                  originX:"center",
                  originY:"center"
               }),

               venus: new fabric.Circle({
                  radius:7.5,
                  fill:"#FFA500",
                  originX:"center",
                  originY:"center"
               }),

               earth: new fabric.Circle({
                  radius:8,
                  fill:"#1E90FF",
                  originX:"center",
                  originY:"center"
               }),

               mars: new fabric.Circle({
                  radius:7,
                  fill:"#FF0000",
                  originX:"center",
                  originY:"center"
               }),

               jupiter: new fabric.Circle({
                  radius:12,
                  fill:"#A52A2A",
                  originX:"center",
                  originY:"center"
               }),

               saturn_system: new fabric.Group([

                  new fabric.Ellipse({
                     rx:22,
                     ry:12,
                     stroke:"#C2A678",
                     strokeWidth:2,
                     fill:"transparent",
                     angle:25,
                     originX:"center",
                     originY:"center"
                  }),

                  new fabric.Circle({
                     radius:10,
                     fill:"#D2B48C",
                     originX:"center",
                     originY:"center"
                  })

               ],{
                  originX:"center",
                  originY:"center"
               }),

               uranus_system: new fabric.Group([

                  new fabric.Ellipse({
                     rx:14,
                     ry:6,
                     stroke:"rgba(180,180,180,0.55)",
                     strokeWidth:1.2,
                     fill:"transparent",
                     angle:15,
                     originX:"center",
                     originY:"center"
                  }),

                  new fabric.Circle({
                     radius:8.4,
                     fill:"#40E0D0",
                     originX:"center",
                     originY:"center"
                  })

               ],{
                  originX:"center",
                  originY:"center"
               }),

               neptune: new fabric.Circle({
                  radius:8.3,
                  fill:"#0000CD",
                  originX:"center",
                  originY:"center"
               }),

               orbit1: new fabric.Ellipse({ rx:80, ry:50, left:340, top:200, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit2: new fabric.Ellipse({ rx:110, ry:70, left:310, top:180, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit3: new fabric.Ellipse({ rx:140, ry:90, left:280, top:160, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit4: new fabric.Ellipse({ rx:170, ry:110, left:250, top:140, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit5: new fabric.Ellipse({ rx:200, ry:130, left:220, top:120, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit6: new fabric.Ellipse({ rx:230, ry:150, left:190, top:100, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit7: new fabric.Ellipse({ rx:260, ry:170, left:160, top:80, fill:"transparent", stroke:"white", strokeWidth:2 }),
               orbit8: new fabric.Ellipse({ rx:290, ry:190, left:130, top:60, fill:"transparent", stroke:"white", strokeWidth:2 })

            }, stars)
         },

         render() {

            var objs = this.getObjects()

            objs.sky.set({ fill:"black" })

            var sun = '|pipe$sun'.asInt()
            var angle = sun * 0.05

            var cx = 420
            var cy = 250

            objs.mercury.set({
               left: cx + 80 * Math.cos(angle),
               top:  cy + 50 * Math.sin(angle)
            })

            objs.venus.set({
               left: cx + 110 * Math.cos(angle * 0.8),
               top:  cy + 70 * Math.sin(angle * 0.8)
            })

            objs.earth.set({
               left: cx + 140 * Math.cos(angle * 0.6),
               top:  cy + 90 * Math.sin(angle * 0.6)
            })

            objs.mars.set({
               left: cx + 170 * Math.cos(angle * 0.5),
               top:  cy + 110 * Math.sin(angle * 0.5)
            })

            objs.jupiter.set({
               left: cx + 200 * Math.cos(angle * 0.3),
               top:  cy + 130 * Math.sin(angle * 0.3)
            })

            objs.saturn_system.set({
               left: cx + 230 * Math.cos(angle * 0.2),
               top:  cy + 150 * Math.sin(angle * 0.2)
            })

            objs.uranus_system.set({
               left: cx + 260 * Math.cos(angle * 0.15),
               top:  cy + 170 * Math.sin(angle * 0.15)
            })

            objs.neptune.set({
               left: cx + 290 * Math.cos(angle * 0.1),
               top:  cy + 190 * Math.sin(angle * 0.1)
            })

         },

         where: {left:0, top:0, width:800, height:500}

   *passed = *cyc_cnt > 200;
   *failed = 1'b0;

\SV
endmodule