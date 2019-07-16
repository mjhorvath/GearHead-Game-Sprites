// Adapted from my 'spinner' loading screen

#include "GearHead.inc"
#include "prop_deciduous_tree.inc"
#declare Seed			= seed(887+frame_number);
// citygen variables - many unused
#declare city_night		= false;
#declare city_right_hand_drive	= false;
#declare city_default_objects	= false;
#declare city_use_mesh		= false;
#declare city_all_mesh		= false;
#declare city_tileable		= true;
#declare city_units		= 1;					// should not be used anywhere directly
#declare city_storey_height	= city_units * 8;			// for reference, people are roughly city_units * 2 units tall
#declare city_ped_density	= 1/64/city_units;			// is this being used?? it should be!
#declare city_grass_height	= city_units / 8;			// too thin and it gets clipped by the pavement
#declare city_tree_height	= city_units * 12;
#declare nominal_building_width	= city_units * 64;
#declare buildings_per_block	= <4,4>;				// 2D vector of integers
#declare city_block_count	= <2,4>;				// 2D vector of integers
#declare city_sections		= <3,1>;				// 2D vector of integers
#declare pavement_width		= city_units * 0;			// city_units * 4
#declare building_gap		= pavement_width * 2;
#declare building_width		= nominal_building_width - pavement_width * 2;
#declare min_building_height	= city_storey_height * 8;
#declare max_building_height	= city_storey_height * 12;
#declare building_height_turb	= 1;
#declare city_circum		= 40000;
#declare city_radius		= city_circum/2/pi;
#declare TexQual		= 1;
#declare glass_hollow		= 1;
#declare glass_thin		= 1;
#declare AlwaysReflect		= 1;
#declare _CT_rand2		= Seed;
#declare _CT_rand3		= Seed;
#declare _CT_rand5		= Seed;

#declare metal_texture = texture
{
	pigment {gamma_color_adjust(<.4,.4,.4>)}
	finish {metallic}
	scale city_units
}

//------------------------------------------------------------------------------Macros

#macro ped_macro(in_seed)
	#local col1 = gamma_color_adjust(<rand(in_seed),rand(in_seed),rand(in_seed)>);
	#local col2 = gamma_color_adjust(<rand(in_seed),rand(in_seed),rand(in_seed)>);
	sphere
	{
		y/2, 1/2
		pigment
		{
			gradient y
			color_map
			{
				[0/2 col1]
				[1/2 col1]
				[1/2 col2]
				[2/2 col2]
			}
		}
		scale city_units * 2
		scale <1/4,4/3,1/4>
		scale <rand(in_seed) * 1/3 + 2/3,rand(in_seed) * 1/3 + 2/3,rand(in_seed) * 1/3 + 2/3>
	}
#end

#macro trash_can_macro()
	union
	{
		difference
		{
			cone {y/2, 12/16, y*5/2, 16/16}
			cone {y/1, 11/16, y*6/2, 15/16}
		}
		cylinder {0, y*5/2, 1/8	translate <-1,0,0>}
		cylinder {0, y*5/2, 1/8	translate <+1,0,0>}
		cylinder {0, y*5/2, 1/8	translate <0,0,+1>}
		cylinder {0, y*5/2, 1/8	translate <0,0,-1>}
		bounded_by {cylinder {0, y*5/2, 1+1/8}}
		scale city_units/2
		texture {metal_texture}
	}
#end

#macro tree_macro(in_seed)
	object
	{
		TREE
		scale city_tree_height * (rand(in_seed) * 1/3 + 2/3)
		rotate y * rand(in_seed) * 360
	}
#end

#macro pos_object(in_object, Translate)
	object {in_object translate Translate}
#end

#macro vfloor_def(in_vector)
	<floor(in_vector.x),floor(in_vector.y),floor(in_vector.z)>
#end
#macro vgreat_def(in_vector_1,in_vector_2)
	((in_vector_1.x>in_vector_2.x)&(in_vector_1.y>in_vector_2.y)&(in_vector_1.z>in_vector_2.z))
#end

#macro cyl_box(in1_pos, in2_pos)
	box {in1_pos, in2_pos}
#end

#macro cyl_macro(in_pt1, in_pt2, in_rd)
	cylinder {in_pt1, in_pt2, in_rd}
#end

#macro sph_macro(in_pt, in_rd)
	sphere {in_pt, in_rd}
#end

#macro con_macro(in_pt1, in_rd1, in_pt2, in_rd2)
	cone {in_pt1, in_rd1, in_pt2, in_rd2}
#end

#macro cyl_pyr(in1_pos, in2_pos)
	#local in1_height	= city_radius - in1_pos.y;
	#local in2_height	= city_radius - in2_pos.y;
	#local in1_zangle	= in1_pos.x/city_circum * 360;
	#local in2_zangle	= in2_pos.x/city_circum * 360;
	#local diff_angle	= abs(in2_zangle - in1_zangle)/2;
	difference
	{
		cylinder {<0,0,in1_pos.z-0>, <0,0,in2_pos.z+0>, in1_height}
		cylinder {<0,0,in1_pos.z-1>, <0,0,in2_pos.z+1>, in2_height}
		plane {+x, 0 rotate z * in1_zangle}
		plane {-x, 0 rotate z * in2_zangle}
		plane {+z, 0 rotate x * +diff_angle translate y * -city_radius translate z * in1_pos.z}
		plane {-z, 0 rotate x * -diff_angle translate y * -city_radius translate z * in2_pos.z}
//		bounded_by {cyl_box_bound(in1_pos, in2_pos)}
		// added
		translate y * city_radius
	}
#end

#macro cyl_tiltB(in_radius, in_height, in_position, tweak, in_corner)
	#if (tweak)
		#local diff_tweak = 4;
	#else
		#local diff_tweak = 0;
	#end
	#local pos_zangle	= in_position.x/city_circum * 360;
	#local in1_zangle	= in_radius/city_circum * 360;
	#local in2_zangle	= in_corner/sind(45)/city_circum * 360;
	#local out1_radius	= sind(in1_zangle) * (city_radius + diff_tweak);
	#local out2_radius	= sind(in1_zangle) * (city_radius - diff_tweak - in_height);
	#local out1_intsec	= cosd(in1_zangle) * (city_radius + diff_tweak);
	#local out2_intsec	= cosd(in1_zangle) * (city_radius - diff_tweak - in_height);
	#local corner_angle	= 90-atan2d(tand(90-in2_zangle) * sind(90-in2_zangle),1);
	#local corner_apex	= vrotate(<0,1,0>,<corner_angle,0,0>);
	union
	{
		#local corner_count = 0;
		#while (corner_count < 4)
			cone
			{
				<0,-out1_intsec,0>, out1_radius, <0,-out2_intsec,0>, out2_radius
//				Supercone(<0,-out1_intsec,0>, out1_radius*2/3, out1_radius, <0,-out2_intsec,0>, out2_radius*2/3, out2_radius)
				rotate z * corner_angle
				rotate y * (45 + corner_count * 90)
				rotate z * pos_zangle
				translate z * in_position.z
			}
			#local corner_count = corner_count + 1;
		#end
		// added
		translate y * city_radius
	}
#end

#macro cyl_grad_csg(in1_pos, in2_pos, in_radius, in_position)
	#local in_zangle	= in_radius/city_circum * 360;
	#local out1_radius	= sind(in_zangle) * (city_radius - in1_pos.y);
	#local out2_radius	= sind(in_zangle) * (city_radius - in2_pos.y);
	cone {in1_pos, out1_radius, in2_pos, out2_radius translate in_position}
#end

#macro cyl_grad(in1_pos, in2_pos, in_radius, in_position)
	cyl_grad_csg(in1_pos, in2_pos, in_radius, in_position)
#end

#macro cyl_box_bound(in1_pos, in2_pos)
	box {in1_pos, in2_pos}
#end

//------------------------------------------------------------------------------1

// OFFICE BUILDING #1 - shiny cube
#macro Office_Building_1(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_1.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <2, .5, 2>;	//<2, .5, 2>
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#switch (TexQual)
		#case (0)
			#local main_tex		= lowqual_tex(_CT_rand5);
			#local glass_mat	= lowqual_mat();
		#break
		#case (1/2)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<.4,.4,.4>)}
				finish {metallic}
				scale city_units
			}
			#local glass_mat = material
			{
				texture
				{
					pigment {gamma_color_adjust(<.5,.5,.5>) filter 0 transmit 1/2}
					normal {bumps .05 scale .1}
					finish {specular .5 roughness .1 reflection <.3, .4, .5>}
				}
				scale city_units
			}
		#break
		#case (1)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<.4,.4,.4>)}
				finish {metallic}
				scale city_units
			}
			#local glass_mat = material
			{
				interior {ior 2.5}
				texture
				{
					pigment {gamma_color_adjust(<223,230,255>/255) filter 0 transmit .5}
					normal {bumps .05 scale .1}
					finish {specular .5 roughness .1 reflection <.3, .4, .5>}
				}
				scale city_units
			}
		#break
	#end
	difference
	{
		union
		{
			// floors
			#local Level_Count	= 0;
			#while (Level_Count < Levels)
				#local y_adjust = y * Level_Count * city_storey_height;
				#local s1 = <-1.00, -0.02, -1.00> * Scale + Translate + y_adjust;
				#local s2 = <+1.00, +0.02, +1.00> * Scale + Translate + y_adjust;
				object {cyl_box(s1, s2)}
				#local Level_Count = Level_Count + 1;
			#end
			// walls - distance should be according to city_units
			#local C = -0.75;
			#while (C < 1) 
				object {cyl_box(<C-0.01, 0.0,  -1.00>*Scale + Translate, <C+0.01, 0.5 * Levels,  +1.00> * Scale + Translate)}
				object {cyl_box(< -1.00, 0.0, C-0.02>*Scale + Translate, < +1.00, 0.5 * Levels, C+0.02> * Scale + Translate)}
				#local C = C + 0.25;
			#end
			// glass
			#if (glass_thin)
				difference
				{
					object {cyl_box(<-0.999, 0.00, -0.999>*Scale + Translate, <+0.999, 0.5 * Levels - 0.001, +0.999> * Scale + Translate)}
					object {cyl_box(<-0.989, 0.01, -0.989>*Scale + Translate, <+0.989, 0.5 * Levels - 0.011, +0.989> * Scale + Translate)}
					#if (glass_hollow)	hollow	#end
					material {glass_mat}
				}
			#else
				object
				{
					cyl_box(<-0.999, 0.00, -0.999>*Scale + Translate, <+0.999, 0.5 * Levels - 0.001, +0.999> * Scale + Translate)
					#if (glass_hollow)	hollow	#end
					material {glass_mat}
				}
			#end
			bounded_by {cyl_box_bound(<-1.01, 0, -1.01>*Scale + Translate, <+1.01, 0.5 * Levels, +1.01> * Scale + Translate)}
		}
		difference
		{
			object {cyl_box(<-1.01, 0, -1.01>*Scale + Translate, <+1.01, 0.5, +1.01> * Scale + Translate)}
			object {cyl_box(<-0.75, 0, -0.75>*Scale + Translate, <+0.75, 0.5, +0.75> * Scale + Translate)}
			// bounding may not help here
//			bounded_by {cyl_box_bound(<-1.01, 0, -1.01>*Scale + Translate, <+1.01, 0.5 * Levels, +1.01> * Scale + Translate)}
		}
		// bound
		bounded_by {cyl_box_bound(<-1.01, 0, -1.01>*Scale + Translate, <+1.01, 0.5 * Levels, +1.01> * Scale + Translate)}
		// texture
		texture {main_tex}
	}
#end


//------------------------------------------------------------------------------2

// wanted the glass to be cylindrical instead of spherical
// OFFICE BUILDING #2 - white lozenges
#macro Office_Building_2(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_2.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 16, 32>;
	#local Scale		= Size/building_size;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (0)
			#local main_tex		= lowqual_tex(_CT_rand5);
			#local grass_tex	= lowqual_tex(_CT_rand5);
			#local glass_mat	= lowqual_mat();
		#break
		#case (1/2)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<1,1,1>)}
				scale city_units
			}
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local glass_mat = material
			{
				texture
				{
					pigment	{gamma_color_adjust(<0,0,0> filter 0 transmit 0)}
					finish
					{
						specular	0.8
						roughness	0.001
//						ambient		0
//						diffuse		0
//						reflection {0.01, 0.1}
						reflection {0.001, 0.01}	// try to tone down reflection
						conserve_energy
					}
				}
				scale city_units
			}
		#break
		#case (1)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<1,1,1>)}
				scale city_units
			}
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local glass_mat = material
			{
				interior {I_Glass4}		//I_Glass4
				texture
				{
					pigment	{gamma_color_adjust(<1,1,1>) filter 0 transmit 31/32}
					finish
					{
						specular	0.8
						roughness	0.001
//						ambient		0
//						diffuse		0
//						reflection {0.01, 0.1}
						reflection {0.001, 0.01}	// try to tone down reflection
						conserve_energy
					}
				}
				scale city_units
			}
		#break
	#end
	#local sph_obj1_out = object
	{
		sph_macro(0, 16.0)
		scale Scale
	}
	#local sph_obj1_ins = object
	{
		sph_macro(0, 16.0 - 0.01)
		scale Scale
	}
	#local sph_obj2_out = object
	{
		sph_macro(0, 15.5)
		scale Scale
	}
	#local sph_obj2_ins = object
	{
		sph_macro(0, 15.5 - 0.01)
		scale Scale
	}
	#local sph_bnd1 = sphere
	{
		0, 16.0
		scale Scale
	}
	#local sph_bnd2 = sphere
	{
		0, 15.0
		scale Scale
	}
	#local cyl_bnd1 = cylinder
	{
		0, y*16, 16.0/sind(45)
		scale Scale
	}
	#local sph_obj1_out	= pos_object(sph_obj1_out, Translate);
	#local sph_obj1_ins	= pos_object(sph_obj1_ins, Translate);
	#local sph_obj2_out	= pos_object(sph_obj2_out, Translate);
	#local sph_obj2_ins	= pos_object(sph_obj2_ins, Translate);
	#local sph_bnd1		= pos_object(sph_bnd1, Translate);
	#local sph_bnd2		= pos_object(sph_bnd2, Translate);
	#local cyl_bnd1		= pos_object(cyl_bnd1, Translate);
	union
	{
		// floors and walls
		intersection
		{
			union
			{
				// floors
				#local Level_Count = 0;
				#while (Level_Count < Levels)
					#local y_adjust	= y * Level_Count * city_storey_height;
					#local y_thick	= y * 0.1;
					#local s_star	= <-16, 0, -16> * Scale + Translate + y_adjust - y_thick;
					#local s_stop	= <+16, 0, +16> * Scale + Translate + y_adjust + y_thick;
					object {cyl_box(s_star, s_stop)}
					#local Level_Count = Level_Count + 1;
				#end
				// walls
				#local Section_Count = 0;
				#local Section_Total = 6;
				#while (Section_Count < Section_Total)
					#local wall_box = box
					{
						<-0.1,  -0,  -0>, <+0.1, +16, +16>
						rotate y * Section_Count * 360/Section_Total
						scale Scale
					}
					object {pos_object(wall_box, Translate)}
					#local Section_Count = Section_Count + 1;
				#end
				bounded_by {sph_bnd1}
			}
			object {sph_obj1_out}
			// bounding may not help here
//			bounded_by {sph_bnd1}
			texture {main_tex}
		}
		// glass shell
		difference
		{
			#if (glass_thin)
				difference
				{
					object {sph_obj2_out}
					object {sph_obj2_ins}
					// bounding may not help here
//					bounded_by {sph_bnd2}
					#if (glass_hollow)	hollow	#end
				}
			#else
				object
				{
					sph_obj2_out
					#if (glass_hollow)	hollow	#end
				}
			#end
			#local y_adjust	= y * (Levels-1) * city_storey_height;
			object {cyl_box(<-16, +0, -16> * Scale + Translate + y_adjust, <+16, +0, +16> * Scale + Translate + y_adjust * 2)}
			object {cyl_box(<-16, -100, -16> * Scale + Translate, <+16, +0, +16> * Scale + Translate)}
			material {glass_mat}
		}
		// grass
		difference
		{
			cyl_box(<-16,0,-16> * Scale + Translate,<+16,city_grass_height,+16> * Scale + Translate)
			pos_object(con_macro(y * city_radius, 0, -0.001, 18 * Scale.x), Translate)
			texture {grass_tex}
		}
		// people
		#local person_total = 20;
		#local person_count = 0;
		#while (person_count < person_total)
			#local person_theta = rand(_CT_rand2)*2*pi;
			#local person_point = <(rand(_CT_rand2)*2.50+16.25) * cos(person_theta),0,(rand(_CT_rand2)*2.50+16.25) * sin(person_theta)>;
			object {pos_object(ped_macro(_CT_rand2), Translate + person_point * Scale)}
			#local person_count = person_count + 1;
		#end
		// trash cans
		#local trash_total = 4;
		#local trash_count = 0;
		#while (trash_count < trash_total)
			#local trash_theta = trash_count/trash_total*2*pi + pi/4;
			#local trash_point = <17*cos(trash_theta),0,17*sin(trash_theta)>;
			object {pos_object(trash_can_macro(), Translate + trash_point * Scale)}
			#local trash_count = trash_count + 1;
		#end
		// a cylinder, so it's ok
		bounded_by {cyl_bnd1}
	}
#end


//------------------------------------------------------------------------------3

// OFFICE BUILDING #3 - black pagoda
#macro Office_Building_3(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_3.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 4, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (0)
			#local wall_texture	= lowqual_tex(_CT_rand5);
			#local glass_mat	= lowqual_mat();
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
		#break
		#case (1/2)
			#local wall_texture = texture
			{
				pigment {gamma_color_adjust(<.2,.2,.2>)}
				normal {bumps .01 scale .01}
				finish {metallic}
				scale city_units
			}
			#local glass_mat = material
			{
				texture
				{
					pigment {gamma_color_adjust(<.5,.5,.5> filter 0 transmit 0}
					normal {bumps .01	scale .01}
					finish {specular .5	roughness .1	reflection .1}
				}
				scale city_units
			}
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
		#break
		#case (1)
			#local wall_texture = texture
			{
				pigment {gamma_color_adjust(<.2,.2,.2>)}
				normal {bumps .01 scale .01}
				finish {metallic}
				scale city_units
			}
			#local glass_mat = material
			{
				interior {ior 2.5}
				texture
				{
					pigment {gamma_color_adjust(<.0,.0,.0>) filter 0 transmit 1/2}
					normal {bumps .01	scale .01}
					finish {specular .5	roughness .1	reflection .1}
				}
				scale city_units
			}
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
		#break
	#end
	// don't scale!!!
	#local cone_obj1 = object {con_macro(y * city_radius, 0, 0, Size.x/2)}
	#local cone_obj2 = object {cone_obj1	scale 0.9}
	#local cone_obj3a = object {cone_obj1	scale <5/4,1,5/4>}
	#local cone_obj4a = object {cone_obj2	scale <5/4,1,5/4>}
	#local cone_obj3b = object {cone_obj1	scale <3/4,1,3/4>}
	#local cone_obj4b = object {cone_obj2	scale <3/4,1,3/4>}
	#local cone_obj5 = difference
	{
		object {pos_object(cone_obj3a, Translate)}
		object {pos_object(cone_obj3b, Translate)}
	}
	#local cone_obj6 = difference
	{
		object {pos_object(cone_obj4a, Translate)}
		object {pos_object(cone_obj4b, Translate)}
	}
	union
	{
		difference
		{
			intersection
			{
				object {pos_object(cone_obj1, Translate)}
				union
				{
					// floors
					#local Level_Count = 0;
					#while (Level_Count < Levels)
						#local y_adjust	= y * (Level_Count+1) * city_storey_height;
						difference
						{
							object {cyl_box(<-16, -4.0, -16> * Scale + Translate + y_adjust, <+16, -0.0, +16> * Scale + Translate + y_adjust)}
							object {cyl_box(<-17, -3.8, -17> * Scale + Translate + y_adjust, <+17, -0.2, +17> * Scale + Translate + y_adjust)}
						}
						#local Level_Count = Level_Count + 1;
					#end
					// walls
					intersection
					{
						object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4 * Levels, +16> * Scale + Translate)}
						union
						{
							#local Section_Count = 0;
							#local Section_Total = 12;
							#while (Section_Count < Section_Total)
								#local wall_box = box
								{
									<-0.1,         0, -0.0>,
									<+0.1,4 * Levels,+16.0>
									scale		Scale
									rotate		y * Section_Count * 360/Section_Total
								}
								object {pos_object(wall_box, Translate)}
								#local Section_Count = Section_Count + 1;
							#end
						}
					}
				}
			}
			#local Level_Count = 0;
			#while (Level_Count < Levels)
				#if ((mod(Level_Count,6) = 0) | (Level_Count = 0) | (Level_Count = Levels - 1))
					#local y_adjust	= y * (Level_Count+1) * city_storey_height;
					intersection
					{
						object {cone_obj5}
						object {cyl_box(<-16, -4.001, -16> * Scale + Translate + y_adjust, <+16, +0.001, +16> * Scale + Translate + y_adjust)}
					}
				#end
				#local Level_Count = Level_Count + 1;
			#end
			texture {wall_texture}
		}
		// glass
		difference
		{
			intersection
			{
				#if (glass_thin)
					difference
					{
						object {pos_object(cone_obj2, Translate)}
						object {pos_object(object {cone_obj2 scale 0.99}, Translate)}
					}
				#else
					object {pos_object(cone_obj2, Translate)}
				#end
				object {cyl_box(<-16, 0.1, -16> * Scale + Translate, <+16, 4 * Levels - 0.1, +16> * Scale + Translate)}
			}
			#local Level_Count = 0;
			#while (Level_Count < Levels)
				#if ((mod(Level_Count,6) = 0) | (Level_Count = 0) | (Level_Count = Levels - 1))
					#local y_adjust	= y * (Level_Count+1) * city_storey_height;
					intersection
					{
						object {cone_obj6}
						object {cyl_box(<-16, -4.002, -16> * Scale + Translate + y_adjust, <+16, +0.002, +16> * Scale + Translate + y_adjust)}
					}
				#end
				#local Level_Count = Level_Count + 1;
			#end
			#if (glass_hollow)	hollow	#end
			material {glass_mat}
		}
		// people
		#local person_total = 20;
		#local person_count = 0;
		#while (person_count < person_total)
			#local person_theta = rand(_CT_rand2)*2*pi;
			#local person_point = <(rand(_CT_rand2)*8+12) * cos(person_theta),0,(rand(_CT_rand2)*8+12) * sin(person_theta)>;
			object {pos_object(ped_macro(_CT_rand2), Translate + person_point * Scale)}
			#local person_count = person_count + 1;
		#end
		// trash cans
		#local trash_total = 4;
		#local trash_count = 0;
		#while (trash_count < trash_total)
			#local trash_theta = trash_count/trash_total*2*pi + pi/4;
			#local trash_point = <14*cos(trash_theta),0,14*sin(trash_theta)>;
			object {pos_object(trash_can_macro(), Translate + trash_point * Scale)}
			#local trash_count = trash_count + 1;
		#end
		// grass
		difference
		{
			cyl_box(<-16,0,-16> * Scale + Translate,<+16,city_grass_height,+16> * Scale + Translate)
			pos_object(con_macro(y * city_radius, 0, y * -0.001, 18 * Scale.x), Translate)
			texture {grass_tex}
		}
		bounded_by {cyl_box_bound(<-16, 0.0, -16> * Scale + Translate, <+16, 4.0 * Levels, +16> * Scale + Translate)}
	}
#end


//------------------------------------------------------------------------------4

// OFFICE BUILDING #4 - gold star
#macro Office_Building_4(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_4.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 4, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (0)
			#local wall_texture	= lowqual_tex(_CT_rand5);
			#local base_texture	= lowqual_tex(_CT_rand5);
			#local glass_mat	= lowqual_mat();
			#local grass_texture	= lowqual_tex(_CT_rand5);
		#break
		#case (1/2)
			#local wall_texture = texture
			{
				pigment {gamma_color_adjust(<.5,.5,.5>)}
				scale city_units
			}
			#local grass_texture = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local base_texture = texture
			{
				pigment {gamma_color_adjust(<.2,.2,.2>)}
				finish {metallic}
				normal {bumps .01 scale .01}
				scale city_units
			}
			#local glass_mat = material
			{
				texture
				{
//					pigment {gamma_color_adjust((<0,0,0,0,0> + P_Gold3) * <0.75,0.75,0.75,1,1>)}
//					pigment {gamma_color_adjust((<0,0,0,0,0> + P_Gold3/2) * <0.75,0.75,0.75,1,1>)}
//					finish {specular .5 roughness .1 reflection R_GoldE/10}
					pigment {gamma_color_adjust((<0,0,0> + P_Gold3) * <0.75,0.75,0.75,1,1>)}
					finish
					{
						brilliance	6
						diffuse		D_GoldE
						ambient		A_GoldE
						reflection	R_GoldE
						metallic	M
						specular	0.80
						roughness	1/120
					}
					normal {bumps .01	scale .01}
				}
				scale city_units
			}
		#break
		#case (1)
			#local wall_texture = texture
			{
				pigment {gamma_color_adjust(<.5,.5,.5>)}
				scale city_units
			}
			#local grass_texture = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local base_texture = texture
			{
				pigment {gamma_color_adjust(<.2,.2,.2>)}
				finish {metallic}
				normal {bumps .01 scale .01}
				scale city_units
			}
			#local glass_mat = material
			{
				interior {ior 2.5}
				texture
				{
//					pigment {gamma_color_adjust(<1,1,1,0,.25> - P_Gold3)}
//					pigment {gamma_color_adjust(<0,0,0,0,.25> + P_Gold3/2)}
//					finish {specular .5 roughness .1 reflection R_GoldE/10}
					pigment {gamma_color_adjust(<0,0,0> + P_Gold3) filter 0 transmit 1/4}
					finish
					{
						brilliance	6
						diffuse		D_GoldE
						ambient		A_GoldE
						reflection	R_GoldE
						metallic	M
						specular	0.80
						roughness	1/120
					}
					normal {bumps .01	scale .01}
				}
				scale city_units
			}
		#break
	#end
	// not configured correctly...
	#local glass1_shell = difference
	{
		object {cyl_pyr(<-16.0, +4.0, -16.0> * Scale + Translate, <+16.0, -0.0 + 4 * Levels, +16.0> * Scale + Translate)}
		object {cyl_tiltB(16.0 * Scale.x, (-0.0 + 4 * Levels) * Scale.y, Translate, 1, 16.0 * Scale.x)}
	}
	#local glass2_shell = difference
	{
		object {cyl_pyr(<-15.8, +4.0, -15.8> * Scale + Translate, <+15.8, -0.0 + 4 * Levels, +15.8> * Scale + Translate)}
		object {cyl_tiltB(16.2 * Scale.x, (-0.0 + 4 * Levels) * Scale.y, Translate, 1, 15.8 * Scale.x)}
	}
	#local glass0_shell = difference
	{
		object {cyl_pyr(<-16.0, +0.0, -16.0> * Scale + Translate, <+16.0, +1.0 + 4 * Levels, +16.0> * Scale + Translate)}
		object {cyl_tiltB(16.0 * Scale.x, (+1.0 + 4 * Levels) * Scale.y, Translate, 1, 16.0 * Scale.x)}
	}
	// should really be a supercone...
	#local grass_clip = object {cyl_macro(-y*4, +y*4, 12) scale Scale}
	// should really be a cone...
	#local entry_cyl = object {cyl_macro(<0,0,0> * Scale, <0,4,0> * Scale, 16*(1-1/sind(45))*Scale.x)}
	union
	{
		// other wise invisible...
		#if (TexQual = 1)
			// floors & walls
			intersection
			{
				object {glass2_shell}
				union
				{
					// floors
					#local Level_Count = 1;
					#while (Level_Count < Levels)
						#local y_adjust	= y * Level_Count * city_storey_height;
						object {cyl_box(<-16, -0.1, -16> * Scale + Translate + y_adjust, <+16, +0.1, +16> * Scale + Translate + y_adjust)}
						#if (Level_Count = Levels - 1)
							object {cyl_box(<-16, 3.80, -16> * Scale + Translate + y_adjust, <+16, +3.9, +16> * Scale + Translate + y_adjust)}
						#end
						#local Level_Count = Level_Count + 1;
					#end
					// walls
					#local Section_Count = 0;
					#local Section_Total = 4;
					#while (Section_Count < Section_Total)
						#local wall_box = box
						{
							<-0.1,         4, -0.0>,
							<+0.1,4 * Levels,+15.0>
							scale		Scale
							rotate		y * Section_Count * 360/Section_Total
						}
						object {pos_object(wall_box, Translate)}
						#local Section_Count = Section_Count + 1;
					#end
				}
				texture {wall_texture}
	//			pigment {color rgb 1}
			}
	#end
/*
		union
		{
			// roof
			intersection
			{
				object {glass0_shell}
				object {cyl_box(<-16, 4 * Levels + 0.0, -16> * Scale + Translate, <+16, 4 * Levels + 1.0, +16> * Scale + Translate)}
			}
			// base
			difference
			{
				intersection
				{
					object {glass0_shell}
					object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4, +16> * Scale + Translate)}
				}
				object {cyl_box(<-15, -1, -15> * Scale + Translate, <+15, +3, +15> * Scale + Translate)}
			}
			intersection
			{
				// cap
				object {cyl_grad_csg(<0,0,0> * Scale, <0,Levels * 4 + 8,0> * Scale, 6 * Scale.x, Translate)}
				object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4 * Levels + 3, +16> * Scale + Translate)}
				// entryway
				object {cyl_grad_csg(<0,0,0> * Scale, <0,6,0> * Scale, 6 * Scale.x, Translate)}
				object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4, +16> * Scale + Translate)}
			}
			texture {base_texture}
//			pigment {color rgb 0}
		}
*/
		union
		{
			// base
			difference
			{
				intersection
				{
					object {glass0_shell}
					object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4, +16> * Scale + Translate)}
				}
				object {cyl_box(<-15, -1, -15> * Scale + Translate, <+15, +5, +15> * Scale + Translate)}
			}
			// entryway
			intersection
			{
				object {cyl_grad_csg(<0,0,0> * Scale, <0,6,0> * Scale, 6 * Scale.x, Translate)}
				object {cyl_box(<-16, 0, -16> * Scale + Translate, <+16, 4, +16> * Scale + Translate)}
			}
			#if (glass_hollow)	hollow	#end
			material {glass_mat}
		}
		// glass
		#if (glass_thin)
			difference
			{
				object {glass1_shell}
				object {glass2_shell}
				#if (glass_hollow)	hollow	#end
				#if (!AlwaysReflect)	no_reflection 	#end	// for sanity's sake!!!
				material {glass_mat}
			}
		#else
			object
			{
				glass1_shell
				#if (glass_hollow)	hollow	#end
				#if (!AlwaysReflect)	no_reflection 	#end	// for sanity's sake!!!
				material {glass_mat}
			}
		#end
		// grass
		intersection
		{
			object {cyl_box(<-16,0,-16> * Scale + Translate, <+16,city_grass_height,+16> * Scale + Translate)}
			union
			{
				object {pos_object(grass_clip, Translate + <-16,0,-16> * Scale)}
				object {pos_object(grass_clip, Translate + <-16,0,+16> * Scale)}
				object {pos_object(grass_clip, Translate + <+16,0,+16> * Scale)}
				object {pos_object(grass_clip, Translate + <+16,0,-16> * Scale)}
			}
			// bounding may not help here
//			bounded_by {cyl_box_bound(<-16,0,-16> * Scale + Translate, <+16,0,+16> * Scale + Translate + <0,city_grass_height,0>)}
			texture {grass_texture}
		}
		// trees
		#local tree_total = 4;
		#local tree_count = 0;
		#while (tree_count < tree_total)
			#local tree_theta = tree_count/tree_total*2*pi + pi/4;
			#local tree_radius = (14 + 14/sind(45))/2;
			#local tree_point = <tree_radius * cos(tree_theta),city_grass_height/Scale.y,tree_radius * sin(tree_theta)>;
			object {pos_object(tree_macro(_CT_rand2), tree_point * Scale + Translate)}
			#local tree_count = tree_count + 1;
		#end
		// people
		#local person_total = 24;
		#local person_count = 0;
		#while (person_count < person_total)
			#local person_theta = rand(_CT_rand2)*2*pi;
			#local person_point = <(rand(_CT_rand2)*4+6) * cos(person_theta),0,(rand(_CT_rand2)*4+6) * sin(person_theta)>;
			object {pos_object(ped_macro(_CT_rand2), person_point * Scale + Translate)}
			#local person_count = person_count + 1;
		#end
		// trash cans
		#local trash_total = 4;
		#local trash_count = 0;
		#while (trash_count < trash_total)
			#local trash_theta = trash_count/trash_total*2*pi + pi/4;
			#local trash_point = <8 * cos(trash_theta),0,8 * sin(trash_theta)>;
			object {pos_object(trash_can_macro(), trash_point * Scale + Translate)}
			#local trash_count = trash_count + 1;
		#end
		bounded_by {cyl_box_bound(<-16, 0.0, -16> * Scale + Translate, <+16, 4.0 * Levels, +16> * Scale + Translate)}
	}
#end

//------------------------------------------------------------------------------5

// OFFICE BUILDING #5 - pink box scatter
#macro Office_Building_5(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_5.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, Levels*city_storey_height, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * (-1/2+rand(_CT_rand5))
		translate	x * (-1/2+rand(_CT_rand5))
		rotate		x * 90
		scale		building_size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (0)
			#local main_tex		= lowqual_tex(_CT_rand5);
			#local glass_mat	= lowqual_mat();
			#local stone_texture = lowqual_tex(_CT_rand5);
			#local grass_texture = lowqual_tex(_CT_rand5);
		#break
		#case (1/2)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<.7, .76, .75>)}
				normal {bumps .3 scale .1}
				scale city_units
			}
			#local glass_mat = material
			{
				texture
				{
					pigment {gamma_color_adjust(<1/2, 1/2, 1/2>)}
					normal {bumps .01	scale <.5, .1, .5>}
					finish {specular .2	roughness .1	reflection .5}
				}
				scale city_units
			}
			#local stone_texture = texture
			{
				pigment {gamma_color_adjust(<1,1,1>)}
				finish
				{
					ambient 0.0
					diffuse 0.6
					specular 0.1
				}
				scale city_units
			}
			#local grass_texture = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
		#case (1)
			#local main_tex = texture
			{
				pigment {gamma_color_adjust(<.7, .76, .75>)}
				normal {bumps .3 scale .1}
				scale city_units
			}
			#local glass_mat = material
			{
//				interior {ior 2.5}
				texture
				{
					pigment {gamma_color_adjust(<1/4, 0, 0>)}
					normal {bumps .01	scale <.5, .1, .5>}
					finish {specular .2	roughness .1	reflection .5}
				}
				scale city_units
			}
			#local stone_texture = texture
			{
				pigment {gamma_color_adjust(<1,1,1>)}
				finish
				{
					ambient 0.0
					diffuse 0.6
					specular 0.1
				}
				scale city_units
			}
			#local grass_texture = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
		#break
	#end
	union
	{
		union
		{
			#local box_max = 10;
			#local box_cnt = 0;
			#while (box_cnt < box_max)
				#local mod_factor = <building_size.x/4,city_storey_height,building_size.z/4>;
				#local floor_width = <rand(_CT_rand3),rand(_CT_rand3),rand(_CT_rand3)> * building_size;
				#local floor_start = <rand(_CT_rand3),rand(_CT_rand3),rand(_CT_rand3)> * (building_size - floor_width);
				#local floor_width = vfloor_def(floor_width/mod_factor + 1/2) * mod_factor;
				#local floor_start = vfloor_def(floor_start/mod_factor + 1/2) * mod_factor;
				#local floor_final = floor_start + floor_width;
				#if (vgreat_def(floor_final, floor_start))
					cyl_box(floor_start + Translate - <16,0,16>, floor_final + Translate - <16,0,16>)
					#local box_cnt = box_cnt + 1;
				#end
			#end
			cyl_box(<-1/4,-0,-1/4> * building_size + Translate,<+1/4,+1/2,+1/4> * building_size + Translate)
//			hollow
			material {glass_mat}
		}
		// grass
		union
		{
			object {cyl_box(<-15,0,-15,> * Scale + Translate, <-09,2,-09,> * Scale + Translate)}
			object {cyl_box(<-15,0,+09,> * Scale + Translate, <-09,2,+15,> * Scale + Translate)}
			object {cyl_box(<+09,0,+09,> * Scale + Translate, <+15,2,+15,> * Scale + Translate)}
			object {cyl_box(<+09,0,-15,> * Scale + Translate, <+15,2,-09,> * Scale + Translate)}
			texture {grass_texture}
		}
		union
		{
			object {cyl_box(<-16,0,-16,> * Scale + Translate, <-08,1.999,-08,> * Scale + Translate)}
			object {cyl_box(<-16,0,+08,> * Scale + Translate, <-08,1.999,+16,> * Scale + Translate)}
			object {cyl_box(<+08,0,+08,> * Scale + Translate, <+16,1.999,+16,> * Scale + Translate)}
			object {cyl_box(<+08,0,-16,> * Scale + Translate, <+16,1.999,-08,> * Scale + Translate)}
			texture {stone_texture}
		}
	}
#end

//------------------------------------------------------------------------------6

// OFFICE BUILDING #6 - green cylinders
#macro Office_Building_6(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_6.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 4, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (1)
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local wall_texture = texture
			{
				pigment {gamma_color_adjust(<0,1/8,0>)}
				normal {bumps .01 scale .01}
				finish {metallic}
				scale city_units
			}
			#local glass_mat = material
			{
//				interior {ior 2.5}
				texture
				{
					pigment {gamma_color_adjust(<0,1/8,0>) filter 0 transmit 2/4}
					normal {bumps .01	scale .01}
					finish {specular .5	roughness .1	reflection .1}
				}
				scale city_units
			}
		#break
	#end
	#local Building_Direction = -1;
	#if (rand(_CT_rand3) > 1/2)
		#local Building_Direction = +1;
	#end
	#local Building_Rotate = rand(_CT_rand3) * 360 * Building_Direction;
	#local Outer_Shell = con_macro(y * city_radius/2, 0, 0, Size.x/2-city_units)
	union
	{
		// floors
		#local Level_Count = 0;
		#while (Level_Count <= Levels)
			#local floor_obj = intersection
			{
				difference
				{
					object {Outer_Shell}
					plane {+x, 0 rotate y * (10 * Level_Count + Building_Rotate) * Building_Direction}
				}
				difference
				{
					cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - Level_Count * city_storey_height}
					cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - Level_Count * city_storey_height - city_units/4}
				}
			}
			object
			{
				pos_object(floor_obj, Translate)
				texture {wall_texture}
			}
			#local Level_Count = Level_Count + 1;
		#end
/*
		// walls
		#local walls_object = intersection
		{
			object {con_macro(y * city_radius/2, 0, 0, Size.x/2*7/8)}
			union
			{
				#local Section_Count = 0;
				#local Section_Total = 12;
				#while (Section_Count < Section_Total)
					box
					{
						<-0.1,         0, -0.0>,
						<+0.1,4 * Levels,+16.0>
						scale		Scale
						rotate		y * Section_Count * 360/Section_Total
					}
					#local Section_Count = Section_Count + 1;
				#end
			}
		}
		object {pos_object(walls_object, Translate)}
*/
		// grass
		#local grass_obj = difference
		{
			cyl_box(<-16,+0,-16> * Scale + Translate, <+16,city_grass_height,+16> * Scale + Translate)
			cyl_box(<-2,-1,-16> * Scale + Translate,<+2,+1,+16> * Scale + Translate)
			cyl_box(<-16,-1,-2> * Scale + Translate,<+16,+1,+2> * Scale + Translate)
			pos_object(cyl_macro(-y*2, +y*2, 18 * Scale.x), Translate)
		}
		// glass
		#local glass_obj = difference
		{
			object {Outer_Shell scale 0.99}
			cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - Levels * city_storey_height - city_units/4}	
			hollow
		}
		// center post
		#local post_obj = difference
		{
			object {con_macro(y * city_radius/2, 0, 0, Size.x/8)}
			cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - Levels * city_storey_height}
		}
		object
		{
			grass_obj 
			texture {grass_tex}
		}
		object
		{
			pos_object(glass_obj, Translate)
			material {glass_mat}
		}
		object
		{
			pos_object(post_obj, Translate)
			texture {wall_texture}
		}
	}
#end

//------------------------------------------------------------------------------7

// OFFICE BUILDING #7 - tapered helix
#macro Office_Building_7(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_7.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 4, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#switch (TexQual)
		#case (1)
			#local grass_tex = texture
			{
				pigment {grass_pigment_3}
				normal	{wrinkles}
				scale city_units
			}
			#local main_tex = texture
			{
				pigment {P_Chrome5}
				normal {bumps .05 scale .1}
				finish {F_MetalC}
				scale city_units
			}
			#local glass_mat = material
			{
				interior {ior 2.5}
				texture
				{
					pigment {P_Chrome5 filter 0 transmit .75}
					normal {bumps .05 scale .1}
					finish {F_MetalC}
				}
				scale city_units
			}
		#break
	#end
	#local Building_Direction = -1;
	#if (rand(_CT_rand3) > 1/2)
		#local Building_Direction = +1;
	#end
	#local Building_Rotate = rand(_CT_rand3) * 360 * Building_Direction;
	#local Side_A1 = city_radius;
	#local Side_B1 = sind(45) * Size.x / 2;
	#local Side_C1 = sqrt(pow(Side_A1,2) + pow(Side_B1,2));
	#local Theta = acos(Side_A1/Side_C1);

	// glass
	#local glass_mesh = mesh
	{
		#local Level_Count = 2;
		#while (Level_Count <= Levels)
			#local Side_A2 = city_radius - (Level_Count) * city_storey_height;
			#local Side_C2 = Side_A2 / cos(Theta);
			#local Side_B2 = Side_C2 * sin(Theta);
			#local Corner_TTop_1 = vrotate(<-Side_B2, (Level_Count+1) * city_storey_height, -Side_B2>, y * (3 * (Level_Count+1) + Building_Rotate));
			#local Corner_TTop_2 = vrotate(<-Side_B2, (Level_Count+1) * city_storey_height, +Side_B2>, y * (3 * (Level_Count+1) + Building_Rotate));
			#local Corner_TTop_3 = vrotate(<+Side_B2, (Level_Count+1) * city_storey_height, +Side_B2>, y * (3 * (Level_Count+1) + Building_Rotate));
			#local Corner_TTop_4 = vrotate(<+Side_B2, (Level_Count+1) * city_storey_height, -Side_B2>, y * (3 * (Level_Count+1) + Building_Rotate));
			#local Corner_Top_1  = vrotate(<-Side_B2, (Level_Count+0) * city_storey_height, -Side_B2>, y * (3 * (Level_Count+0) + Building_Rotate));
			#local Corner_Top_2  = vrotate(<-Side_B2, (Level_Count+0) * city_storey_height, +Side_B2>, y * (3 * (Level_Count+0) + Building_Rotate));
			#local Corner_Top_3  = vrotate(<+Side_B2, (Level_Count+0) * city_storey_height, +Side_B2>, y * (3 * (Level_Count+0) + Building_Rotate));
			#local Corner_Top_4  = vrotate(<+Side_B2, (Level_Count+0) * city_storey_height, -Side_B2>, y * (3 * (Level_Count+0) + Building_Rotate));
			#local Corner_Bot_1  = vrotate(<-Side_B1, (Level_Count-1) * city_storey_height, -Side_B1>, y * (3 * (Level_Count-1) + Building_Rotate));
			#local Corner_Bot_2  = vrotate(<-Side_B1, (Level_Count-1) * city_storey_height, +Side_B1>, y * (3 * (Level_Count-1) + Building_Rotate));
			#local Corner_Bot_3  = vrotate(<+Side_B1, (Level_Count-1) * city_storey_height, +Side_B1>, y * (3 * (Level_Count-1) + Building_Rotate));
			#local Corner_Bot_4  = vrotate(<+Side_B1, (Level_Count-1) * city_storey_height, -Side_B1>, y * (3 * (Level_Count-1) + Building_Rotate));
			#local Corner_BBot_1 = vrotate(<-Side_B1, (Level_Count-2) * city_storey_height, -Side_B1>, y * (3 * (Level_Count-2) + Building_Rotate));
			#local Corner_BBot_2 = vrotate(<-Side_B1, (Level_Count-2) * city_storey_height, +Side_B1>, y * (3 * (Level_Count-2) + Building_Rotate));
			#local Corner_BBot_3 = vrotate(<+Side_B1, (Level_Count-2) * city_storey_height, +Side_B1>, y * (3 * (Level_Count-2) + Building_Rotate));
			#local Corner_BBot_4 = vrotate(<+Side_B1, (Level_Count-2) * city_storey_height, -Side_B1>, y * (3 * (Level_Count-2) + Building_Rotate));

			#if (Level_Count = Levels)
				triangle
				{
					Corner_Top_3,
					Corner_Top_2,
					Corner_Top_1
				}
				triangle
				{
					Corner_Top_1,
					Corner_Top_4,
					Corner_Top_3
				}
			#end
			#if (Level_Count = 2)
				triangle
				{
					Corner_Bot_3,
					Corner_Bot_2,
					Corner_Bot_1
				}
				triangle
				{
					Corner_Bot_1,
					Corner_Bot_4,
					Corner_Bot_3
				}
			#end

			#local Normal_Top_1a = (vnormalize(vcross( Corner_Top_4- Corner_Top_1,Corner_TTop_1- Corner_Top_1)) + vnormalize(vcross( Corner_Top_1- Corner_Top_4, Corner_Bot_4- Corner_Top_4)) + vnormalize(vcross( Corner_Bot_4- Corner_Bot_1, Corner_Top_1- Corner_Bot_1))) / 3;
			#local Normal_Top_4a = (vnormalize(vcross( Corner_Top_3- Corner_Top_4,Corner_TTop_4- Corner_Top_4)) + vnormalize(vcross( Corner_Top_4- Corner_Top_3, Corner_Bot_3- Corner_Top_3)) + vnormalize(vcross( Corner_Bot_3- Corner_Bot_4, Corner_Top_4- Corner_Bot_4))) / 3;
			#local Normal_Bot_1a = (vnormalize(vcross( Corner_Bot_4- Corner_Bot_1, Corner_Top_1- Corner_Bot_1)) + vnormalize(vcross( Corner_Bot_1- Corner_Bot_4,Corner_BBot_4- Corner_Bot_4)) + vnormalize(vcross(Corner_BBot_4-Corner_BBot_1, Corner_Bot_1-Corner_BBot_1))) / 3;
			#local Normal_Bot_4a = (vnormalize(vcross( Corner_Bot_3- Corner_Bot_4, Corner_Top_4- Corner_Bot_4)) + vnormalize(vcross( Corner_Bot_4- Corner_Bot_3,Corner_BBot_3- Corner_Bot_3)) + vnormalize(vcross(Corner_BBot_3-Corner_BBot_1, Corner_Bot_4-Corner_BBot_4))) / 3;
			#local Normal_Top_4b = (vnormalize(vcross( Corner_Top_1- Corner_Top_4, Corner_Bot_4- Corner_Top_4)) + vnormalize(vcross( Corner_Top_4- Corner_Top_1,Corner_TTop_1- Corner_Top_1)) + vnormalize(vcross(Corner_TTop_1-Corner_TTop_4, Corner_Top_4-Corner_TTop_4))) / 3;
			#local Normal_Bot_4b = (vnormalize(vcross( Corner_Bot_1- Corner_Bot_4,Corner_BBot_4- Corner_Bot_4)) + vnormalize(vcross( Corner_Bot_4- Corner_Bot_1, Corner_Top_1- Corner_Bot_1)) + vnormalize(vcross( Corner_Top_1- Corner_Top_4, Corner_Bot_4- Corner_Top_4))) / 3;

			smooth_triangle
			{
				Corner_Top_1, Normal_Top_1a,
				Corner_Bot_1, Normal_Bot_1a,
				Corner_Bot_4, Normal_Bot_4b
			}
			smooth_triangle
			{
				Corner_Bot_4, Normal_Bot_4b,
				Corner_Top_4, Normal_Top_4b,
				Corner_Top_1, Normal_Top_1a
			}

			#local Normal_Top_4a = (vnormalize(vcross( Corner_Top_3- Corner_Top_4,Corner_TTop_4- Corner_Top_4)) + vnormalize(vcross( Corner_Top_4- Corner_Top_3, Corner_Bot_3- Corner_Top_3)) + vnormalize(vcross( Corner_Bot_3- Corner_Bot_4, Corner_Top_4- Corner_Bot_4))) / 3;
			#local Normal_Top_3a = (vnormalize(vcross( Corner_Top_2- Corner_Top_3,Corner_TTop_3- Corner_Top_3)) + vnormalize(vcross( Corner_Top_3- Corner_Top_2, Corner_Bot_2- Corner_Top_2)) + vnormalize(vcross( Corner_Bot_2- Corner_Bot_3, Corner_Top_3- Corner_Bot_3))) / 3;
			#local Normal_Bot_4a = (vnormalize(vcross( Corner_Bot_3- Corner_Bot_4, Corner_Top_4- Corner_Bot_4)) + vnormalize(vcross( Corner_Bot_4- Corner_Bot_3,Corner_BBot_3- Corner_Bot_3)) + vnormalize(vcross(Corner_BBot_3-Corner_BBot_4, Corner_Bot_4-Corner_BBot_4))) / 3;
			#local Normal_Bot_3a = (vnormalize(vcross( Corner_Bot_2- Corner_Bot_3, Corner_Top_3- Corner_Bot_3)) + vnormalize(vcross( Corner_Bot_3- Corner_Bot_2,Corner_BBot_2- Corner_Bot_2)) + vnormalize(vcross(Corner_BBot_2-Corner_BBot_4, Corner_Bot_3-Corner_BBot_3))) / 3;
			#local Normal_Top_3b = (vnormalize(vcross( Corner_Top_4- Corner_Top_3, Corner_Bot_3- Corner_Top_3)) + vnormalize(vcross( Corner_Top_3- Corner_Top_4,Corner_TTop_4- Corner_Top_4)) + vnormalize(vcross(Corner_TTop_4-Corner_TTop_3, Corner_Top_3-Corner_TTop_3))) / 3;
			#local Normal_Bot_3b = (vnormalize(vcross( Corner_Bot_4- Corner_Bot_3,Corner_BBot_3- Corner_Bot_3)) + vnormalize(vcross( Corner_Bot_3- Corner_Bot_4, Corner_Top_4- Corner_Bot_4)) + vnormalize(vcross( Corner_Top_4- Corner_Top_3, Corner_Bot_3- Corner_Top_3))) / 3;

			smooth_triangle
			{
				Corner_Top_4, Normal_Top_4a,
				Corner_Bot_4, Normal_Bot_4a,
				Corner_Bot_3, Normal_Bot_3b
			}
			smooth_triangle
			{
				Corner_Bot_3, Normal_Bot_3b,
				Corner_Top_3, Normal_Top_3b,
				Corner_Top_4, Normal_Top_4a
			}

			#local Normal_Top_3a = (vnormalize(vcross( Corner_Top_2- Corner_Top_3,Corner_TTop_3- Corner_Top_3)) + vnormalize(vcross( Corner_Top_3- Corner_Top_2, Corner_Bot_2- Corner_Top_2)) + vnormalize(vcross( Corner_Bot_2- Corner_Bot_3, Corner_Top_3- Corner_Bot_3))) / 3;
			#local Normal_Top_2a = (vnormalize(vcross( Corner_Top_1- Corner_Top_2,Corner_TTop_2- Corner_Top_2)) + vnormalize(vcross( Corner_Top_2- Corner_Top_1, Corner_Bot_1- Corner_Top_1)) + vnormalize(vcross( Corner_Bot_1- Corner_Bot_2, Corner_Top_2- Corner_Bot_2))) / 3;
			#local Normal_Bot_3a = (vnormalize(vcross( Corner_Bot_2- Corner_Bot_3, Corner_Top_3- Corner_Bot_3)) + vnormalize(vcross( Corner_Bot_3- Corner_Bot_2,Corner_BBot_2- Corner_Bot_2)) + vnormalize(vcross(Corner_BBot_2-Corner_BBot_3, Corner_Bot_3-Corner_BBot_3))) / 3;
			#local Normal_Bot_2a = (vnormalize(vcross( Corner_Bot_1- Corner_Bot_2, Corner_Top_2- Corner_Bot_2)) + vnormalize(vcross( Corner_Bot_2- Corner_Bot_1,Corner_BBot_1- Corner_Bot_1)) + vnormalize(vcross(Corner_BBot_1-Corner_BBot_3, Corner_Bot_2-Corner_BBot_2))) / 3;
			#local Normal_Top_2b = (vnormalize(vcross( Corner_Top_3- Corner_Top_2, Corner_Bot_2- Corner_Top_2)) + vnormalize(vcross( Corner_Top_2- Corner_Top_3,Corner_TTop_3- Corner_Top_3)) + vnormalize(vcross(Corner_TTop_3-Corner_TTop_2, Corner_Top_2-Corner_TTop_2))) / 3;
			#local Normal_Bot_2b = (vnormalize(vcross( Corner_Bot_3- Corner_Bot_2,Corner_BBot_2- Corner_Bot_2)) + vnormalize(vcross( Corner_Bot_2- Corner_Bot_3, Corner_Top_3- Corner_Bot_3)) + vnormalize(vcross( Corner_Top_3- Corner_Top_2, Corner_Bot_2- Corner_Top_2))) / 3;

			smooth_triangle
			{
				Corner_Top_3, Normal_Top_3a,
				Corner_Bot_3, Normal_Bot_3a,
				Corner_Bot_2, Normal_Bot_2b
			}
			smooth_triangle
			{
				Corner_Bot_2, Normal_Bot_2b,
				Corner_Top_2, Normal_Top_2b,
				Corner_Top_3, Normal_Top_3a
			}

			#local Normal_Top_2a = (vnormalize(vcross( Corner_Top_1- Corner_Top_2,Corner_TTop_2- Corner_Top_2)) + vnormalize(vcross( Corner_Top_2- Corner_Top_1, Corner_Bot_1- Corner_Top_1)) + vnormalize(vcross( Corner_Bot_1- Corner_Bot_2, Corner_Top_2- Corner_Bot_2))) / 3;
			#local Normal_Top_1a = (vnormalize(vcross( Corner_Top_4- Corner_Top_1,Corner_TTop_1- Corner_Top_1)) + vnormalize(vcross( Corner_Top_1- Corner_Top_4, Corner_Bot_4- Corner_Top_4)) + vnormalize(vcross( Corner_Bot_4- Corner_Bot_1, Corner_Top_1- Corner_Bot_1))) / 3;
			#local Normal_Bot_2a = (vnormalize(vcross( Corner_Bot_1- Corner_Bot_2, Corner_Top_2- Corner_Bot_2)) + vnormalize(vcross( Corner_Bot_2- Corner_Bot_1,Corner_BBot_1- Corner_Bot_1)) + vnormalize(vcross(Corner_BBot_1-Corner_BBot_2, Corner_Bot_2-Corner_BBot_2))) / 3;
			#local Normal_Bot_1a = (vnormalize(vcross( Corner_Bot_4- Corner_Bot_1, Corner_Top_1- Corner_Bot_1)) + vnormalize(vcross( Corner_Bot_1- Corner_Bot_4,Corner_BBot_4- Corner_Bot_4)) + vnormalize(vcross(Corner_BBot_4-Corner_BBot_2, Corner_Bot_1-Corner_BBot_1))) / 3;
			#local Normal_Top_1b = (vnormalize(vcross( Corner_Top_2- Corner_Top_1, Corner_Bot_1- Corner_Top_1)) + vnormalize(vcross( Corner_Top_1- Corner_Top_2,Corner_TTop_2- Corner_Top_2)) + vnormalize(vcross(Corner_TTop_2-Corner_TTop_1, Corner_Top_1-Corner_TTop_1))) / 3;
			#local Normal_Bot_1b = (vnormalize(vcross( Corner_Bot_2- Corner_Bot_1,Corner_BBot_1- Corner_Bot_1)) + vnormalize(vcross( Corner_Bot_1- Corner_Bot_2, Corner_Top_2- Corner_Bot_2)) + vnormalize(vcross( Corner_Top_2- Corner_Top_1, Corner_Bot_1- Corner_Top_1))) / 3;

			smooth_triangle
			{
				Corner_Top_2, Normal_Top_2a,
				Corner_Bot_2, Normal_Bot_2a,
				Corner_Bot_1, Normal_Bot_1b
			}
			smooth_triangle
			{
				Corner_Bot_1, Normal_Bot_1b,
				Corner_Top_1, Normal_Top_1b,
				Corner_Top_2, Normal_Top_2a
			}

			#local Side_A1 = Side_A2;
			#local Side_C1 = Side_C2;
			#local Side_B1 = Side_B2;
			#local Level_Count = Level_Count + 1;
		#end
		inside_vector x
	}
	// floors
	#local floor_object = intersection
	{
		object {glass_mesh}
		union
		{
			#local Level_Count = 0;
			#while (Level_Count <= Levels)
				#local y_adjust = y * (Level_Count+1) * city_storey_height;
				cyl_box(<-16,-0.2,-16> * Scale + Translate + y_adjust,<+16,+0.2,+16> * Scale + Translate + y_adjust)			
				#local Level_Count = Level_Count + 1;
			#end
		}
		scale 0.99
	}
	union
	{
		difference
		{
			cyl_box(<-16,0,-16> * Scale + Translate,<+16,city_grass_height,+16> * Scale + Translate)
			cyl_box(<-2,-1,-17> * Scale + Translate,<+2,2,+17> * Scale + Translate)
			cyl_box(<-17,-1,-2> * Scale + Translate,<+17,2,+2> * Scale + Translate)
			texture {grass_tex}
		}
		object
		{
			pos_object(floor_object, Translate)
			texture {main_tex}
		}
		object
		{
			pos_object(glass_mesh, Translate)
			material {glass_mat}
			hollow
		}
	}
#end


//------------------------------------------------------------------------------8

// OFFICE BUILDING #8 - white spindle
#macro Office_Building_8(Size, Direction, Translate)
	#debug "CG...............Adding Office_Building_8.\n"
	#local Levels		= ceil(Size.y/city_storey_height);
	#local building_size	= <32, 4, 32>;
	#local Scale		= <Size.x/building_size.x,city_storey_height/building_size.y,Size.z/building_size.z>;
	#local Height_Adjust	= 3;
	#local grass_pigment_1 = pigment
	{
		image_map {png "olivepink_marble.png"}
		translate	y * -1/2
		translate	x * -1/2
		rotate		x * 90
		scale		Size
	}
	#local grass_pigment_2 = pigment
	{
//		gamma_color_adjust(<046,104,058,>/255/2)
		gamma_color_adjust(<110,160,008,>/255/2*1.3)	// oyonale makegrass color
	}
	#local grass_pigment_3 = pigment
	{
		average
		pigment_map
		{
			[1	grass_pigment_1]
			[2	grass_pigment_2]
		}
	}
	#local grass_tex = texture
	{
		pigment {grass_pigment_3}
		normal	{wrinkles}
		scale city_units
	}
	#local main_tex = texture
	{
		pigment {gamma_color_adjust(<1,1,1>)}
		scale city_units
	}
	#local glass_mat = material
	{
		interior {I_Glass4}		//I_Glass4
		texture
		{
			pigment {gamma_color_adjust(1) filter 0 transmit .5}
			normal {bumps .05 scale .1}
			finish {specular .5 roughness .1 reflection <.3, .4, .5>}
		}
		scale city_units
	}
	#local torus_obj = intersection
	{
		torus
		{
			Size.x/2, Size.x/2
			translate y * Size.x/2
			inverse
		}
		cylinder
		{
			0, y * Size.x/2, Size.x/2
		}
		scale y * Size.y/Size.x * Height_Adjust
	}
	#local floor_obj = union
	{
		#local Level_Count = 0;
		#while (Level_Count < Levels * Height_Adjust)
			intersection
			{
				object {torus_obj}
				difference
				{
					cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - (Level_Count+1) * city_storey_height}
					cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - (Level_Count+1) * city_storey_height - city_units/4}
				}
			}
			#local Level_Count = Level_Count + 1;
		#end
	}
	#local wall_obj = union
	{
		#local Radial_Total = 6;
		#local Radial_Count = 0;
		#while (Radial_Count < Radial_Total)
			intersection
			{
				object {torus_obj}
				box
				{
					<-0.1,  -0,  -0>, <+0.1, +128, +16>
					rotate y * Radial_Count * 360/Radial_Total
					scale Scale
				}
			}
			#local Radial_Count = Radial_Count + 1;
		#end
	}
	#local glass_obj = difference
	{
		object {torus_obj scale 0.99}
		object {torus_obj scale 0.98}
		cylinder {<0,city_radius,-32>, <0,city_radius,+32>, city_radius - city_storey_height inverse}
		hollow
	}
	#local grass_obj = difference
	{
		cyl_box(<-16,0,-16> * Scale + Translate,<+16,city_grass_height,+16> * Scale + Translate)
//		cyl_box(<-2,-1,-17> * Scale + Translate,<+2,2,+17> * Scale + Translate)
//		cyl_box(<-17,-1,-2> * Scale + Translate,<+17,2,+2> * Scale + Translate)
		pos_object(con_macro(y * city_radius, 0, 0, 10 * Scale.x), Translate)
		pos_object(object {wall_obj rotate y * 0 scale 16}, Translate)
	}
	union
	{
		object
		{
			pos_object(floor_obj, Translate)
			texture {main_tex}
		}
		object
		{
			pos_object(wall_obj, Translate)
			texture {main_tex}
		}
		object
		{
			pos_object(glass_obj, Translate)
			material {glass_mat}
		}
		object
		{
			grass_obj
			texture {grass_tex}
		}
		// trees
		#local tree_total = 6;
		#local tree_count = 0;
		#while (tree_count < tree_total)
			#local tree_theta = tree_count/tree_total*2*pi;
			#local tree_radius = 13;
			#local tree_point = <tree_radius * cos(tree_theta),city_grass_height/Scale.y,tree_radius * sin(tree_theta)>;
			object {pos_object(tree_macro(_CT_rand2), tree_point * Scale + Translate)}
			#local tree_count = tree_count + 1;
		#end
	}
#end

#local delta_building_height = max_building_height - min_building_height;
#local Size = <building_width,rand(Seed)*delta_building_height+min_building_height,building_width>;
#local Direction = 1;
#local Translate = 0;

object
{
	Basic_Floor
	texture {Plain_Gray}
}

// need to come up with two new building types...
#switch (frame_number)
	#case (0)
		object {Office_Building_1(Size, Direction, Translate)}
	#break
	#case (1)
		object {Office_Building_2(Size, Direction, Translate)}
	#break
	#case (2)
		object {Office_Building_3(Size, Direction, Translate)}
	#break
	#case (3)
		object {Office_Building_4(Size, Direction, Translate)}
	#break
	#case (4)
		object {Office_Building_5(Size, Direction, Translate)}
	#break
	#case (5)
		object {Office_Building_6(Size, Direction, Translate)}
	#break
	#case (6)
		object {Office_Building_7(Size, Direction, Translate)}
	#break
	#case (7)
		object {Office_Building_8(Size, Direction, Translate)}
	#break
	#case (8)
		object {Office_Building_1(Size, Direction, Translate)}
	#break
	#case (9)
		object {Office_Building_2(Size, Direction, Translate)}
	#break
	#case (10)
		object {Office_Building_3(Size, Direction, Translate)}
	#break
	#case (11)
		object {Office_Building_4(Size, Direction, Translate)}
	#break
	#case (12)
		object {Office_Building_5(Size, Direction, Translate)}
	#break
	#case (13)
		object {Office_Building_6(Size, Direction, Translate)}
	#break
	#case (14)
		object {Office_Building_7(Size, Direction, Translate)}
	#break
	#case (15)
		object {Office_Building_8(Size, Direction, Translate)}
	#break
#end
