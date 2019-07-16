// Doesn't work with alpha transparency on !!!!!
#local Gold_Texture = texture
{
	T_Gold_1A
	finish {Default_Finish phong 1 phong_size 1}
}


#local Wall_Texture = texture
{
	pigment {color Gold}
	finish {Default_Finish phong 1 phong_size 1}
}


#local Trim_Texture = texture
{
	pigment {color Brown}
	finish {Default_Finish}
}

#local Steps_Texture = texture
{
	pigment {color Brown}
	finish {Default_Finish}
}

#local Roof_Texture = texture
{
	pigment {color Brown}
	finish {Default_Finish}
}

// hole for door
#local Door_Hole_a = box
{
	<Width/2,0,-Width/10,>,
	<0,Width/5,Width/10>
	texture {Plain_Clear}
}

#local Door_Hole_b = cylinder
{
	<0,Width/12,0,>,
	<Width/2,Width/12,0,>,
	Width/8
}

union
{	
	// outer walls
	difference
	{
		prism
		{
			#local P_1 = <Width/2,0,0,>;
			#local P_2 = vrotate(P_1, <0,45,0,>);
			#local P_3 = vrotate(P_2, <0,45,0,>);
			#local P_4 = vrotate(P_3, <0,45,0,>);
			#local P_5 = vrotate(P_4, <0,45,0,>);
			#local P_6 = vrotate(P_5, <0,45,0,>);
			#local P_7 = vrotate(P_6, <0,45,0,>);
			#local P_8 = vrotate(P_7, <0,45,0,>);
			#local Sides_N = 8;
			linear_spline
			0, Width/2, 8,
			<P_1.x,P_1.z,>, <P_2.x,P_2.z,>, <P_3.x,P_3.z,>, <P_4.x,P_4.z,>, <P_5.x,P_5.z,>, <P_6.x,P_6.z,>, <P_7.x,P_7.z,>, <P_8.x,P_8.z,>
			texture {Gold_Texture}
			//texture {Wall_Texture}
			hollow
		}
		Door_Hole_b
	}
	
	// top rim
	torus
	{
		Width/2,
		Width/32
		translate y * Width/2// + Width/32
		texture {Gold_Texture}
		//texture {Trim_Texture}
	}
	
	// columns
	#local Count_N = 0;
	#while (Count_N < Sides_N)
		#local P_c = vrotate(P_1 , <0,45 * Count_N + 45/2,0,>);
		cylinder
		{
			P_c,
			P_c + y * Width/2,
			Width/32
			texture {Gold_Texture}
			//texture {Trim_Texture}
		}
		#local Count_N = Count_N + 1;
	#end
	
	// roof
	sphere
	{
		0,
		Width/2
		scale y * 1/4
		translate y * Width/2
		texture {Gold_Texture}
		//texture {Roof_Texture}
	}

	// nobule
	sphere
	{
		0,
		Width/16
		translate y * (Width/2 + Width/8 + Width/16)
		texture {Gold_Texture}
		//texture {Roof_Texture}
	}

	// step #1
	prism
	{
		linear_spline
		-4, 0, 8,
		<P_1.x,P_1.z,>, <P_2.x,P_2.z,>, <P_3.x,P_3.z,>, <P_4.x,P_4.z,>, <P_5.x,P_5.z,>, <P_6.x,P_6.z,>, <P_7.x,P_7.z,>, <P_8.x,P_8.z,>
		texture {Gold_Texture}
		//texture {Steps_Texture}
		scale <9/8,0,9/8,>
	}
	
	// step #2
	prism
	{
		linear_spline
		-8, -4, 8,
		<P_1.x,P_1.z,>, <P_2.x,P_2.z,>, <P_3.x,P_3.z,>, <P_4.x,P_4.z,>, <P_5.x,P_5.z,>, <P_6.x,P_6.z,>, <P_7.x,P_7.z,>, <P_8.x,P_8.z,>
		texture {Gold_Texture}
		//texture {Steps_Texture}
		scale <5/4,0,5/4,>
	}
	translate y * 8
//	scale 4/5
	scale 1/2
//	scale 2/3
}
