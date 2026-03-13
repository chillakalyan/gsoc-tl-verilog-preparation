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
            return {

               sky: new fabric.Rect(
                  { left:0, top:0, width:800, height:500, fill:"#1B3B6F", strokeWidth:0 }
               ),

               mountain1: new fabric.Triangle(
                  { width:300, height:200, fill:"#666", left:180, top:300 }
               ),

               mountain2: new fabric.Triangle(
                  { width:300, height:200, fill:"#444", left:440, top:300 }
               ),

               sun: new fabric.Circle(
                  { radius:40, fill:"yellow", left:360, top:360 }
               )

            }
         },

         render() {

            var sun = '|pipe$sun'.asInt()
            var objs = this.getObjects()

            var y

            if (sun < 100)
               y = 360 - sun
            else
               y = 260 + (sun - 100)

            objs.sun.set({ left:360, top:y })

  

            if (sun < 30)
               objs.sky.set({ fill:"#1B3B6F" })   
            else if (sun < 60)
               objs.sky.set({ fill:"#3A6EA5" })   
            else if (sun < 100)
               objs.sky.set({ fill:"#87CEEB" })   
            else if (sun < 140)
               objs.sky.set({ fill:"#A0522D" })   
            else if (sun < 180)
               objs.sky.set({ fill:"#3E2723" })  
            else
               objs.sky.set({ fill:"black" })     
         },

         where: {left:0, top:0, width:800, height:500}

   *passed = *cyc_cnt > 200;
   *failed = 1'b0;

\SV
   endmodule
