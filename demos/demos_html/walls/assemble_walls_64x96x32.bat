:: Takes a series of eighteen 64x128 frames, crops them to 64x96, then collects 
:: them all into a single image. Needs work.

set ImgName=%1

convert "frames\%ImgName%_00.png" -background transparent -crop 64x96+0+32! "%ImgName%_00_crop.png"
convert "frames\%ImgName%_01.png" -background transparent -crop 64x96+0+32! "%ImgName%_01_crop.png"
convert "frames\%ImgName%_02.png" -background transparent -crop 64x96+0+32! "%ImgName%_02_crop.png"
convert "frames\%ImgName%_03.png" -background transparent -crop 64x96+0+32! "%ImgName%_03_crop.png"
convert "frames\%ImgName%_04.png" -background transparent -crop 64x96+0+32! "%ImgName%_04_crop.png"
convert "frames\%ImgName%_05.png" -background transparent -crop 64x96+0+32! "%ImgName%_05_crop.png"
convert "frames\%ImgName%_06.png" -background transparent -crop 64x96+0+32! "%ImgName%_06_crop.png"
convert "frames\%ImgName%_07.png" -background transparent -crop 64x96+0+32! "%ImgName%_07_crop.png"
convert "frames\%ImgName%_08.png" -background transparent -crop 64x96+0+32! "%ImgName%_08_crop.png"
convert "frames\%ImgName%_09.png" -background transparent -crop 64x96+0+32! "%ImgName%_09_crop.png"
convert "frames\%ImgName%_10.png" -background transparent -crop 64x96+0+32! "%ImgName%_10_crop.png"
convert "frames\%ImgName%_11.png" -background transparent -crop 64x96+0+32! "%ImgName%_11_crop.png"
convert "frames\%ImgName%_12.png" -background transparent -crop 64x96+0+32! "%ImgName%_12_crop.png"
convert "frames\%ImgName%_13.png" -background transparent -crop 64x96+0+32! "%ImgName%_13_crop.png"
convert "frames\%ImgName%_14.png" -background transparent -crop 64x96+0+32! "%ImgName%_14_crop.png"
convert "frames\%ImgName%_15.png" -background transparent -crop 64x96+0+32! "%ImgName%_15_crop.png"
convert "frames\%ImgName%_16.png" -background transparent -crop 64x96+0+32! "%ImgName%_16_crop.png"
convert "frames\%ImgName%_17.png" -background transparent -crop 64x96+0+32! "%ImgName%_17_crop.png"
convert "frames\%ImgName%_18.png" -background transparent -crop 64x96+0+32! "%ImgName%_18_crop.png"
convert "frames\%ImgName%_19.png" -background transparent -crop 64x96+0+32! "%ImgName%_19_crop.png"
convert "frames\%ImgName%_20.png" -background transparent -crop 64x96+0+32! "%ImgName%_20_crop.png"
convert "frames\%ImgName%_21.png" -background transparent -crop 64x96+0+32! "%ImgName%_21_crop.png"
convert "frames\%ImgName%_22.png" -background transparent -crop 64x96+0+32! "%ImgName%_22_crop.png"
convert "frames\%ImgName%_23.png" -background transparent -crop 64x96+0+32! "%ImgName%_23_crop.png"
convert "frames\%ImgName%_24.png" -background transparent -crop 64x96+0+32! "%ImgName%_24_crop.png"
convert "frames\%ImgName%_25.png" -background transparent -crop 64x96+0+32! "%ImgName%_25_crop.png"
convert "frames\%ImgName%_26.png" -background transparent -crop 64x96+0+32! "%ImgName%_26_crop.png"
convert "frames\%ImgName%_27.png" -background transparent -crop 64x96+0+32! "%ImgName%_27_crop.png"
convert "frames\%ImgName%_28.png" -background transparent -crop 64x96+0+32! "%ImgName%_28_crop.png"
convert "frames\%ImgName%_29.png" -background transparent -crop 64x96+0+32! "%ImgName%_29_crop.png"
convert "frames\%ImgName%_30.png" -background transparent -crop 64x96+0+32! "%ImgName%_30_crop.png"
convert "frames\%ImgName%_31.png" -background transparent -crop 64x96+0+32! "%ImgName%_31_crop.png"

montage "%ImgName%_00_crop.png" "%ImgName%_01_crop.png" "%ImgName%_02_crop.png" "%ImgName%_03_crop.png" "%ImgName%_04_crop.png" "%ImgName%_05_crop.png" "%ImgName%_06_crop.png" "%ImgName%_07_crop.png" "%ImgName%_08_crop.png" "%ImgName%_09_crop.png" "%ImgName%_10_crop.png" "%ImgName%_11_crop.png" "%ImgName%_12_crop.png" "%ImgName%_13_crop.png" "%ImgName%_14_crop.png" "%ImgName%_15_crop.png" -background transparent -geometry 64x96! -tile 4x4 "sheets\%ImgName%_sheet_a.png"

montage "%ImgName%_16_crop.png" "%ImgName%_17_crop.png" "%ImgName%_18_crop.png" "%ImgName%_19_crop.png" "%ImgName%_20_crop.png" "%ImgName%_21_crop.png" "%ImgName%_22_crop.png" "%ImgName%_23_crop.png" "%ImgName%_24_crop.png" "%ImgName%_25_crop.png" "%ImgName%_26_crop.png" "%ImgName%_27_crop.png" "%ImgName%_28_crop.png" "%ImgName%_29_crop.png" "%ImgName%_30_crop.png" "%ImgName%_31_crop.png" -background transparent -geometry 64x96! -tile 4x4 "sheets\%ImgName%_sheet_b.png"

del "%ImgName%_00_crop.png"
del "%ImgName%_01_crop.png"
del "%ImgName%_02_crop.png"
del "%ImgName%_03_crop.png"
del "%ImgName%_04_crop.png"
del "%ImgName%_05_crop.png"
del "%ImgName%_06_crop.png"
del "%ImgName%_07_crop.png"
del "%ImgName%_08_crop.png"
del "%ImgName%_09_crop.png"
del "%ImgName%_10_crop.png"
del "%ImgName%_11_crop.png"
del "%ImgName%_12_crop.png"
del "%ImgName%_13_crop.png"
del "%ImgName%_14_crop.png"
del "%ImgName%_15_crop.png"
del "%ImgName%_16_crop.png"
del "%ImgName%_17_crop.png"
del "%ImgName%_18_crop.png"
del "%ImgName%_19_crop.png"
del "%ImgName%_20_crop.png"
del "%ImgName%_21_crop.png"
del "%ImgName%_22_crop.png"
del "%ImgName%_23_crop.png"
del "%ImgName%_24_crop.png"
del "%ImgName%_25_crop.png"
del "%ImgName%_26_crop.png"
del "%ImgName%_27_crop.png"
del "%ImgName%_28_crop.png"
del "%ImgName%_29_crop.png"
del "%ImgName%_30_crop.png"
del "%ImgName%_31_crop.png"
