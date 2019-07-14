# HOW THIS STUFF WORKS

1. First, in POV-Ray go to "Render" and click on "Edit Settings/Render".
1. Click "Browse" and navigate to where "GearHead.ini" is located. This should be the top-level folder where you extracted the archive.
1. Click "Set but don't render".
1. In the drop-down menu at the top-left of the window select the desired image settings (resolution, alpha channel, animation, etc.). This should be "64x128, AA, Alpha, Anim 16" for thin wall sprites; "64x128, No AA, No Alpha, Anim 8" for mecha sprites; and "64x128, AA, Alpha, Anim 1" for ground tile sprites.
1. Use my tool GH Appender to crop and assemble the sprites into sprite sheets.

This library has a lot of depencies that you will need to track down and install yourself. I could not include them due to licensing incompatibilities. Once you have located and downloaded them, you will need to add their locations to the Library_Path section of "GearHead.ini".
