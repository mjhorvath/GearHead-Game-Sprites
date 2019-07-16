set InName="%1.png"
::set OutName="%1_output.png"
set OutName="%1.png"

::convert %InName% ( -channel A -random-threshold 5x95%% ) ( -compose CopyOpacity -composite ) %OutName%
::convert %InName% ( +clone -fx a -monochrome +matte ) ( -compose CopyOpacity -composite )  %OutName%
convert %InName% ( -channel A -ordered-dither 2x1 ) ( -compose CopyOpacity -composite ) %OutName%

:: the following generates the image on a blue background, without transparency
convert %OutName% ( -background blue -flatten ) %OutName%
convert %OutName% ( +matte ) %OutName%

:: the following generates the image on a black background, with transparency
::convert %OutName% ( -background black -flatten ) %OutName%
::convert %OutName% ( -transparent black ) %OutName%

::pause
