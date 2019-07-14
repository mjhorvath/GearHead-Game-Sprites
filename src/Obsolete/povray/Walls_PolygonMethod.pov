// Obsolete.

#macro Wall_Prototype(North,East,South,West)
	#local AlignX = 0;
	#local AlignY = 0;
	#if (Thick != 0)
		union
		{
			#local Hgh = Height;
			#local Wid = Width/2;
			#local BotWid = Wid * BotThick;
			#local TopWid = BotWid * TopThick;
			#local RotAmt = 0;
			#local TrnAmt = 0;
			#if (AlignX = 1)
				#local Coord1 = <BotWid,0,0,>;
				#local Coord2 = <BotWid,Hgh,0,>;
				#local Coord3 = <TopWid,Hgh,0,>;
				#local RotAmt = degrees(atan(-VDist(Coord3,Coord2)/Hgh));
				#local TrnAmt = 0;		// Hgh - VDist(Coord2,Coord3);
				#if (RotAmt != 0)
					#local RotAmt = RotAmt + 180;
				#end
			#end
			#local N = <+000,+000,-BotWid,>;
			#local E = <-BotWid,+000,+000,>;
			#local S = <+000,+000,+BotWid,>;
			#local W = <+BotWid,+000,+000,>;
			#local Up = <+000,+Hgh,+000,>;
			#local NW1 = N+W;
			#local NE1 = N+E;
			#local SW1 = S+W;
			#local SE1 = S+E;
			#local NW2 = NW1*TopThick+Up;
			#local NE2 = NE1*TopThick+Up;
			#local SW2 = SW1*TopThick+Up;
			#local SE2 = SE1*TopThick+Up;
			#local NNW1 = N/Thick+W;
			#local NNE1 = N/Thick+E;
			#local NEE1 = N+E/Thick;
			#local SEE1 = S+E/Thick;
			#local SSE1 = S/Thick+E;
			#local SSW1 = S/Thick+W;
			#local SWW1 = S+W/Thick;
			#local NWW1 = N+W/Thick;
			#local NNW2 = N/Thick+W*TopThick+Up;
			#local NNE2 = N/Thick+E*TopThick+Up;
			#local NEE2 = N*TopThick+E/Thick+Up;
			#local SEE2 = S*TopThick+E/Thick+Up;
			#local SSE2 = S/Thick+E*TopThick+Up;
			#local SSW2 = S/Thick+W*TopThick+Up;
			#local SWW2 = S*TopThick+W/Thick+Up;
			#local NWW2 = N*TopThick+W/Thick+Up;
			#local NNW3 = N+W*TopThick+Up;
			#local NNE3 = N+E*TopThick+Up;
			#local NEE3 = N*TopThick+E+Up;
			#local SEE3 = S*TopThick+E+Up;
			#local SSE3 = S+E*TopThick+Up;
			#local SSW3 = S+W*TopThick+Up;
			#local SWW3 = S*TopThick+W+Up;
			#local NWW3 = N*TopThick+W+Up;
			// North		
			#if (North = 1)
				#if (Thick != 1)
					polygon {4, NW1, NNW3, NNW2, NNW1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
					polygon {4, NNE1, NNE2, NNE3, NE1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
					polygon {4, NW1, NNW1, NNE1, NE1	texture {Bot_Texture}}
				#end
				#if (TopThick != 1)
					polygon {3, NW1, NNW3, NW2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
					polygon {3, NE1, NNE3, NE2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
				#end
				#if (Thick * TopThick != 1)
					polygon {4, NW2, NNW2, NNE2, NE2	texture {Top_Texture}}
				#end
				polygon {4, NNW1, NNW2, NNE2, NNE1	texture {Plain_Gray translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
			#else
				polygon {4, NE1, NE2, NW2, NW1		texture {LongWall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
			#end

			// East
			#if (East = 1)
				#if (Thick != 1)
					polygon {4, SE1, SEE3, SEE2, SEE1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
					polygon {4, NEE1, NEE2, NEE3, NE1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
					polygon {4, SE1, SEE1, NEE1, NE1	texture {Bot_Texture}}
				#end
				#if (TopThick != 1 & Thick * TopThick != 1)
					polygon {3, SE1, SEE3, SE2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
					polygon {3, NE1, NEE3, NE2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
				#end
				#if (Thick * TopThick != 1)
					polygon {4, SE2, SEE2, NEE2, NE2	texture {Top_Texture}}
				#end
				polygon {4, SEE1, SEE2, NEE2, NEE1	texture {Plain_Gray translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
			#else
				polygon {4, SE1, SE2, NE2, NE1		texture {LongWall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
			#end


			// South
			#if (South = 1)
				#if (Thick != 1)
					polygon {4, SW1, SSW3, SSW2, SSW1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
					polygon {4, SSE1, SSE2, SSE3, SE1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
					polygon {4, SW1, SSW1, SSE1, SE1	texture {Bot_Texture}}
				#end
				#if (TopThick != 1)
					polygon {3, SW1, SSW3, SW2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
					polygon {3, SE1, SSE3, SE2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 270}}
				#end
				#if (Thick * TopThick != 1)
					polygon {4, SW2, SSW2, SSE2, SE2	texture {Top_Texture}}
				#end
				polygon {4, SSW1, SSW2, SSE2, SSE1	texture {Plain_Gray translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
			#else
				polygon {4, SW1, SW2, SE2, SE1			texture {LongWall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
			#end

			// West
			#if (West = 1)
				#if (Thick != 1)
					polygon {4, NW1, NWW3, NWW2, NWW1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
					polygon {4, SWW1, SWW2, SWW3, SW1	texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
					polygon {4, NW1, NWW1, SWW1, SW1	texture {Bot_Texture}}
				#end
				#if (Thick * TopThick != 1)
					polygon {4, NW2, NWW2, SWW2, SW2	texture {Top_Texture}}
				#end
				#if (TopThick != 1)
					polygon {3, NW1, NWW3, NW2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 180}}
					polygon {3, SW1, SWW3, SW2		texture {Wall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 000}}
				#end
				polygon {4, NWW1, NWW2, SWW2, SWW1	texture {Plain_Gray translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
			#else
				polygon {4, NW1, NW2, SW2, SW1		texture {LongWall_Texture translate y * TrnAmt rotate x * RotAmt rotate y * AlignY * 090}}
			#end
	
			// Middle
			polygon {4, NW2, NE2, SE2, SW2			texture {Top_Texture}}
			polygon {4, NW1, NE1, SE1, SW1			texture {Bot_Texture}}
		}
	#else
		union
		{
			#local Hgh = Height;
			#local Wid = Width/2;
			#local N1 = <+000,+000,-Wid,>;
			#local E1 = <-Wid,+000,+000,>;
			#local S1 = <+000,+000,+Wid,>;
			#local W1 = <+Wid,+000,+000,>;
			#local Up = <+000,+Hgh,+000,>;
			#local N2 = N1+Up;
			#local E2 = E1+Up;
			#local S2 = S1+Up;
			#local W2 = W1+Up;
			#if (North = 1)
				polygon {4,0,Up,N2,N1		texture {Wall_Texture rotate y * 090}}
			#end
			#if (East = 1)
				polygon {4,0,Up,E2,E1		texture {Wall_Texture rotate y * 000}}
			#end
			#if (South = 1)
				polygon {4,0,Up,S2,S1		texture {Wall_Texture rotate y * 090}}
			#end
			#if (West = 1)
				polygon {4,0,Up,W2,W1		texture {Wall_Texture rotate y * 000}}
			#end
		}
	#end
#end
