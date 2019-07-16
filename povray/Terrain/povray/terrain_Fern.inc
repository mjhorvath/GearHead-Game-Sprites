// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#version 3.7

#include "VEG.INC"			// by Joerg Schrammel and Stig Bachmann Nielsen.

#local Seed = seed(22231+frame_number+Trees_Number+Flip);

// triangle method
union
{
	#local old_points = array[Trees_Number];
	#local Count = 0;
	#while (Count < Trees_Number)
		#local T_Value = rand(Seed);
		#local U_Value = rand(Seed);
		#if ((T_Value + U_Value < 1) & (T_Value < 3/4) & (U_Value < 3/4))
			#local Point_new = <T_Value * Width - Width/2,0,U_Value * Width - Width/2>;
			#local bPass = 1;
			#if (Count > 0)
				#for (i, 0, Count-1)
					#local Point_old = old_points[i];
					#if (VDist(Point_old, Point_new) < Width/4)
						#local bPass = 0;
						#break
					#end
				#end
			#end
			#if (bPass = 1)
				object
				{
					Fern
//					sphere {0,1/20 pigment {color rgb x}}
					scale (rand(Seed) * 1/4 + 3/4)
					scale Height
					rotate y * rand(Seed) * 360
					translate Point_new
				}
				#local old_points[Count] = Point_new;
				#local Count = Count + 1;
			#end
		#end
	#end
	finish {Default_Finish}
	rotate y * Flip * 180
}

/*
// circle/triangle hybrid method (needs work)
union
{
	#local Count = 0;
	#local MaxCount = Trees_Number*100;
	#while (Count < MaxCount)
		#local T_Value = rand(Seed);
		#local U_Value = rand(Seed);
		#local X_Coo = T_Value * 2 - 1;
		#local Z_Coo = U_Value * 2 - 1;
		#if ((vlength(<X_Coo,0,Z_Coo>) <= 1) | (T_Value + U_Value <= 1))
			#local X_Coo = X_Coo * Width/2;
			#local Z_Coo = Z_Coo * Width/2;
			object
			{
//				Fern
				sphere {0,1/100 pigment {color rgb x}}
				scale (rand(Seed) * 1/4 + 3/4)
				scale Height
				rotate y * rand(Seed) * 360
				translate <X_Coo, 0, Z_Coo>
			}
			#local Count = Count + 1;
		#end
	#end
	finish {Default_Finish}
//	rotate y * (Flip * 180)
}


// parabola method
union
{
	#local Count = 0;
	#local MaxCount = Trees_Number*100;
	#while (Count < MaxCount)
		#local T_Value = rand(Seed);
		#local U_Value = rand(Seed);
		object
		{
//			Fern
			sphere {0,1/100 pigment {color rgb x}}
			scale (rand(Seed) * 1/4 + 3/4)
			scale Height
			rotate y * rand(Seed) * 360
			translate x * (T_Value * U_Value * Width - Width/2)
			translate z * ((1 - T_Value) * (1 - U_Value) * Width - Width/2)
		}
		#local Count = Count + 1;
	#end
	finish {Default_Finish}
	rotate y * (Flip * 180)
}


// circle method
union
{
	#local Count = 0;
	#local MaxCount = Trees_Number*100;
	#while (Count < MaxCount)
		#local T_Value = rand(Seed) * 2 - 1;
		#local U_Value = rand(Seed) * 2 - 1;
		#if (vlength(<T_Value,0,U_Value>) <= 1)
			#local X_Coo = T_Value * Width/2;
			#local Z_Coo = U_Value * Width/2;
			object
			{
//				Fern
				sphere {0,1/100 pigment {color rgb x}}
				scale (rand(Seed) * 1/4 + 3/4)
				scale Height
				rotate y * rand(Seed) * 360
				translate <X_Coo, 0, Z_Coo>
			}
			#local Count = Count + 1;
		#end
	#end
	finish {Default_Finish}
//	rotate y * (Flip * 180)
}


// old triangle method
union
{
	#local Count = 0;
	#local MaxCount = Trees_Number*100;
	#while (Count < MaxCount)
		#local T_Value = rand(Seed);
		#local U_Value = rand(Seed);
		#if (T_Value + U_Value <= 1)
			#local X_Coo = T_Value * Width - Width/2;
			#local Z_Coo = U_Value * Width - Width/2;
			object
			{
//				Fern
				sphere {0,1/100 pigment {color rgb x}}
				scale (rand(Seed) * 1/4 + 3/4)
				scale Height
				rotate y * rand(Seed) * 360
				translate <X_Coo, 0, Z_Coo>
			}
			#local Count = Count + 1;
		#end
	#end
	finish {Default_Finish}
	rotate y * (Flip * 180)
}
*/
