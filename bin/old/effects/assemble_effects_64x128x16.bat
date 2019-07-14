:: Takes a series of eighteen 64x128 frames, crops them to 64x96, then collects 
:: them all into a single image.

set ImgName=%1

montage "frames\%ImgName%00.png" "frames\%ImgName%01.png" "frames\%ImgName%02.png" "frames\%ImgName%03.png" "frames\%ImgName%04.png" "frames\%ImgName%05.png" "frames\%ImgName%06.png" "frames\%ImgName%07.png" "frames\%ImgName%08.png" "frames\%ImgName%09.png" "frames\%ImgName%10.png" "frames\%ImgName%11.png" "frames\%ImgName%12.png" "frames\%ImgName%13.png" "frames\%ImgName%14.png" "frames\%ImgName%15.png" -background transparent -geometry 64x128! -tile 4x4 -background transparent "sheets\%ImgName%_sheet.png"
