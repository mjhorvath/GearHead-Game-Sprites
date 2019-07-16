
// Persistence of Vision Ray Tracer Scene Description File
// File: mano.inc
// Vers: 3
// Desc: A simple "hand" include file
// Date: 27/8/97
// Auth: Francisco Muñoz (fmunoz@hotmail.com)
// mano.inc version: Alpha 0.2
// Copyright: This is my work if u plagiate it, my curse will fall upon u
// (c) 26/8/1997

#version 3

#ifndef (Texture1) // Wrist texture
        #declare Texture1=texture {pigment {color rgb <.75,.75,.75>}}
#end

#ifndef (Texture2) // Hand texture
        #declare Texture2=texture {pigment {color rgb <.75,.75,.75>}}
#end

#ifndef (Texture3) // Nail texture
        #declare Texture3=texture {pigment {color rgb <.75,.75,.75>}}
#end
// ----------------------------------------
/*
camera
{
  location  <0.0, 5, -15.0>
  look_at   <0.0, 5,  0.0>
}


light_source
{
  0*x // light's position (translated below)
  color red 1.0  green 1.0  blue 1.0  // light's color
  translate <-30, 30, -30>
}
light_source
{
  0*x // light's position (translated below)
  color red 1.0  green 1.0  blue 1.0  // light's color
  translate <30, 30, 30>
}
*/
// ----------------------------------------
#ifndef (poswrist) #declare poswrist=<0,0,0> #end
#ifndef (girTh) #declare girTh=45 #end
#ifndef (girFA) #declare girFA=5 #end
#ifndef (girFB) #declare girFB=85 #end
#ifndef (girFC) #declare girFC=85 #end
#ifndef (girFD) #declare girFD=5 #end
#ifndef (longhand) #declare longhand=10 #end
#ifndef (longTh) #declare longTh=longhand*.6 #end
#ifndef (longFA) #declare longFA=longhand*.95 #end
#ifndef (longFB) #declare longFB=longhand*1 #end
#ifndef (longFC) #declare longFC=longhand*.9 #end
#ifndef (longFD) #declare longFD=longhand*.8 #end


// ----------------------------------------
#declare girTh1=<girTh/2,-girTh/2,-30>
#declare posTh1=vrotate(<0,longTh*.5,0>,girTh1)
#declare girTh2=<girTh/2,0,0>+girTh1
#declare posTh2=vrotate(<0,longTh*.25,0>,girTh2)+posTh1
#declare posTh3=vrotate(<0,longTh*.25,0>,<girTh,-girTh/2,0>+girTh2)+posTh2

#declare posFA1=vrotate(<0,longFA*.5,0>,<0,0,-15>)
#declare posFA2=vrotate(<0,longFA*.17,0>,<girFA,0,-10>)+posFA1
#declare posFA3=vrotate(<0,longFA*.17,0>,<girFA*2,0,-10>)+posFA2
#declare posFA4=vrotate(<0,longFA*.16,0>,<girFA*3,0,-10>)+posFA3
#declare posFB1=vrotate(<0,longFB*.5,0>,0)
#declare posFB2=vrotate(<0,longFB*.17,0>,<girFB,0,0>)+posFB1
#declare posFB3=vrotate(<0,longFB*.17,0>,<girFB*2,0,0>)+posFB2
#declare posFB4=vrotate(<0,longFB*.16,0>,<girFB*3,0,0>)+posFB3
#declare posFC1=vrotate(<0,longFC*.5,0>,<0,0,15>)
#declare posFC2=vrotate(<0,longFC*.17,0>,<girFC,0,10>)+posFC1
#declare posFC3=vrotate(<0,longFC*.17,0>,<girFC*2,0,10>)+posFC2
#declare posFC4=vrotate(<0,longFC*.16,0>,<girFC*3,0,10>)+posFC3
#declare posFD1=vrotate(<0,longFD*.5,0>,<0,0,30>)
#declare posFD2=vrotate(<0,longFD*.17,0>,<girFD,0,20>)+posFD1
#declare posFD3=vrotate(<0,longFD*.17,0>,<girFD*2,0,20>)+posFD2
#declare posFD4=vrotate(<0,longFD*.16,0>,<girFD*3,0,20>)+posFD3
// ----------------------------------------
#ifndef (knucleclass) #declare knucleclass=1 #end
#switch (knucleclass)
       #case (0)
             #ifndef (knucle)
                #warning "Beware!! knucke must be defined to use knucleclass=0 \n"
             #end
       #break
       #case (1)  // Normal knucle
             #declare knuckle=
                 object{sphere {0,longhand/20} texture{Texture2}}
       #break
       #case (2) // Big knucle
             #declare knuckle=object{
                sphere {0,longhand/15 texture{Texture2}}
             }
       #break
       #case (3) // Spiked knucle
             #declare knuckle=union{
                sphere {0,longhand/20 texture{Texture2} }
                cone {0,longhand/20,<0,0,-longhand/10>,0 texture{Texture3}}
             }
       #break
#end
#ifndef (nailclass) #declare nailclass=1 #end
#switch (nailclass)
       #case (0)
             #ifndef (nail)
                #warning "Beware!! nail must be defined to use nailclass=0 \n"
             #end
       #break
       #case (1)  // No nail
             #declare nail=
                 object{sphere {0,longhand/22} texture{Texture2}}
       #break
       #case (2) // No nail, Big
             #declare nail=object{
                sphere {0,longhand/18}
                texture{Texture2}
             }
       #break
       #case (3) // claw
             #declare nail=union{
                sphere {0,longhand/22 texture{Texture2} texture{Texture2}}
                intersection {
                cylinder {0,<0,longhand/5,0>,longhand/22}
                cone {<0,0,-longhand/22>,longhand/22,<0,longhand/5,-longhand/22>,0}
                texture{Texture3}
                }
             }
       #break
#end

// ----------------------------------------
#ifndef (Numberf) #declare Numberf=4 #end

#declare hand=union{

union {
sphere {posTh1,longhand/20}
sphere {posTh2,longhand/20}
object {nail rotate <girTh,-girTh/2,0>+girTh2 translate posTh3}
cylinder {posTh1,posTh2,longhand/20}
cone {posTh2,longhand/20,posTh3,longhand/22}
texture{Texture2}
}

union {
object {knuckle translate posFA1}
sphere {posFA2,longhand/20}
sphere {posFA3,longhand/20}
object {nail rotate <girFA*3,0,-10> translate posFA4}
cylinder {posFA1,posFA2,longhand/20}
cylinder {posFA2,posFA3,longhand/20}
cone {posFA3,longhand/20,posFA4,longhand/22}
texture{Texture2}
}

#if (Numberf>1)
union {
object {knuckle translate posFB1}
sphere {posFB2,longhand/20}
sphere {posFB3,longhand/20}
object {nail rotate <girFB*3,0,0> translate posFB4}
cylinder {posFB1,posFB2,longhand/20}
cylinder {posFB2,posFB3,longhand/20}
cone {posFB3,longhand/20,posFB4,longhand/22}
texture{Texture2}
}
#end

#if (Numberf>2)
union {
object {knuckle translate posFC1}
sphere {posFC2,longhand/20}
sphere {posFC3,longhand/20}
object {nail rotate <girFC*3,0,10> translate posFC4}
cylinder {posFC1,posFC2,longhand/20}
cylinder {posFC2,posFC3,longhand/20}
cone {posFC3,longhand/20,posFC4,longhand/22}
texture{Texture2}
}
#end

#if (Numberf>3)
union{
object {knuckle translate posFD1}
sphere {posFD2,longhand/20}
sphere {posFD3,longhand/20}
object {nail rotate <girFD*3,0,20> translate posFD4}
cylinder {posFD1,posFD2,longhand/20}
cylinder {posFD2,posFD3,longhand/20}
cone {posFD3,longhand/20,posFD4,longhand/22}
texture{Texture2}
}
#end

union{
sphere {poswrist,longhand/10 texture{Texture1}}
cone {poswrist,longhand/15,posTh1,longhand/20}

cylinder {poswrist,posFA1,longhand/20}
cylinder {posTh1,posFA1,longhand/20}
sphere {posTh1,longhand/20}
sphere {posFA1,longhand/20}
triangle {poswrist,posTh1,posFA1}

#if (Numberf>1)
triangle {poswrist,posFA1,posFB1}
sphere {posFB1,longhand/20}
cylinder {posFA1,posFB1,longhand/20}
cylinder {poswrist,posFB1,longhand/20}
#end

#if (Numberf>2)
cylinder {poswrist,posFC1,longhand/20}
triangle {poswrist,posFB1,posFC1}
sphere {posFC1,longhand/20}
cylinder {posFB1,posFC1,longhand/20}
#end

#if (Numberf>3)
cylinder {poswrist,posFD1,longhand/20}
cylinder {posFC1,posFD1,longhand/20}
sphere {posFD1,longhand/20}
triangle {poswrist,posFC1,posFD1}
#end
texture{Texture2}
}
}

// ----------------------------------------
/*
object {hand
rotate y*130}
*/
