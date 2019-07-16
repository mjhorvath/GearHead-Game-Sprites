
// Persistence of Vision Ray Tracer Scene Description File
// File: homid.inc
// Vers: 3
// Desc: include file for generate bipedal beings
// Date: mm/dd/yy
// Auth: Francisco Muñoz Cotobal
// Homid.inc version: Alpha 0.4
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// (c) 23/8/1997

#version 3

//#include "colors.inc"
//#include "textures.inc"
// You must include this files before use this one!!



// ----------------------------------------
#ifndef (MainTexture)
 #ifndef (DMFWood2)
 #warning "colors.inc or textures.inc not #included !!! \n"
 #declare MainTexture = texture{pigment {color rgb <.7,.7,.7>}}
#else
 #declare MainTexture =  texture{pigment {DMFWood2}}
#end
#end

#ifndef (Textjoint) #declare Textjoint = texture{Bronze_Metal} #end


#ifndef(altura) #declare altura=25 #end

// ---------------Vientre-------------------------  Belly
#ifndef(altvientre) #declare altvientre=altura*3/25 #end
#ifndef(anchvientre) #declare anchvientre=altvientre*4/3 #end

#ifndef(vientre)
    #declare vientre= union {
    cylinder {<0,0,0>,
        <0,-altvientre/2,0>,anchvientre*.5
        scale <1,1,.75>
        }
    cone {<0,-altvientre/2,0>,anchvientre*.5
         <0,-altvientre,0>,0
        scale <1,1,.75>
        }

    }
#end


// ---------------Torso-------------------------  Breast
#ifndef(altorso) #declare altorso=altura/5 #end
#ifndef(anchtorso) #declare anchtorso=altorso #end
#ifndef(girXtorso) #declare girXtorso=0 #end
#ifndef(girYtorso) #declare girYtorso=0 #end
#ifndef(girZtorso) #declare girZtorso=0 #end

#ifndef(torso)
    #declare torso= union {
    sphere {<0,anchtorso*.2,0>,anchtorso*.25 texture{Textjoint}}
    cone {<0,anchtorso*.3,0>,anchtorso*.35
        <0,altorso,0>,anchtorso*.5
        scale <1,1,.75>
        }
    }
#end


// ---------------head-------------------------  Head

#ifndef(althead) #declare althead=altorso*.8 #end
#ifndef(anchhead) #declare anchhead=althead*.55 #end
#ifndef(girXhead) #declare girXhead=0 #end
#ifndef(girYhead) #declare girYhead=0 #end
#ifndef(girZhead) #declare girZhead=0 #end
#declare girXhead=girXhead+girXtorso
#declare girYhead=girYhead+girYtorso
#declare girZhead=girZhead+girZtorso

#ifndef(head)
    #declare head= union {
    sphere {<0,althead*.1,0>,althead*.12 texture{Textjoint}}
    sphere {<0,althead*.55,0>,althead*.45
    scale <anchhead/althead,1,anchhead/althead>}
    }
#end

// -------------Brazo Izquierdo--------------------------- Left arm (actualy the right one)
#ifndef (longbrazos) #declare longbrazos=altura*10/25 #end

#ifndef(longantebrazoI) #declare longantebrazoI=longbrazos*5/12 #end
#ifndef(girXantebrazoI) #declare girXantebrazoI=15 #end
#ifndef(girZantebrazoI) #declare girZantebrazoI=170 #end
#declare girXantebrazoI=girXantebrazoI+girXtorso
#declare girZantebrazoI=girZantebrazoI+girZtorso

#ifndef(longbrazoI) #declare longbrazoI=longbrazos*4.5/12 #end
#ifndef(girXbrazoI) #declare girXbrazoI=-50 #end
#ifndef(girZbrazoI) #declare girZbrazoI=-10 #end
#declare girXbrazoI=girXbrazoI+girXantebrazoI
#declare girZbrazoI=girZbrazoI+girZantebrazoI

#ifndef(longhandR) #declare longhandR=longbrazos*2.5/12 #end
#ifndef(girXhandR) #declare girXhandR=0 #end
#declare girXhandR=girXbrazoI+girXhandR
#ifndef(girZhandR) #declare girZhandR=0 #end
#declare girZhandR=girZbrazoI+girZhandR
#ifndef(girYhandR) #declare girYhandR=-15 #end




#ifndef(armR)
    #declare armR= union {
    sphere {<0,0,0>,longantebrazoI/10 texture{Textjoint}}
    box {<-longantebrazoI/10,longantebrazoI/10,-longantebrazoI/10>
        <longantebrazoI/10,longantebrazoI,longantebrazoI/10>}
    }
#end

#ifndef(forearmR)
    #declare forearmR= union {
    sphere {<0,0,0>,longbrazoI/10 texture{Textjoint}}
    box {<-longbrazoI/10,longbrazoI/10,-longbrazoI/10>
        <longbrazoI/10,longbrazoI,longbrazoI/10>}
    }
#end

#ifndef (incmano) #declare incmano=0 #end
#if  (incmano)
 #ifndef (longhand) #declare longhand=longhandR #end
 #include "mano.inc"
 #declare handR=object{hand scale <-1,1,1>}
 #else
#ifndef(handR)
    #declare handR= union {
    sphere {<0,0,0>,longhandR*.15 texture{Textjoint}}
    sphere {<0,longhandR*.55,0>,longhandR*.45
           scale <.25,.9,.5>
           }
    }
#end
#end

// ----------------Brazo Derecho------------------------  Right Arm (well this is the left)

#ifndef(longantebrazoD) #declare longantebrazoD=longbrazos*5/12 #end
#ifndef(girXantebrazoD) #declare girXantebrazoD=-15 #end
#ifndef(girZantebrazoD) #declare girZantebrazoD=190 #end
#declare girXantebrazoD=girXantebrazoD+girXtorso
#declare girZantebrazoD=girZantebrazoD+girZtorso

#ifndef(longbrazoD) #declare longbrazoD=longbrazos*4.5/12 #end
#ifndef(girXbrazoD) #declare girXbrazoD=-20 #end
#ifndef(girZbrazoD) #declare girZbrazoD=10 #end  //Cuidadin al tocar que da aspecto mariposon ;-)
#declare girXbrazoD=girXbrazoD+girXantebrazoD
#declare girZbrazoD=girZbrazoD+girZantebrazoD

#ifndef(longhandL) #declare longhandL=longbrazos*2.5/12 #end
#ifndef(girXhandL) #declare girXhandL=0 #end
#declare girXhandL=girXbrazoD+girXhandL
#ifndef(girZhandL) #declare girZhandL=0 #end
#declare girZhandL=girZbrazoD+girZhandL
#ifndef(girYhandL) #declare girYhandL=-15 #end

#ifndef(armL)
    #declare armL= union {
    sphere {<0,0,0>,longantebrazoD/10 texture{Textjoint}}
    box {<-longantebrazoD/10,longantebrazoD/10,-longantebrazoD/10>
        <longantebrazoD/10,longantebrazoD,longantebrazoD/10>}
    }
#end

#ifndef(forearmL)
    #declare forearmL= union {
    sphere {<0,0,0>,longbrazoD/10 texture{Textjoint}}
    box {<-longbrazoD/10,longbrazoD/10,-longbrazoD/10>
        <longbrazoD/10,longbrazoD,longbrazoD/10>}
    }
#end

#if  (incmano)
 #declare longhand=longhandL
 #declare handL=object{hand}
 #else
  #ifndef(handL)
    #declare handL= union {
    sphere {<0,0,0>,longhandL*.15 texture{Textjoint}}
    sphere {<0,longhandL*.55,0>,longhandL*.45
           scale <.25,.9,.5>
           }
    }
  #end
#end

// -------------Pierna Izquierdo--------------------------- Left leg

#ifndef (longpiernas) #declare longpiernas=altura*12.5/25 #end

#ifndef(longmusloI) #declare longmusloI=longpiernas*4.5/12 #end
#ifndef(anchmusloI) #declare anchmusloI=longpiernas/5 #end
#ifndef(girXmusloI) #declare girXmusloI=0 #end
#ifndef(girZmusloI) #declare girZmusloI=0 #end

#ifndef(longpantorrI) #declare longpantorrI=longpiernas*6/12 #end
#ifndef(girXpantorrI) #declare girXpantorrI=0 #end
#ifndef(girZpantorrI) #declare girZpantorrI=0 #end
#declare girXpantorrI=girXpantorrI+girXmusloI
#declare girZpantorrI=girZpantorrI+girZmusloI

#ifndef(heightfootR) #declare heightfootR=longpiernas*2.5/12 #end
#ifndef(longfootR) #declare longfootR=longpiernas*3/12 #end
#ifndef(girXfootR) #declare girXfootR=0 #end
#declare girXfootR=girXpantorrI+girXfootR
#ifndef(girZfootR) #declare girZfootR=0 #end
#declare girZfootR=girZpantorrI+girZfootR
#ifndef(girYfootR) #declare girYfootR=0 #end




#ifndef(musloI)
    #declare musloI= union {
    sphere {<0,0,0>,longmusloI/9 texture{Textjoint}}
    box {<-longmusloI/8,-longmusloI/10,-longmusloI/8>
        <longmusloI/8,-longmusloI,longmusloI/8>}
    }
#end

#ifndef(pantorrI)
    #declare pantorrI= union {
    sphere {<0,0,0>,longpantorrI/10 texture{Textjoint}}
    box {<-longpantorrI/9,-longpantorrI/10,-longpantorrI/9>
        <longpantorrI/9,-longpantorrI,longpantorrI/9>}
    }
#end

#ifndef(footR)
    #declare footR= union {
    sphere {<0,-heightfootR*.10,0>,heightfootR*.25 texture{Textjoint}}
    box {<-longfootR*.25,-heightfootR*.4,longfootR*.35>
        <longfootR*.25,-heightfootR,-longfootR*.65>}
    }
#end

// -------------Pierna Derecha--------------------------- Right left (again the right one)


#ifndef(longmusloD) #declare longmusloD=longpiernas*4.5/12 #end
#ifndef(anchmusloD) #declare anchmusloD=longpiernas/5 #end
#ifndef(girXmusloD) #declare girXmusloD=0 #end
#ifndef(girZmusloD) #declare girZmusloD=0 #end

#ifndef(longpantorrD) #declare longpantorrD=longpiernas*6/12 #end
#ifndef(girXpantorrD) #declare girXpantorrD=0 #end
#ifndef(girZpantorrD) #declare girZpantorrD=0 #end
#declare girXpantorrD=girXpantorrD+girXmusloD
#declare girZpantorrD=girZpantorrD+girZmusloD

#ifndef(heightfootL) #declare heightfootL=longpiernas*2.5/12 #end
#ifndef(longfootL) #declare longfootL=longpiernas*3/12 #end
#ifndef(girXfootL) #declare girXfootL=0 #end
#declare girXfootL=girXpantorrD+girXfootL
#ifndef(girZfootL) #declare girZfootL=0 #end
#declare girZfootL=girZpantorrD+girZfootL
#ifndef(girYfootL) #declare girYfootL=0 #end




#ifndef(musloD)
    #declare musloD= union {
    sphere {<0,0,0>,longmusloD/10 texture{Textjoint}}
    box {<-longmusloD/8,-longmusloD/10,-longmusloD/8>
        <longmusloD/8,-longmusloD,longmusloD/8>}
    }
#end

#ifndef(pantorrD)
    #declare pantorrD= union {
    sphere {<0,0,0>,longpantorrD/10 texture{Textjoint}}
    box {<-longpantorrD/9,-longpantorrD/10,-longpantorrD/9>
        <longpantorrD/9,-longpantorrD,longpantorrD/9>}
    }
#end

#ifndef(footL)
    #declare footL= union {
    sphere {<0,-heightfootL*.10,0>,heightfootL*.25 texture{Textjoint}}
    box {<-longfootL*.25,-heightfootL*.4,longfootL*.35>
        <longfootL*.25,-heightfootL,-longfootL*.65>}
    }
#end

// ----------------------------------------

#declare pospanza=0
#declare poscuello=vrotate (<0,altorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza

#declare poshombroI=vrotate (<-anchtorso/2,altorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza
#declare poscodoI=vrotate (<0,longantebrazoI,0>,<girXantebrazoI,0,girZantebrazoI>)+poshombroI
#declare posmunyecaI=vrotate (<0,longbrazoI,0>,<girXbrazoI,0,girZbrazoI>)+poscodoI

#declare poshombroD=vrotate (<anchtorso/2,altorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza
#declare poscodoD=vrotate (<0,longantebrazoD,0>,<girXantebrazoD,0,girZantebrazoD>)+poshombroD
#declare posmunyecaD=vrotate (<0,longbrazoD,0>,<girXbrazoD,0,girZbrazoD>)+poscodoD

#declare poscaderaI=vrotate (<(anchmusloI/2)-(anchvientre/2),-altvientre*.8,0>,0)+pospanza
#declare posrodillaI=vrotate (<0,-longmusloI,0>,<girXmusloI,0,girZmusloI>)+poscaderaI
#declare postobilloI=vrotate (<0,-longpantorrI,0>,<girXpantorrI,0,girZpantorrI>)+posrodillaI

#declare poscaderaD=vrotate (<-(anchmusloD/2)+(anchvientre/2),-altvientre*.8,0>,0)+pospanza
#declare posrodillaD=vrotate (<0,-longmusloD,0>,<girXmusloD,0,girZmusloD>)+poscaderaD
#declare postobilloD=vrotate (<0,-longpantorrD,0>,<girXpantorrD,0,girZpantorrD>)+posrodillaD

#declare pospalmaI=vrotate (<0,-longhandR/2,0>,<girXhandR,girYhandR,girYhandR>)+posmunyecaI
#declare pospalmaD=vrotate (<0,-longhandL/2,0>,<girXhandL,girYhandL,girYhandL>)+posmunyecaD

#ifndef (flatfeet) #declare flatfeet= no #end  //To put "flat feets" (no rotated, paralel to floor
#if (flatfeet)
    #ifndef (flatfootL) #declare flatfootL=yes #end
    #ifndef (flatfootR) #declare flatfootR=yes #end
#end
#ifndef (flatfootL) #declare flatfootL=no #end
#ifndef (flatfootR) #declare flatfootR=no #end

#if(flatfootR)
    #declare girXfootR=0
    #declare girZfootR=0
#end

#if(flatfootL)
    #declare girXfootL=0
    #declare girZfootL=0
#end

// ----------------------------------------

#declare homid= union {
object {vientre
              translate pospanza
              }

object {torso
       rotate <girXtorso,girYtorso,girZtorso>
              translate pospanza
              }
object {head
       rotate <girXhead,girYhead,girZhead>
              translate poscuello
              }

object {armR
       rotate <girXantebrazoI,0,girZantebrazoI>
              translate poshombroI
              }
object {forearmR
       rotate <girXbrazoI,0,girZbrazoI>
       translate poscodoI
       }
object {handR
       rotate <girXhandR,girYhandR,girZhandR>
       translate posmunyecaI
       }
object {armL
       rotate <girXantebrazoD,0,girZantebrazoD>
       translate poshombroD
       }

object {forearmL
       rotate <girXbrazoD,0,girZbrazoD>
       translate poscodoD
       }
object {handL
       rotate <girXhandL,girYhandR,girZhandL>
       translate posmunyecaD
       }


object {musloI
       rotate <girXmusloI,0,girZmusloI>
              translate poscaderaI
              }
object {pantorrI
       rotate <girXpantorrI,0,girZpantorrI>
       translate posrodillaI
       }
object {footR
       rotate <girXfootR,girYfootR,girZfootR>
       translate postobilloI
       }


object {musloD
       rotate <girXmusloD,0,girZmusloD>
              translate poscaderaD
              }
object {pantorrD
       rotate <girXpantorrD,0,girZpantorrD>
       translate posrodillaD
       }
object {footL
       rotate <girXfootL,girYfootL,girZfootL>
       translate postobilloD
       }
texture{MainTexture}
}

// ----------------------------------------

