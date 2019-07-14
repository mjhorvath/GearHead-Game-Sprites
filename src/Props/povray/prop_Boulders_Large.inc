// Desc: GearHead boulders generator, based on POV-Ray tutorial
// Auth: Michael Horvath
// Home: http://isometricland.com

intersection
{
	union
	{
		#local Count = 0;
		#local Number = 8;
		#while (Count < Number)
			#local Size = rand(Seed) * Width/4;
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
					normal
					{
						bozo
						turbulence 2
						slope_map
						{
							[0   <0, 1>]
							[0.4 <1, 1>]
							[0.45 <0,0>]
							[0.5 <-1,1>]
							[1   <0,-1>]
						}
						scale Width/32
//						scale <0.7,0.7,0.7>
					}
					finish {Default_Finish}
				}
				scale Size
				rotate rand(Seed) * 360
				translate x * rand(Seed) * Width * 3/8 * RandSign(Seed)
				translate z * rand(Seed) * Width * 3/8 * RandSign(Seed)
		//		translate y * Size
				no_shadow
			}
			#local Count = Count + 1;
		#end
	}
	plane
	{
		-y, 0
		texture {Plain_Gray}
		no_image
	}
}