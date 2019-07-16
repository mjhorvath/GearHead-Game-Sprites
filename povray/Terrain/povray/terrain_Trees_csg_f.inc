// Desc: GearHead boulders generator, based on POV-Ray tutorial
// Auth: Michael Horvath
// Home Page: http://www.geocities.com/Area51/Quadrant/3864/gearhead.htm

#local Height = 32;
#local Width = 64;
#local Seed = seed(545431);

#declare TREE = union
{
	cylinder
	{
		<0,0,0,>,
		<0,12,0,>,
		2
		texture
		{
			pigment
			{
				color srgb <140,123,93,>/255 * 2/4
			}
			finish {Default_Finish}
		}
	}
	isosurface
	{
		#local Size = rand(Seed) * Width/8 + Width/8;
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
			pigment
			{
//				color srgb <073,116,060,>/255	// too light
				color srgb <073,116,060,>/255 * 2/4
			}
			finish {Default_Finish}
		}
		scale Size
		rotate rand(Seed) * 360
		translate y * (Size + 8)
	}
	scale 1/32
}
