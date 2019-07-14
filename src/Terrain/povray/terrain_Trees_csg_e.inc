// Desc: GearHead tree-tile generator 1.0
// Auth: Michael Horvath

#local Height = 32;
#local Width = 64;

#declare TREE = union
{
	cylinder
	{
		<0,0,0,>, <0,8,0,>, 2
		texture
		{
			pigment {color srgb <140,123,93,>/255 * 2/4}
			finish {Default_Finish}
			normal {wrinkles 0.5}
		}
	}
	cone
	{
		<0,8,0,>, 8, <0,32,0,>, 0
		texture
		{
			pigment {color srgb <073,116,060,>/255 * 2/4}
			finish {Default_Finish}
			normal {wrinkles}
		}
	}
	scale 1/32
	scale (rand(Seed) * 0.5 + 0.75)
	rotate y * rand(Seed) * 360
}
