// Desc: GearHead floors prototypes
// Auth: Michael Horvath
// Home: http://isometricland.net

#macro SquarePatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
	union
	{
		#local Hgh = Tiles_Height;
		#local Wid = Tiles_Width;
		#local Number = Tiles_Number;
		#local Count1 = 0;
		#while (Count1 < Number)
			#local Count2 = 0;
			#local Modulos = mod(Count1*3,2);
			#local AddOne = Number;
			#if ((Modulos != 0) & (Tiles_Stagger = 1))
				#local AddOne = AddOne + 1;
			#end
			#while (Count2 < AddOne)
				bicubic_patch
				{
					type 0 flatness 0
					u_steps 4 v_steps 4
					<0+Wid*3/3,000,0+Wid*3/3,>, <0+Wid*2/3,000,0+Wid*3/3,>, <0+Wid*1/3,000,0+Wid*3/3,>, <0+Wid*0/3,000,0+Wid*3/3,>
					<0+Wid*3/3,000,0+Wid*2/3,>, <0+Wid*2/3,Hgh,0+Wid*2/3,>, <0+Wid*1/3,Hgh,0+Wid*2/3,>, <0+Wid*0/3,000,0+Wid*2/3,>
					<0+Wid*3/3,000,0+Wid*1/3,>, <0+Wid*2/3,Hgh,0+Wid*1/3,>, <0+Wid*1/3,Hgh,0+Wid*1/3,>, <0+Wid*0/3,000,0+Wid*1/3,>
					<0+Wid*3/3,000,0+Wid*0/3,>, <0+Wid*2/3,000,0+Wid*0/3,>, <0+Wid*1/3,000,0+Wid*0/3,>, <0+Wid*0/3,000,0+Wid*0/3,>
//					uv_mapping
					scale <1/Number - 1/32,1/4,1/Number - 1/32>
					translate <rand(FrameSeed) * 1/32 - 1/64,0,rand(FrameSeed) * 1/32 - 1/64>
					rotate y * rand(FrameSeed) * 5
					translate <-Wid/2,0,-Wid/2,>
					translate x * Count1 * Wid/Number
					translate z * Count2 * Wid/Number
					#local Modulos = mod(Count1*3,2);
					#if ((Modulos != 0) & (Tiles_Stagger = 1))
						translate z * -Wid/Number/2
					#end
				}
				#local Count2 = Count2 + 1;
			#end
			#local Count1 = Count1 + 1;
		#end
		bounded_by
		{
			box {-Wid/2,+Wid/2}
		}
	}
#end

#macro SquareEvenPatchTile_Floor_Prototype(Tiles_Width,Tiles_Height,Tiles_Number,Tiles_Stagger)
	union
	{
		#local Hgh = Tiles_Height;
		#local Wid = Tiles_Width;
		#local Number = Tiles_Number;
		#local Count1 = 0;
		#while (Count1 < Number)
			#local Count2 = 0;
			#local Modulos = mod(Count1*3,2);
			#local AddOne = Number;
			#if ((Modulos != 0) & (Tiles_Stagger = 1))
				#local AddOne = AddOne + 1;
			#end
			#while (Count2 < AddOne)
				bicubic_patch
				{
					type 0 flatness 0
					u_steps 4 v_steps 4
					<0+Wid*3/3,000,0+Wid*3/3,>, <0+Wid*2/3,000,0+Wid*3/3,>, <0+Wid*1/3,000,0+Wid*3/3,>, <0+Wid*0/3,000,0+Wid*3/3,>
					<0+Wid*3/3,000,0+Wid*2/3,>, <0+Wid*2/3,Hgh,0+Wid*2/3,>, <0+Wid*1/3,Hgh,0+Wid*2/3,>, <0+Wid*0/3,000,0+Wid*2/3,>
					<0+Wid*3/3,000,0+Wid*1/3,>, <0+Wid*2/3,Hgh,0+Wid*1/3,>, <0+Wid*1/3,Hgh,0+Wid*1/3,>, <0+Wid*0/3,000,0+Wid*1/3,>
					<0+Wid*3/3,000,0+Wid*0/3,>, <0+Wid*2/3,000,0+Wid*0/3,>, <0+Wid*1/3,000,0+Wid*0/3,>, <0+Wid*0/3,000,0+Wid*0/3,>
//					uv_mapping
					scale <1/Number - 1/32,1/4,1/Number - 1/32>
					translate <-Wid/2,0,-Wid/2,>
					translate x * Count1 * Wid/Number
					translate z * Count2 * Wid/Number
					#local Modulos = mod(Count1*3,2);
					#if ((Modulos != 0) & (Tiles_Stagger = 1))
						translate z * -Wid/Number/2
					#end
				}
				#local Count2 = Count2 + 1;
			#end
			#local Count1 = Count1 + 1;
		#end
		bounded_by
		{
			box {-Wid/2,+Wid/2}
		}
	}
#end

#macro IsoGranite_Floor_Prototype()
	#local pig_1 = pigment
	{
		granite
		color_map
		{
			[0 color rgb 0]
			[1 color rgb 1]
		}
		scale 32
		noise_generator 3
		warp
		{
			turbulence 1
		}
		translate frame_number
	}
	#local fn_1 = function {pigment {pig_1}}
	#local fn_2 = function {y - fn_1(x,y,z).gray};
	isosurface
	{
		function {fn_2(x,y,z)}
		contained_by { box { <-1,0,-1>, 1 } }
		max_gradient 5
		accuracy 0.0001
		scale y / 8
		scale Width/2
	}
#end

#macro IsoAgate_Floor_Prototype()
	#local pig_1 = pigment
	{
		agate
		color_map
		{
			[0 color rgb 0]
			[1 color rgb 1]
		}
		translate frame_number
	}
	#local fn_1 = function {pigment {pig_1}}
	#local fn_2 = function {y - fn_1(x,y,z).gray/16};
	isosurface
	{
		function {fn_2(x,y,z)}
		contained_by { box { <-1,0,-1>, 1 } }
		max_gradient 128
		accuracy 0.0001
		scale Width/2
	}
#end

#macro WavyBlock_Floor_Prototype()
	#local WavyBlock_Floor_Function = function
	{
		pigment
		{
			brick <0,0,0>, <1,1,1>
			brick_size <1/2,1/4,3/8>
			mortar 1/16
			warp
			{
				turbulence <0.03,0.03,0>
//				octaves 3
				omega 6/8
			}
			rotate x * 90
			rotate y * 90
			translate 1/2
			translate x * +1/32
			translate z * -1/32
			translate x * frame_number
		}
	}
	isosurface
	{
		function {y - WavyBlock_Floor_Function(x,y,z).gray}
		threshold 0
		max_gradient 128
		contained_by
		{
			box { <-1/2,0,-1/2>, <+1/2,1/32,+1/2> }
		}
		scale Width
	}
#end
