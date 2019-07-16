//

#ifndef (MainTexture)
     #declare MainTexture = texture {pigment {colour <1,0,0>}}
#end
#ifndef (SecundaryTexture)
     #declare SecundaryTexture = texture {pigment {colour <1,1,0>}}
#end
#ifndef (HightlightTexture)
     #declare HightlightTexture = texture {pigment {colour <0,1,0>}}
#end


#ifndef (Turbo)
    #declare Turbo = 0     // Faster render
    #end
#ifndef (Rockets)
    #declare Rockets = 0  // 0=Off , 1 =On     Feet´s rockets
    #end

// ------------ Some modular custom changes --- Kits de implementos para su mech ---

#ifndef (Wings)
    #declare Wings = 0      // 0=No wings, 1= Wings
    #end



// -------------- XXXXXXXXXXX --- Medidas --- This must be included ----

#declare lenghtupperarmD= 4.125
#declare lenghtpantorrI = 5.75
#declare lenghtpantorrD = 5.75
#declare heightfootL= 1.75
#declare heightfootR= 1.75
#declare widetorso= 9
#declare widebelly= 4.5 //not true but needed for good legs' positioning
#declare heightbelly = 2.75

// ----------- Let's vogue --- Posturitas ;-) -----

//Articulaciones

#declare girXhead = 0
#declare girYhead =0
#declare girZhead =0

#declare girXtorso =0
#declare girYtorso =0
#declare girZtorso =0

#declare girXupperarmD= -180
#declare girYupperarmD= 0
#declare girZupperarmD= 10

#declare girXarmD= 75
#declare girYarmD= -10
#declare girZarmD= 0

#declare girXupperarmI= -180
#declare girYupperarmI= 0
#declare girZupperarmI= -10

#declare girXarmI=75
#declare girYarmI=-10
#declare girZarmI= 0

#declare girXmusloD = 5
#declare girYmusloD = -10
#declare girZmusloD = 10

#declare girXmusloI = 5
#declare girYmusloI = 10
#declare girZmusloI = -10

#declare girXpantorrD = -10
#declare girXpantorrI = -10

#declare flatfootR=yes
#declare flatfootL=yes


// ---------------------

#if (Turbo=1)
    #declare MainTexture = texture {pigment {Yellow}}
    #declare Barrel_Texture = texture {pigment {White}}
    #declare Barrel_Texture2 = texture {pigment {Black}}
    #debug "\nTHE TURBO MODE ON!!!!  Textures will be very different in normal mode.\n"
    #debug "THE TURBO MODE ON!!!!  Check vogue.in to change\n\n"
#end
#if (Rockets=1)
    #debug "\nROCKET PROPULSOR are ON, beware the halos inside them"
    #debug "\n slow down the render a lot"
#end



