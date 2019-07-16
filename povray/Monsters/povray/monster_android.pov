#declare Sprite_Height = 128;
//#declare Show_AxisMarker = 1;
#include "GearHead.inc"
#declare Scale_All = 64/25;

//+KFI1 +KFF8

/*
camera
{
	location  <0.0, 56, 20.0>
//	location  <20.0, 56, 0.0>
	look_at   <0.0, 56,  0.0>
	right     x*image_width/image_height
}
*/

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

#include "colors.inc"
#include "textures.inc"
// You must include this files before use this one!!

// ----------------------------------------
#ifndef (MainTexture)
	#ifndef (DMFWood2)
		#warning "colors.inc or textures.inc not #included !!! \n"
		#declare MainTexture = texture{pigment {color rgb <.7,.7,.7>}}
	#else
//		#declare MainTexture =  texture{pigment {DMFWood2}}
//		#declare MainTexture = Chrome_Metal
		#declare MainTexture = MTX
	#end
#end

#ifndef (Textjoint)
//	#declare Textjoint = Bronze_Metal
	#declare Textjoint = HTX
#end

#ifndef (Textface)
//	#declare Textface = Bronze_Metal
	#declare Textface = CTX
#end

#ifndef(height) #declare height = 25 * Scale_All; #end

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
        scale <1,1,.67>
        }
    cone {<0,heightorso,0>,widetorso*.5,<0,heightorso*1.2,0>,widetorso*.1 scale <1,1,.67>}
    }
#end

// ---------------belly-------------------------  Belly
#ifndef(heightbelly) #declare heightbelly=height*3/25; #end
#ifndef(widebelly) #declare widebelly=heightbelly*4/3; #end

#ifndef(belly)
    #declare belly= union {
    cylinder {<0,0,0>,
        <0,-heightbelly/2,0>,widebelly*.5
        scale <1,1,.67>
        }
    cone {<0,-heightbelly/2,0>,widebelly*.5
         <0,-heightbelly,0>,0
        scale <1,1,.67>
        }
    cone {<0,0,0>,widebelly*.5,<0,heightbelly/2,0>,widebelly*.4 scale <1,1,.67>}

    }
#end

// ---------------head-------------------------  Head

#ifndef(heighthead) #declare heighthead=heightorso*.8; #end
#ifndef(radiusneck) #declare radiusneck=heighthead/7; #end
#ifndef(girXhead) #declare girXhead=0; #end
#ifndef(girYhead) #declare girYhead=0; #end
#ifndef(girZhead) #declare girZhead=0; #end
#declare girXhead=girXhead+girXtorso;
#declare girYhead=girYhead+girYtorso;
#declare girZhead=girZhead+girZtorso;

#ifndef(radiuscranium) #declare radiuscranium=heighthead/4; #end
#declare posYcranium = heighthead/2+radiuscranium;

#ifndef(scaXhead) #declare scaXhead=heighthead/4; #end
#ifndef(scaZhead) #declare scaZhead=heighthead/4; #end
#declare poshead=(heighthead+radiusneck)/2;
#declare radiushead=(heighthead-radiusneck)/2;

#ifndef(neck)
    #declare neck= sphere {<0,0,0>,radiusneck}
#end

#ifndef(head)
    #declare head= union {
    object {neck texture{Textjoint} translate <0,radiusneck,0>}
    cone {<0,radiusneck,0>,radiusneck,<0,posYcranium,0>,radiusneck*3/4 texture{Textjoint}}
	    blob
	    {
	    threshold 0.02
	    sphere {<0,posYcranium-.5,.5>,radiuscranium*1.3, .9 scale <1/1.2,1,1.1>}
	    sphere {<0,poshead,0>,radiushead, 1
	    	scale <scaXhead,radiushead,scaZhead>/radiushead
	//    	clipped_by {object {neck scale 1.2 inverse}}
	    	}
	    	translate <0,0,-2>
//    	    texture{Textjoint}
	    }
    cone {<scaXhead*0.9,poshead,-2>,0.5,<scaXhead*1.1,poshead,-2>,0.25 texture{Textface}}
    cone {<-scaXhead*0.9,poshead,-2>,0.5,<-scaXhead*1.1,poshead,-2>,0.25 texture{Textface}}
    sphere {0,1 texture{Textface} scale <1,0.5,0.5> translate <1,poshead,-3.9>}
    sphere {0,1 texture{Textface} scale <1,0.5,0.5> translate <-1,poshead,-3.9>}
    sphere {0,2 texture{Textface} scale <0.5,0.25,0.25> translate <0,poshead-radiushead/2,-3.75>}//z=0.1
    }
#end

// -------------arm Izquierdo--------------------------- Left arm (actualy the right one)
#ifndef (lenghtarms) #declare lenghtarms=height*10/25; #end

#ifndef(lenghtupperarmI) #declare lenghtupperarmI=lenghtarms*5/12; #end
#ifndef(radiusshoulderI) #declare radiusshoulderI=lenghtupperarmI/6; #end
#ifndef(girXupperarmI) #declare girXupperarmI=15; #end
#ifndef(girYupperarmI) #declare girYupperarmI=0; #end
#ifndef(girZupperarmI) #declare girZupperarmI=170; #end
#declare girXupperarmI=girXupperarmI+girXtorso;
#declare girYupperarmI=girYupperarmI+girYtorso;
#declare girZupperarmI=girZupperarmI+girZtorso;

#ifndef(lenghtarmI) #declare lenghtarmI=lenghtarms*4.5/12; #end
#ifndef(radiuselbowI) #declare radiuselbowI=lenghtarmI/6; #end
#ifndef(girXarmI) #declare girXarmI=-50; #end
#ifndef(girYarmI) #declare girYarmI=0; #end
#ifndef(girZarmI) #declare girZarmI=-10; #end
#declare girXarmI=girXarmI+girXupperarmI;
#declare girYarmI=girYarmI+girYupperarmI;
#declare girZarmI=girZarmI+girZupperarmI;

#ifndef(lenghthandR) #declare lenghthandR=lenghtarms*2.5/12; #end
#ifndef(radiuswristR) #declare radiuswristR=lenghthandR/4; #end
#ifndef(girXhandR) #declare girXhandR=0; #end
#ifndef(girYhandR) #declare girYhandR=-15; #end
#ifndef(girZhandR) #declare girZhandR=0; #end
#declare girXhandR=girXarmI+girXhandR;
#declare girYhandR=girYarmI+girYhandR;
#declare girZhandR=girZarmI+girZhandR;

#ifndef(scaXhandR) #declare scaXhandR=lenghthandR/4; #end
#ifndef(scaZhandR) #declare scaZhandR=lenghthandR/8; #end
#declare poshandR=(lenghthandR+radiuswristR)/2;
#declare radiushandR=(lenghthandR-radiuswristR)/2;

#ifndef (incmano) #declare incmano=0; #end


#ifndef(upperarmR)
    #declare upperarmR= union {
    sphere {0,radiusshoulderI texture{Textjoint} scale y*1/2}
    cone {<0,0,0>, radiusshoulderI,y*lenghtupperarmI, radiuselbowI}
//    box {<-radiusshoulderI,radiusshoulderI,-radiusshoulderI>
//        <radiusshoulderI,lenghtupperarmI-radiuselbowI,radiusshoulderI>}
    }
#end

#ifndef(forearmR)
    #declare forearmR= union {
    sphere {<0,0,0>,radiuselbowI texture{Textjoint}}
    cone {0,radiuselbowI,y*lenghtarmI,radiuswristR}
//    box {<-radiuselbowI,radiuselbowI,-radiuselbowI>
//        <radiuselbowI,lenghtarmI-radiuswristR,radiuselbowI>}
    }
#end

#if  (incmano)
 #ifndef (lenghthand) #declare lenghthand=lenghthandR; #end
 #include "mano.inc"
 #declare handR=object{hand scale <-1,1,1>}
 #else
#ifndef(handR)
    #declare handR= union {
    sphere {<0,0,0>,radiuswristR texture{Textjoint}}
    sphere {<0,poshandR,0>,radiushandR
           scale <scaXhandR,radiushandR,scaZhandR>/radiushandR
           }
     sphere {<0,radiuswristR,0>,lenghthandR/4 scale <2,.33,.33> rotate z*30 translate <radiuswristR,radiuswristR/2,0>}
    }
#end
#end

// ----------------arm Derecho------------------------  Right Arm (well this is the left)

#ifndef(lenghtupperarmD) #declare lenghtupperarmD=lenghtarms*5/12; #end
#ifndef(radiusshoulderD) #declare radiusshoulderD=lenghtupperarmD/6; #end
#ifndef(girXupperarmD) #declare girXupperarmD=-15; #end
#ifndef(girYupperarmD) #declare girYupperarmD=0; #end
#ifndef(girZupperarmD) #declare girZupperarmD=190; #end
#declare girXupperarmD=girXupperarmD+girXtorso;
#declare girYupperarmD=girYupperarmD+girYtorso;
#declare girZupperarmD=girZupperarmD+girZtorso;

#ifndef(lenghtarmD) #declare lenghtarmD=lenghtarms*4.5/12; #end
#ifndef(radiuselbowD) #declare radiuselbowD=lenghtarmD/6; #end
#ifndef(girXarmD) #declare girXarmD=-20; #end
#ifndef(girYarmD) #declare girYarmD=0; #end
#ifndef(girZarmD) #declare girZarmD=10; #end  //Cuidadin al tocar que da aspecto mariposon ;-)
#declare girXarmD=girXarmD+girXupperarmD;
#declare girYarmD=girYarmD+girYupperarmD;
#declare girZarmD=girZarmD+girZupperarmD;

#ifndef(lenghthandL) #declare lenghthandL=lenghtarms*2.5/12; #end
#ifndef(radiuswristL) #declare radiuswristL=lenghthandL/4; #end
#ifndef(girXhandL) #declare girXhandL=0; #end
#ifndef(girYhandL) #declare girYhandL=-15; #end
#ifndef(girZhandL) #declare girZhandL=0; #end
#declare girXhandL=girXarmD+girXhandL;
#declare girYhandL=girYarmD+girYhandL;
#declare girZhandL=girZarmD+girZhandL;

#ifndef(scaXhandL) #declare scaXhandL=lenghthandL/4; #end
#ifndef(scaZhandL) #declare scaZhandL=lenghthandL/8; #end
#declare poshandL=(lenghthandL+radiuswristL)/2;
#declare radiushandL=(lenghthandL-radiuswristL)/2;

#ifndef(upperarmL)
    #declare upperarmL= union {
    sphere {<0,0,0>,radiusshoulderD texture{Textjoint} scale y * 1/2}
    cone {<0,0,0>, radiusshoulderD,y*lenghtupperarmD, radiuselbowD}
//    box {<-radiusshoulderD,radiusshoulderD,-radiusshoulderD>
//        <radiusshoulderD,lenghtupperarmD-radiuselbowD,radiusshoulderD>}
    }
#end

#ifndef(forearmL)
    #declare forearmL= union {
    sphere {<0,0,0>,radiuselbowD texture{Textjoint}}
    cone {0,radiuselbowD,y*lenghtarmD,radiuswristL}
//    box {<-radiuselbowD,radiuselbowD,-radiuselbowD>
//        <radiuselbowD,lenghtarmD-radiuswristL,radiuselbowD>}
    }
#end

#if  (incmano)
// #ifndef (lenghthand) #declare lenghthand=lenghthandL; #end
// #include "mano.inc"
 #declare lenghthand=lenghthandL;
 #declare handL=object{hand scale <-1,1,1>}
 #else
#ifndef(handL)
    #declare handL= union {
    sphere {<0,0,0>,radiuswristL texture{Textjoint}}
    sphere {<0,poshandL,0>,radiushandL
           scale <scaXhandL,radiushandL,scaZhandL>/radiushandL
           }
     sphere {<0,radiuswristL,0>,lenghthandL/4 scale <2,.33,.33> rotate z*-30 translate <-radiuswristL,radiuswristL/2,0>}
    }
#end
#end

// -------------Pierna Izquierdo--------------------------- Left leg

#ifndef (lenghtpiernas) #declare lenghtpiernas=height*12.5/25; #end

#ifndef(lenghtmusloI) #declare lenghtmusloI=lenghtpiernas*4.5/12; #end
#ifndef(radiushipI) #declare radiushipI=lenghtmusloI/4.5; #end
#ifndef(widemusloI) #declare widemusloI=lenghtpiernas/5; #end
#ifndef(girXmusloI) #declare girXmusloI=0; #end
#ifndef(girYmusloI) #declare girYmusloI=0; #end
#ifndef(girZmusloI) #declare girZmusloI=0; #end

#ifndef(lenghtpantorrI) #declare lenghtpantorrI=lenghtpiernas*6/12; #end
#ifndef(radiuskneeI) #declare radiuskneeI=lenghtpantorrI/6; #end
#ifndef(girXpantorrI) #declare girXpantorrI=0; #end
#ifndef(girYpantorrI) #declare girYpantorrI=0; #end
#ifndef(girZpantorrI) #declare girZpantorrI=0; #end
#declare girXpantorrI=girXpantorrI+girXmusloI;
#declare girYpantorrI=girYpantorrI+girYmusloI;
#declare girZpantorrI=girZpantorrI+girZmusloI;

#ifndef(heightfootR) #declare heightfootR=lenghtpiernas*2.5/16; #end
#ifndef(lenghtfootR) #declare lenghtfootR=lenghtpiernas*3/9; #end
#ifndef(radiusankleR) #declare radiusankleR=heightfootR/3; #end
#ifndef(girXfootR) #declare girXfootR=0; #end
#declare girXfootR=girXpantorrI+girXfootR;
#ifndef(girZfootR) #declare girZfootR=0; #end
#declare girZfootR=girZpantorrI+girZfootR;
#ifndef(girYfootR) #declare girYfootR=girYmusloI+girYpantorrI; #end

#ifndef(scaXFootR) #declare scaXFootR=lenghtfootR/4; #end
#ifndef(scaZFootR) #declare scaZFootR=lenghtfootR/2; #end
#declare posfootR=(heightfootR+radiusankleR)/2;
#declare radiusfootR=radiusankleR;


#ifndef(musloI)
    #declare musloI= union {
    sphere {<0,0,0>,radiushipI texture{Textjoint} scale y * 2}
    cone {0,radiushipI,y*-lenghtmusloI,radiuskneeI}
//    box {<-radiushipI,-radiushipI,-radiushipI>
//        <radiushipI,-lenghtmusloI+radiuskneeI,radiushipI>}
    }
#end

#ifndef(pantorrI)
    #declare pantorrI= union {
    sphere {<0,0,0>,radiuskneeI texture{Textjoint}}
    cone {0,radiuskneeI,y*-lenghtpantorrI,radiusankleR}
//    box {<-radiuskneeI,-radiuskneeI,-radiuskneeI>
//        <radiuskneeI,-lenghtpantorrI+radiusankleR,radiuskneeI>}
    }
#end

#ifndef(footR)
    #declare footR= union {
    sphere {<0,0,0>,radiusankleR texture{Textjoint}}
    cone {<0,-posfootR,-lenghtfootR*.65>,radiusfootR*.75,<0,-posfootR,0.5>,radiusfootR}
    sphere {<0,-posfootR,0.5>,radiusfootR}
    clipped_by {plane {y,-posfootR*1.2 inverse}}
//    box {<-scaXFootR,-posfootR-radiusfootR,lenghtfootR*.35>
//        <scaXFootR,-posfootR+radiusfootR,-lenghtfootR*.65>}
    }

#end

// -------------Pierna Derecha--------------------------- Right left (again the right one)


#ifndef(lenghtmusloD) #declare lenghtmusloD=lenghtpiernas*4.5/12; #end
#ifndef(radiushipD) #declare radiushipD=lenghtmusloD/4.5; #end
#ifndef(widemusloD) #declare widemusloD=lenghtpiernas/5; #end
#ifndef(girXmusloD) #declare girXmusloD=0; #end
#ifndef(girYmusloD) #declare girYmusloD=0; #end
#ifndef(girZmusloD) #declare girZmusloD=0; #end

#ifndef(lenghtpantorrD) #declare lenghtpantorrD=lenghtpiernas*6/12; #end
#ifndef(radiuskneeD) #declare radiuskneeD=lenghtpantorrD/6; #end
#ifndef(girXpantorrD) #declare girXpantorrD=0; #end
#ifndef(girYpantorrD) #declare girYpantorrD=0; #end
#ifndef(girZpantorrD) #declare girZpantorrD=0; #end
#declare girXpantorrD=girXpantorrD+girXmusloD;
#declare girYpantorrD=girYpantorrD+girYmusloD;
#declare girZpantorrD=girZpantorrD+girZmusloD;

#ifndef(heightfootL) #declare heightfootL=lenghtpiernas*2.5/16; #end
#ifndef(radiusankleL) #declare radiusankleL=heightfootL/3; #end
#ifndef(lenghtfootL) #declare lenghtfootL=lenghtpiernas*3/9; #end
#ifndef(girXfootL) #declare girXfootL=0; #end
#declare girXfootL=girXpantorrD+girXfootL;
#ifndef(girZfootL) #declare girZfootL=0; #end
#declare girZfootL=girZpantorrD+girZfootL;
#ifndef(girYfootL) #declare girYfootL=girYmusloD+girYpantorrD; #end

#ifndef(scaXFootL) #declare scaXFootL=lenghtfootL/4; #end
#ifndef(scaZFootL) #declare scaZFootL=lenghtfootL/2; #end
#declare posfootL=(heightfootL+radiusankleL)/2;
#declare radiusfootL=radiusankleL;


#ifndef(musloD)
    #declare musloD= union {
    sphere {<0,0,0>,radiushipD texture{Textjoint} scale y * 2}
    cone {0,radiushipD,y*-lenghtmusloD,radiuskneeD}
//    box {<-radiushipD,-radiushipD,-radiushipD>
//        <radiushipD,-lenghtmusloD+radiuskneeD,radiushipD>}
    }
#end

#ifndef(pantorrD)
    #declare pantorrD= union {
    sphere {<0,0,0>,radiuskneeD texture{Textjoint}}
    cone {0,radiuskneeD,y*-lenghtpantorrD,radiusankleL}
//    box {<-radiuskneeD,-radiuskneeD,-radiuskneeD>
//        <radiuskneeD,-lenghtpantorrD+radiusankleL,radiuskneeD>}
    }
#end

#ifndef(footL)
    #declare footL= union {
    sphere {<0,0,0>,radiusankleL texture{Textjoint}}
    cone {<0,-posfootL,-lenghtfootL*.65>,radiusfootL*.75,<0,-posfootL,0.5>,radiusfootL}
    sphere {<0,-posfootL,0.5>,radiusfootL}
//    sphere {<0,-posfootL,-lenghtfootL*.65>,radiusfootL*.75}
    clipped_by {plane {y,-posfootL*1.2 inverse}}
//    box {<-scaXFootL,-posfootL-radiusfootL,lenghtfootL*.35>
//        <scaXFootL,-posfootL+radiusfootL,-lenghtfootL*.65>}
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
		texture {MainTexture}
	}
	difference
	{
		object
		{
			torso
			rotate <girXtorso,girYtorso,girZtorso>
			translate pospanza
		}
		object
		{
			neck
			scale 1.2
			translate <0,radiusneck,0>
			rotate <girXhead,girYhead,girZhead>
			translate poscuello
		}
		texture {MainTexture}
	}
	object
	{
		head
		rotate <girXhead,girYhead,girZhead>
		translate poscuello
		texture {MainTexture}
	}
	object
	{
		upperarmR
		rotate <girXupperarmI,girYupperarmI,girZupperarmI>
		translate poshombroI
		texture {MainTexture}
	}
	object
	{
		forearmR
		rotate <girXarmI,girYupperarmI,girZarmI>
		translate poscodoI
		texture {MainTexture}
	}
	object
	{
		handR
		rotate <girXhandR,girYhandR,girZhandR>
		translate posmunyecaI
		texture {MainTexture}
	}
	object
	{
		upperarmL
		rotate <girXupperarmD,girYupperarmD,girZupperarmD>
		translate poshombroD
		texture {MainTexture}
	}
	object
	{
		forearmL
		rotate <girXarmD,girYarmD,girZarmD>
		translate poscodoD
		texture {MainTexture}
	}
	object
	{
		handL
		rotate <girXhandL,girYhandL,girZhandL>
		translate posmunyecaD
		texture {MainTexture}
	}
	object
	{
		musloI
		rotate <girXmusloI,girYmusloI,girZmusloI>
		translate poscaderaI
		texture {MainTexture}
	}
	object
	{
		pantorrI
		rotate <girXpantorrI,girYmusloI,girZpantorrI>
		translate posrodillaI
		texture {MainTexture}
	}
	object
	{
		footR
		rotate <girXfootR,girYfootR,girZfootR>
		translate postobilloI
		texture {MainTexture}
	}
	object
	{
		musloD
		rotate <girXmusloD,girYmusloD,girZmusloD>
		translate poscaderaD
		texture {MainTexture}
	}
	object
	{
		pantorrD
		rotate <girXpantorrD,girYmusloD,girZpantorrD>
		translate posrodillaD
		texture {MainTexture}
	}
	object
	{
		footL
		rotate <girXfootL,girYfootL,girZfootL>
		translate postobilloD
		texture {MainTexture}
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
//	rotate y * 180
	rotate y * clock * 360
//	finish {Default_Finish}
	translate y * (Height/2 - 2)
}
