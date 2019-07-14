:: Takes a series of eighteen 64x128 frames, crops them to 64x96, then collects 
:: them all into a single image.

set ImgName=%1

convert "frames\%ImgName%0.png" -background transparent -crop 64x64+0+64! "%ImgName%0_crop.png"
convert "frames\%ImgName%1.png" -background transparent -crop 64x64+0+64! "%ImgName%1_crop.png"
convert "frames\%ImgName%2.png" -background transparent -crop 64x64+0+64! "%ImgName%2_crop.png"
convert "frames\%ImgName%3.png" -background transparent -crop 64x64+0+64! "%ImgName%3_crop.png"
convert "frames\%ImgName%4.png" -background transparent -crop 64x64+0+64! "%ImgName%4_crop.png"
convert "frames\%ImgName%5.png" -background transparent -crop 64x64+0+64! "%ImgName%5_crop.png"
convert "frames\%ImgName%6.png" -background transparent -crop 64x64+0+64! "%ImgName%6_crop.png"
convert "frames\%ImgName%7.png" -background transparent -crop 64x64+0+64! "%ImgName%7_crop.png"

montage "%ImgName%0_crop.png" "%ImgName%1_crop.png" "%ImgName%2_crop.png" "%ImgName%3_crop.png" "%ImgName%4_crop.png" "%ImgName%5_crop.png" "%ImgName%6_crop.png" "%ImgName%7_crop.png" -background transparent -geometry 64x64! -tile 4x2 "sheets\%ImgName%_sheet_a.png"

del "%ImgName%0_crop.png"
del "%ImgName%1_crop.png"
del "%ImgName%2_crop.png"
del "%ImgName%3_crop.png"
del "%ImgName%4_crop.png"
del "%ImgName%5_crop.png"
del "%ImgName%6_crop.png"
del "%ImgName%7_crop.png"
