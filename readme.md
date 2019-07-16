# GearHead Game Sprites

The sprites in this library are meant to work with Michael Horvath's fork of _GearHead: Arena_ v1.100.

https://github.com/mjhorvath/gearhead-1

## How the POV-Ray stuff works

1. First, in POV-Ray go to "Render" and click on "Edit Settings/Render".
1. Click "Browse" and navigate to where "GearHead.ini" is located. This should be the top-level folder where you extracted the archive.
1. Click "Set but don't render".
1. In the drop-down menu at the top-left of the window select the desired image settings (resolution, alpha channel, animation, etc.). This should be "64x128, AA, Alpha, Anim 16" for thin wall sprites; "64x128, No AA, No Alpha, Anim 8" for mecha sprites; and "64x128, AA, Alpha, Anim 1" for ground tile sprites.
1. Use my tool GH Appender to crop and assemble the sprites into sprite sheets.

This library has a lot of depencies that you will need to track down and install yourself. I could not include them all due to licensing restrictions. Once you have located and downloaded the dependencies, you will need to add them to the Library_Path section of "GearHead.ini".

## Tools

Instructions for using the tools are located in their respective readmes. Additional tutorials can be found on my website:

http://isometricland.net/gearhead/gh-sprite-assembly.php

http://isometricland.net/gearhead/gh-sprite-dithering.php

## Licenses

1. All mecha models are copyright © their original authors, and are used with permission.
1. The exceptions are mecha models by Michael Horvath, which are CC BY-SA.
1. POV-Ray scripts by Michael Horvath are CC BY-SA.
1. Sprite Tools by Michael Horvath are LGPL 2.1.
1. _GearHead: Arena_ is licensed under the LGPL 2.1.
1. The GearHead Universe is Copyright 2005 by Joseph Hewitt.
