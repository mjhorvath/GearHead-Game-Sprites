# GearHead Game Sprites

## Introduction

The sprites in this library are meant to work with Michael Horvath's fork of _GearHead: Arena_ v1.100.

https://github.com/mjhorvath/gearhead-1

The images in the majority of the sub-directories of the "demos" directory are used only for the various HTML demonstration mockups. Images within the "blue" directories can be imported/copied directly into the game without problems, however. To assemble the other images into GearHead-compatible sprites, install ImageMagick and use the tools in the "tools" directory. Instructions on how to use these tools can be found in their respective sub-directories, as well as in the two tutorials linked to below.


## How the POV-Ray stuff works

1. First, in POV-Ray go to "Render" and click on "Edit Settings/Render".
1. Click "Browse" and navigate to where "GearHead.ini" is located. This should be the top-level folder where you extracted the archive.
1. Click "Set but don't render".
1. In the drop-down menu at the top-left of the window select the desired image settings (resolution, alpha channel, animation, etc.). This should be "64x128, AA, Alpha, Anim 16" for thin wall sprites; "64x128, No AA, No Alpha, Anim 8" for mecha sprites; and "64x128, AA, Alpha, Anim 1" for ground tile sprites.
1. Use my tool GH Appender to crop and assemble the sprites into sprite sheets.

This library has a lot of depencies that you will need to track down and install yourself. I could not include them all due to licensing restrictions. Once you have located and downloaded the dependencies, you will need to add them to the Library_Path section of "GearHead.ini".

Clues to where you can track down these dependencies can be found [here](credits.md).


## Models

The source 3D models for the sprites are included. The majority of the models are by Mladen Pejic, Randy & Ron Perovich and Timothy Gould, and are used with permission. Unfortunately, I didn't keep careful track of which models were made by whom. However, their websites can be found at the following URLs:

* http://www3.sympatico.ca/mladenpejic/ (Mladen Pejic)
* http://www.legomechwarrior.net/ (Randy & Ron Perovich)
* http://www.ldraw.org/Article410.html (Timothy Gould)

Files in LDR or MPD format require the LDraw library of tools in order to view or edit them.


## Sprites

Sprites are sorted into several categories (and folders) based on a combination of:

1. small, medium and large sizes
1. alpha, dithered and NoAA transparency

An explanation is as follows:

* The "small", "medium" and "large" categories should be self-explanatory. Sprites are either bigger or smaller.
* "Alpha" means the image uses anti-aliasing and is composed on top of an 8 bit alpha channel. This results in a total of 32 bits and smooth blending around the edges. Unfortunately, GearHead does not support 32 bit images, requiring the implementation of workarounds in the form of the two remaining groups.
* "Dithered" means the image's transparency and anti-aliasing data has been baked into the 24 bit image, producing a "dithered" or speckled effect around the edges. Looks noticeably grainy.
* "NoAA" means no anti-aliasing has been done at all. The image is 24 bits. Lacks detail around the mecha edges and borders.

Of course, in order to make the sprites render properly in the HTML mockups, an alpha channel was added to the images, regardless of the technique used - meaning all images were turned into 32 bit images for the demos and mockups. You can safely remove the alpha channels for images in the "dithered" and "NoAA" categories when importing them into the game. The sprites in the "blue" folders have already been composited onto a blue background and are ready to be used in the game.

For a better and more complete explanation of the terminology and techniques used, read these two tutorials on my website:

* http://isometricland.net/gearhead/gh-sprite-assembly.php
* http://isometricland.net/gearhead/gh-sprite-dithering.php

The above tools and tutorials require that ImageMagick also be installed on your system.


## Licenses

1. All mecha models are copyright © their original authors, and are used with permission.
1. The exceptions are mecha models by Michael Horvath, which are CC BY-SA.
1. POV-Ray scripts by Michael Horvath are CC BY-SA.
1. Sprite Tools by Michael Horvath are LGPL 2.1.
1. _GearHead: Arena_ is licensed under the LGPL 2.1.
1. The GearHead Universe is Copyright 2005 by Joseph Hewitt.
