//#declare Show_AxisMarker = 1;
#include "GearHead.inc"

// Persistence of Vision Ray Tracer Scene Description File
// File: homid.inc
// Vers: 3
// Desc: include file for generate bipedal beings
// Date: mm/dd/yy
// Auth: Francisco Mu�oz Cotobal
// Homid.inc version: Alpha 0.4
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// (c) 23/8/1997

//#version 3

#include "colors.inc"
#include "textures.inc"
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

#ifndef(height) #declare height = 64; #end

// ---------------belly-------------------------  Belly
#ifndef(heightbelly) #declare heightbelly=height*3/25; #end
#ifndef(widebelly) #declare widebelly=heightbelly*4/3; #end

#ifndef(belly)
    #declare belly= union {
    cylinder {<0,0,0>,
        <0,-heightbelly/2,0>,widebelly*.5
        scale <1,1,.75>
        }
    cone {<0,-heightbelly/2,0>,widebelly*.5
         <0,-heightbelly,0>,0
        scale <1,1,.75>
        }

    }
#end


// ---------------Torso-------------------------  Breast
#ifndef(heightorso) #declare heightorso=height/5; #end
#ifndef(widetorso) #declare widetorso=heightorso; #end
#ifndef(girXtorso) #declare girXtorso=0; #end
#ifndef(girYtorso) #declare girYtorso=0; #end
#ifndef(girZtorso) #declare girZtorso=0; #end

#ifndef(torso)
    #declare torso= union {
    sphere {<0,widetorso*.2,0>,widetorso*.25 texture{Textjoint}}
    cone {<0,widetorso*.3,0>,widetorso*.35
        <0,heightorso,0>,widetorso*.5
        scale <1,1,.75>
        }
    }
#end


// ---------------head-------------------------  Head

#ifndef(heighthead) #declare heighthead=heightorso*.8; #end
#ifndef(widehead) #declare widehead=heighthead*.55; #end
#ifndef(girXhead) #declare girXhead=0; #end
#ifndef(girYhead) #declare girYhead=0; #end
#ifndef(girZhead) #declare girZhead=0; #end
#declare girXhead=girXhead+girXtorso;
#declare girYhead=girYhead+girYtorso;
#declare girZhead=girZhead+girZtorso;

#ifndef(head)
    #declare head= union {
    sphere {<0,heighthead*.1,0>,heighthead*.12 texture{Textjoint}}
    sphere {<0,heighthead*.55,0>,heighthead*.45
    scale <widehead/heighthead,1,widehead/heighthead>}
    }
#end

// -------------arm Izquierdo--------------------------- Left arm (actualy the right one)
#ifndef (lenghtarms) #declare lenghtarms=height*10/25; #end

#ifndef(lenghtupperarmI) #declare lenghtupperarmI=lenghtarms*5/12; #end
#ifndef(girXupperarmI) #declare girXupperarmI=15; #end
#ifndef(girYupperarmI) #declare girYupperarmI=0; #end
#ifndef(girZupperarmI) #declare girZupperarmI=170; #end
#declare girXupperarmI=girXupperarmI+girXtorso;
#declare girYupperarmI=girYupperarmI+girYtorso;
#declare girZupperarmI=girZupperarmI+girZtorso;

#ifndef(lenghtarmI) #declare lenghtarmI=lenghtarms*4.5/12; #end
#ifndef(girXarmI) #declare girXarmI=-50; #end
#ifndef(girYarmI) #declare girYarmI=0; #end
#ifndef(girZarmI) #declare girZarmI=-10; #end
#declare girXarmI=girXarmI+girXupperarmI;
#declare girYarmI=girYarmI+girYupperarmI;
#declare girZarmI=girZarmI+girZupperarmI;

#ifndef(lenghthandR) #declare lenghthandR=lenghtarms*2.5/12; #end
#ifndef(girXhandR) #declare girXhandR=0; #end
#ifndef(girYhandR) #declare girYhandR=-15; #end
#ifndef(girZhandR) #declare girZhandR=0; #end
#declare girXhandR=girXarmI+girXhandR;
#declare girYhandR=girYarmI+girYhandR;
#declare girZhandR=girZarmI+girZhandR;




#ifndef(upperarmR)
    #declare upperarmR= union {
    sphere {<0,0,0>,lenghtupperarmI/10 texture{Textjoint}}
    box {<-lenghtupperarmI/10,lenghtupperarmI/10,-lenghtupperarmI/10>
        <lenghtupperarmI/10,lenghtupperarmI,lenghtupperarmI/10>}
    }
#end

#ifndef(forearmR)
    #declare forearmR= union {
    sphere {<0,0,0>,lenghtarmI/10 texture{Textjoint}}
    box {<-lenghtarmI/10,lenghtarmI/10,-lenghtarmI/10>
        <lenghtarmI/10,lenghtarmI,lenghtarmI/10>}
    }
#end

#ifndef (incmano) #declare incmano=0; #end
#if  (incmano)
 #ifndef (lenghthand) #declare lenghthand=lenghthandR; #end
 #include "mano.inc"
 #declare handR=object{hand scale <-1,1,1>}
 #else
#ifndef(handR)
    #declare handR= union {
    sphere {<0,0,0>,lenghthandR*.15 texture{Textjoint}}
    sphere {<0,lenghthandR*.55,0>,lenghthandR*.45
           scale <.25,.9,.5>
           }
    }
#end
#end

// ----------------arm Derecho------------------------  Right Arm (well this is the left)

#ifndef(lenghtupperarmD) #declare lenghtupperarmD=lenghtarms*5/12; #end
#ifndef(girXupperarmD) #declare girXupperarmD=-15; #end
#ifndef(girYupperarmD) #declare girYupperarmD=0; #end
#ifndef(girZupperarmD) #declare girZupperarmD=190; #end
#declare girXupperarmD=girXupperarmD+girXtorso;
#declare girYupperarmD=girYupperarmD+girYtorso;
#declare girZupperarmD=girZupperarmD+girZtorso;

#ifndef(lenghtarmD) #declare lenghtarmD=lenghtarms*4.5/12; #end
#ifndef(girXarmD) #declare girXarmD=-20; #end
#ifndef(girYarmD) #declare girYarmD=0; #end
#ifndef(girZarmD) #declare girZarmD=10; #end  //Cuidadin al tocar que da aspecto mariposon ;-)
#declare girXarmD=girXarmD+girXupperarmD;
#declare girYarmD=girYarmD+girYupperarmD;
#declare girZarmD=girZarmD+girZupperarmD;

#ifndef(lenghthandL) #declare lenghthandL=lenghtarms*2.5/12; #end
#ifndef(girXhandL) #declare girXhandL=0; #end
#ifndef(girYhandL) #declare girYhandL=-15; #end
#ifndef(girZhandL) #declare girZhandL=0; #end
#declare girXhandL=girXarmD+girXhandL;
#declare girYhandL=girYarmD+girYhandL;
#declare girZhandL=girZarmD+girZhandL;

#ifndef(upperarmL)
    #declare upperarmL= union {
    sphere {<0,0,0>,lenghtupperarmD/10 texture{Textjoint}}
    box {<-lenghtupperarmD/10,lenghtupperarmD/10,-lenghtupperarmD/10>
        <lenghtupperarmD/10,lenghtupperarmD,lenghtupperarmD/10>}
    }
#end

#ifndef(forearmL)
    #declare forearmL= union {
    sphere {<0,0,0>,lenghtarmD/10 texture{Textjoint}}
    box {<-lenghtarmD/10,lenghtarmD/10,-lenghtarmD/10>
        <lenghtarmD/10,lenghtarmD,lenghtarmD/10>}
    }
#end

#if  (incmano)
 #declare lenghthand=lenghthandL
 #declare handL=object{hand}
 #else
  #ifndef(handL)
    #declare handL= union {
    sphere {<0,0,0>,lenghthandL*.15 texture{Textjoint}}
    sphere {<0,lenghthandL*.55,0>,lenghthandL*.45
           scale <.25,.9,.5>
           }
    }
  #end
#end

// -------------Pierna Izquierdo--------------------------- Left leg

#ifndef (lenghtpiernas) #declare lenghtpiernas=height*12.5/25; #end

#ifndef(lenghtmusloI) #declare lenghtmusloI=lenghtpiernas*4.5/12; #end
#ifndef(widemusloI) #declare widemusloI=lenghtpiernas/5; #end
#ifndef(girXmusloI) #declare girXmusloI=0; #end
#ifndef(girYmusloI) #declare girYmusloI=0; #end
#ifndef(girZmusloI) #declare girZmusloI=0; #end

#ifndef(lenghtpantorrI) #declare lenghtpantorrI=lenghtpiernas*6/12; #end
#ifndef(girXpantorrI) #declare girXpantorrI=0; #end
#ifndef(girYpantorrI) #declare girYpantorrI=0; #end
#ifndef(girZpantorrI) #declare girZpantorrI=0; #end
#declare girXpantorrI=girXpantorrI+girXmusloI;
#declare girYpantorrI=girYpantorrI+girYmusloI;
#declare girZpantorrI=girZpantorrI+girZmusloI;

#ifndef(heightfootR) #declare heightfootR=lenghtpiernas*2.5/12; #end
#ifndef(lenghtfootR) #declare lenghtfootR=lenghtpiernas*3/12; #end
#ifndef(girXfootR) #declare girXfootR=0; #end
#declare girXfootR=girXpantorrI+girXfootR;
#ifndef(girZfootR) #declare girZfootR=0; #end
#declare girZfootR=girZpantorrI+girZfootR;
#ifndef(girYfootR) #declare girYfootR=girYmusloI+girYpantorrI; #end




#ifndef(musloI)
    #declare musloI= union {
    sphere {<0,0,0>,lenghtmusloI/9 texture{Textjoint}}
    box {<-lenghtmusloI/8,-lenghtmusloI/10,-lenghtmusloI/8>
        <lenghtmusloI/8,-lenghtmusloI,lenghtmusloI/8>}
    }
#end

#ifndef(pantorrI)
    #declare pantorrI= union {
    sphere {<0,0,0>,lenghtpantorrI/10 texture{Textjoint}}
    box {<-lenghtpantorrI/9,-lenghtpantorrI/10,-lenghtpantorrI/9>
        <lenghtpantorrI/9,-lenghtpantorrI,lenghtpantorrI/9>}
    }
#end

#ifndef(footR)
    #declare footR= union {
    sphere {<0,-heightfootR*.10,0>,heightfootR*.25 texture{Textjoint}}
    box {<-lenghtfootR*.25,-heightfootR*.4,lenghtfootR*.35>
        <lenghtfootR*.25,-heightfootR,-lenghtfootR*.65>}
    }
#end

// -------------Pierna Derecha--------------------------- Right left (again the right one)


#ifndef(lenghtmusloD) #declare lenghtmusloD=lenghtpiernas*4.5/12; #end
#ifndef(widemusloD) #declare widemusloD=lenghtpiernas/5; #end
#ifndef(girXmusloD) #declare girXmusloD=0; #end
#ifndef(girYmusloD) #declare girYmusloD=0; #end
#ifndef(girZmusloD) #declare girZmusloD=0; #end

#ifndef(lenghtpantorrD) #declare lenghtpantorrD=lenghtpiernas*6/12; #end
#ifndef(girXpantorrD) #declare girXpantorrD=0; #end
#ifndef(girYpantorrD) #declare girYpantorrD=0; #end
#ifndef(girZpantorrD) #declare girZpantorrD=0; #end
#declare girXpantorrD=girXpantorrD+girXmusloD;
#declare girYpantorrD=girYpantorrD+girYmusloD;
#declare girZpantorrD=girZpantorrD+girZmusloD;

#ifndef(heightfootL) #declare heightfootL=lenghtpiernas*2.5/12; #end
#ifndef(lenghtfootL) #declare lenghtfootL=lenghtpiernas*3/12; #end
#ifndef(girXfootL) #declare girXfootL=0; #end
#declare girXfootL=girXpantorrD+girXfootL;
#ifndef(girZfootL) #declare girZfootL=0; #end
#declare girZfootL=girZpantorrD+girZfootL;
#ifndef(girYfootL) #declare girYfootL=girYmusloD+girYpantorrD; #end




#ifndef(musloD)
    #declare musloD= union {
    sphere {<0,0,0>,lenghtmusloD/10 texture{Textjoint}}
    box {<-lenghtmusloD/8,-lenghtmusloD/10,-lenghtmusloD/8>
        <lenghtmusloD/8,-lenghtmusloD,lenghtmusloD/8>}
    }
#end

#ifndef(pantorrD)
    #declare pantorrD= union {
    sphere {<0,0,0>,lenghtpantorrD/10 texture{Textjoint}}
    box {<-lenghtpantorrD/9,-lenghtpantorrD/10,-lenghtpantorrD/9>
        <lenghtpantorrD/9,-lenghtpantorrD,lenghtpantorrD/9>}
    }
#end

#ifndef(footL)
    #declare footL= union {
    sphere {<0,-heightfootL*.10,0>,heightfootL*.25 texture{Textjoint}}
    box {<-lenghtfootL*.25,-heightfootL*.4,lenghtfootL*.35>
        <lenghtfootL*.25,-heightfootL,-lenghtfootL*.65>}
    }
#end

// ----------------------------------------

#declare pospanza=0;
#declare poscuello=vrotate (<0,heightorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza;

#declare poshombroI=vrotate (<-widetorso/2,heightorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza;
#declare poscodoI=vrotate (<0,lenghtupperarmI,0>,<girXupperarmI,girYupperarmI,girZupperarmI>)+poshombroI;
#declare posmunyecaI=vrotate (<0,lenghtarmI,0>,<girXarmI,girYarmI,girZarmI>)+poscodoI;

#declare poshombroD=vrotate (<widetorso/2,heightorso,0>,<girXtorso,girYtorso,girZtorso>)+pospanza;
#declare poscodoD=vrotate (<0,lenghtupperarmD,0>,<girXupperarmD,girYupperarmD,girZupperarmD>)+poshombroD;
#declare posmunyecaD=vrotate (<0,lenghtarmD,0>,<girXarmD,girYarmD,girZarmD>)+poscodoD;

#declare poscaderaI=vrotate (<(widemusloI/2)-(widebelly/1.75),-heightbelly*.8,0>,0)+pospanza;
#declare posrodillaI=vrotate (<0,-lenghtmusloI,0>,<girXmusloI,girYmusloI,girZmusloI>)+poscaderaI;
#declare postobilloI=vrotate (<0,-lenghtpantorrI,0>,<girXpantorrI,girYmusloI,girZpantorrI>)+posrodillaI;

#declare poscaderaD=vrotate (<-(widemusloD/2)+(widebelly/1.75),-heightbelly*.8,0>,0)+pospanza;
#declare posrodillaD=vrotate (<0,-lenghtmusloD,0>,<girXmusloD,girYmusloD,girZmusloD>)+poscaderaD;
#declare postobilloD=vrotate (<0,-lenghtpantorrD,0>,<girXpantorrD,girYmusloD,girZpantorrD>)+posrodillaD;

#declare pospalmaI=vrotate (<0,-lenghthandR/2,0>,<girXhandR,girYhandR,girYhandR>)+posmunyecaI;
#declare pospalmaD=vrotate (<0,-lenghthandL/2,0>,<girXhandL,girYhandL,girYhandL>)+posmunyecaD;

#ifndef (flatfeet) #declare flatfeet= no; #end  //To put "flat feets" (no rotated, paralel to floor
#if (flatfeet)
    #ifndef (flatfootL) #declare flatfootL=yes; #end
    #ifndef (flatfootR) #declare flatfootR=yes; #end
#end
#ifndef (flatfootL) #declare flatfootL=no; #end
#ifndef (flatfootR) #declare flatfootR=no; #end

#if(flatfootR)
    #declare girXfootR=0;
    #declare girZfootR=0;
#end

#if(flatfootL)
    #declare girXfootL=0;
    #declare girZfootL=0;
#end

// ----------------------------------------

#declare homid = union
{
	object
	{
		belly
		translate pospanza
	}
	object
	{
		torso
		rotate <girXtorso,girYtorso,girZtorso>
		translate pospanza
	}
	object
	{
		head
		rotate <girXhead,girYhead,girZhead>
		translate poscuello
	}
	object
	{
		upperarmR
		rotate <girXupperarmI,girYupperarmI,girZupperarmI>
		translate poshombroI
	}
	object
	{
		forearmR
		rotate <girXarmI,girYupperarmI,girZarmI>
		translate poscodoI
	}
	object
	{
		handR
		rotate <girXhandR,girYhandR,girZhandR>
		translate posmunyecaI
	}
	object
	{
		upperarmL
		rotate <girXupperarmD,girYupperarmD,girZupperarmD>
		translate poshombroD
	}
	object
	{
		forearmL
		rotate <girXarmD,girYarmD,girZarmD>
		translate poscodoD
	}
	object
	{
		handL
		rotate <girXhandL,girYhandR,girZhandL>
		translate posmunyecaD
	}
	object
	{
		musloI
		rotate <girXmusloI,girYmusloI,girZmusloI>
		translate poscaderaI
	}
	object
	{
		pantorrI
		rotate <girXpantorrI,girYmusloI,girZpantorrI>
		translate posrodillaI
	}
	object
	{
		footR
		rotate <girXfootR,girYfootR,girZfootR>
		translate postobilloI
	}
	object
	{
		musloD
		rotate <girXmusloD,girYmusloD,girZmusloD>
		translate poscaderaD
	}
	object
	{
		pantorrD
		rotate <girXpantorrD,girYmusloD,girZpantorrD>
		translate posrodillaD
	}
	object
	{
		footL
		rotate <girXfootL,girYfootL,girZfootL>
		translate postobilloD
	}
	texture
	{
		MainTexture
	}
}

// ----------------------------------------

/* Some notes:
  The rotation <0,0,0> in the arms gets a "hands up" posture
  there are yet some bugs in this version (mostly by stupid mistakes
    and a very bad english vocabulary)
*/

object
{
	homid
	rotate y * 135
	rotate y * clock * 360
	finish {Default_Finish}
	translate y * Height/2
}
