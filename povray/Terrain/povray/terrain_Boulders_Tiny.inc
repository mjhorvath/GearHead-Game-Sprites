// Desc: GearHead Boulder generator
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#local Local_Seed = seed(2345*frame_number);
#local Count = 0;
#local Number = 8;
#while (Count < Number)
	#local Size = rand(Local_Seed) * Width/16;
	isosurface
	{
		function
		{
			(f_sphere(x, y, z, 1/4) - f_noise3d(x, y, z))
		}
		max_gradient 4
		contained_by
		{
			box
			{
				-1,
				1
			}
		}
		texture
		{
			Plain_Gray
		}
		scale Size
		rotate rand(Local_Seed) * 360
		translate x * rand(Local_Seed) * Width * 3/8 * RandSign(Local_Seed)
		translate z * rand(Local_Seed) * Width * 3/8 * RandSign(Local_Seed)
	}
	#local Count = Count + 1;
#end
