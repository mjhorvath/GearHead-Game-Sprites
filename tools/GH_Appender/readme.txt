GearHead Sprite Assembler v1.0
-------------------------
by Michael Horvath

Description
-----------
This utility is a front-end for ImageMagick. It crops and assembles input images into the multi-image sprite sheets required by GearHead. It assumes the input images are in a numbered sequence (i.e., 'frame1.png', 'frame2.png', 'frame3.png', etc., etc.), are 64x128 pixels in dimension, and that the top 64 pixels need to be cut from each image before assembly.

Note
----
The file with the '.hta' extension is the actual application.

Usage Instructions
------------------
Type a valid directory path into the top-most input field. A list of PNG files in that directory should then appear below. Select an image in the sequence of images you wish to join. Type the number of images in this sequence into the number field in the 'Animation Frames' section.

Select a 'Mode' and an 'Action', as described below; then press the 'Run' button. A new image will be generated with the same name as the input images, minus the numbering sequence.

Modes
-----
There are two modes: The second mode is for when source images have alpha channels. The first mode is for when source images are already flattened (i.e., they don't have an alpha channel).

Actions
-------
There are two actions: The first action is for when you only want to work on the selected sequence of images. The second action is for when you want to work on all images in the directory.