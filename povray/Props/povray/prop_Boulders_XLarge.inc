// Desc: GearHead boulders generator, based on POV-Ray tutorial
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

// Seed was 522233
#local Seed = seed(8829464);

intersection
{
	union
	{
		#local Count = 0;
		#local Number = 3;
		#while (Count < Number)
			#local Size = rand(Seed) * 2 * Width/3;
			isosurface
			{
				#local Texture_A = texture
				{
					pigment {color rgb 1/3}
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
				#local Texture_B = texture
				{
					pigment
					{
						color rgb <1/2,1,1,>
					}
					finish
					{
						Default_Finish
						phong 1
						phong_size 1
						specular 1
					}
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
				}
				#local Texture_C = texture
				{
					bozo
					turbulence 2
					texture_map
					{
						[0	Texture_A]
						[1/2	Texture_A]
						[1	Texture_B]
					}
					scale Width/64
//					scale <0.7,0.7,0.7>
				}
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
					Texture_C
//					normal {Faceted_Normal_a}
				}
				scale Size
				rotate rand(Seed) * 360
				translate x * rand(Seed) * Width/2 * 3/4 * RandSign(Seed)
				translate z * rand(Seed) * Width/2 * 3/4 * RandSign(Seed)
				translate y * Size/2
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