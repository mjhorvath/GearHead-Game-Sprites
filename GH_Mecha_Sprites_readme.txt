Project:	Additional Mecha Sprites for GearHead RPG
Authors:	Models by several authors (see below). Assembled together and rendered by Michael Horvath.
Updated:	2011/02/03
Website:	http://isometricland.net
Version:	1.5.0


================================================================================
INTRODUCTION

The images in the majority of the sub-directories are used only for the various 
HTML demonstration mockups. Images within the "images_mecha_medium_noaa_gh" and 
"images_mecha_medium_dithered_gh" directories can be imported/copied directly 
into the game without problems, however. To assemble the other images into 
GearHead-compatible sprites, install ImageMagick and use my GearHead Sprite 
Tools from my website. Instructions on how to use them can be found on the 
GearHead wiki.

The SVG images are just there because I liked them and didn't delete them. They 
do the same thing as the HTML files. So view whichever you prefer.


================================================================================
THE MODELS

The source 3D models for the sprites are included. The majority of the models 
are by Mladen Pejic, Randy & Ron Perovich and Timothy Gould, and are used with 
permission. Unfortunately, I didn't keep careful track of which models were made 
by whom. However, their websites can be found at the following URLs:

http://www3.sympatico.ca/mladenpejic/	(Mladen Pejic)
http://www.legomechwarrior.net/		    (Randy & Ron Perovich)
http://www.ldraw.org/Article410.html	(Timothy Gould)

Files in LDR or MPD format require the LDraw library of tools in order to view 
or edit them.


================================================================================
THE SPRITES

Sprites are sorted into six categories (and folders) based on a combination of:

	1. small, medium and large sizes
	2. alpha, dithered and NoAA transparency

* The "small", "medium" and "large" categories should be self-explanatory. 
  Sprites are either bigger or smaller.
* "Alpha" means the image uses anti-aliasing and is composed on top of an 8 bit 
  alpha channel. This results in a total of 32 bits and smooth blending around 
  the edges. Unfortunately, GearHead does not support 32 bit images, requiring 
  the implementation of workarounds in the form of the two remaining groups.
* "Dithered" means the image's transparency and anti-aliasing data has been 
  baked into the 24 bit image, producing a "dithered" or speckled effect around 
  the edges. Looks noticeably grainy.
* "NoAA" means no anti-aliasing has been done at all. The image is 24 bits. 
  Lacks detail around the mecha edges and borders.

Of course, in order to make the sprites render properly in the HTML mockups, an 
alpha channel was added to the images, regardless of the technique used - 
meaning all images were turned into 32 bit images for the demos and mockups. 
You can safely remove the alpha channels for images in the "dithered" and 
NoAA" categories when importing them into the game.

For a better and more complete explanation of the terminology and techniques 
used, read the sprite graphics tutorials on my website:

http://isometricland.net/gearhead/gearhead.php
