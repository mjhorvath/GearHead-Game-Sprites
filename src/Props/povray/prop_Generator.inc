#local Scale_All = 2/3;
//#local Main_Texture = Plain_Pink;
#local Main_Texture = Plain_Pink;

difference
{
	union
	{
		sphere
		{
			0,
			1
			scale <Width/6,Width/2,Width/2,>
			translate x * -Width/3
		}
		sphere
		{
			0,
			1
			scale <Width/6,Width/2,Width/2,>
			translate x * Width/3
		}
		sphere
		{
			0,
			1
			scale <Width/6,Width/2,Width/2,>
			translate 0
		}
		sphere
		{
			0,
			1
			scale Width/4
			translate x * (Width/4)
		}

		sphere
		{
			0,
			1
			scale Width/4
			translate x * -(Width/4)
		}
		/*
		cylinder
		{
			<-3*Width/8,0,0,>,
			<+3*Width/8,0,0,>,
			Width/4
		}
		*/
		cylinder
		{
			<-Width/2,0,0,>,
			<+Width/2,0,0,>,
			Width/3
		}
		
		texture {Main_Texture}
		scale Scale_All
	}
	plane
	{
		y, 0
	}
}
