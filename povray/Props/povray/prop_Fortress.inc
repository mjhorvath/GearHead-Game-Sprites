// Wall textures
//#include "..\\Walls\\Walls_Textures.inc"                 // Source of the textures

#macro Flat_Wall_Prototype(North,East,South,West)
	#ifndef (Hgh) #local Hgh = Height; #end
	#ifndef (Wid) #local Wid = Width/2; #end
	#ifndef (Bot) #local Bot = BotThick; #end
	#ifndef (Top) #local Top = TopThick; #end
	#local BotWid = Wid * Bot;
	#local TopWid = BotWid * Top;
	#local Ang = degrees(atan(Hgh/(BotWid-TopWid)));

	intersection
	{
		union
		{
			intersection
			{
				plane
				{
					y, 0
					rotate x * -Ang translate z * -BotWid
					texture {Wall_Texture rotate y * 180 * AlignY}
				}
				plane
				{
					y, 0
					rotate x * Ang translate z * BotWid
					texture {Wall_Texture rotate y * 000 * AlignY}
				}
			}
			intersection
			{
				plane
				{
					y, 0
					rotate z * Ang translate x * -BotWid
					texture {Wall_Texture rotate y * 270 * AlignY}
				}
				plane
				{
					y, 0
					rotate z * -Ang translate x * BotWid
					texture {Wall_Texture rotate y * 090 * AlignY}
				}
			}
		}
		#if (North = 0)
			plane
			{
				y, 0
				rotate x * -Ang translate z * -BotWid
				texture {Wall_Texture rotate y * 180 * AlignY}
			}
		#end
		#if (East = 0)
			plane
			{
				y, 0
				rotate z * Ang translate x * -BotWid
				texture {Wall_Texture rotate y * 270 * AlignY}
			}
		#end
		#if (South = 0)
			plane
			{
				y, 0
				rotate x * Ang translate z * BotWid
				texture {Wall_Texture rotate y * 000 * AlignY}
			}
		#end
		#if (West = 0)
			plane
			{
				y, 0
				rotate z * -Ang translate x * BotWid
				texture {Wall_Texture rotate y * 090 * AlignY}
			}
		#end
		plane {x, Wid texture {Mask_Texture rotate y * 090 * AlignY}}
		plane {-x, Wid texture {Mask_Texture rotate y * 270 * AlignY}}
		plane {y, Hgh texture {Mask_Texture}}
		plane {-y, 0 texture {Mask_Texture}}
		plane {z, Wid texture {Mask_Texture rotate y * 000 * AlignY}}
		plane {-z, Wid texture {Mask_Texture rotate y * 180 * AlignY}}
	}
#end

#macro Stone_Wall_Object(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/2;
	#local TopThick = 1/2;
	#local Wall_Texture = StoneBlock_Texture_c;
	#local Mask_Texture = Plain_OffBlack;
	Flat_Wall_Prototype(North,East,South,West)
#end

#macro Red_Wall_Object(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1;
	#local TopThick = 1;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Flat_Wall_Prototype(North,East,South,West)
#end

#macro Fortress_Wall_Object(North,East,South,West)
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Gray;
	#local Mask_Texture = Plain_Gray;
	union
	{
		Flat_Wall_Prototype(North,East,South,West)
		#if ((North + South = 1) | (East + West = 1) |  (North + East + South + West > 2) | (North + East + South + West = 0))
			box
			{
				<-Width/6,0,-Width/6,>,
				<Width/6,Height,Width/6,>
				texture {Plain_Gray}
			}
	//		#if (North + East + South + West > 2)
				difference
				{
					box
					{
						<-Width/8,Height+0,-Width/8,>,
						<+Width/8,Height+6,+Width/8,>
						texture {Plain_Gray}
					}
					box
					{
						<-Width/8,Height+0,-Width/8+2,>,
						<+Width/8,Height+6,+Width/8-2,>
						texture {Plain_Clear}
					}
					box
					{
						<-Width/8+2,Height+0,-Width/8,>,
						<+Width/8-2,Height+6,+Width/8,>
						texture {Plain_Clear}
					}
				}
				box
				{
					<-Width/6,Height+6,-Width/6,>,
					<+Width/6,Height+8,+Width/6,>
					texture {Plain_Gray}
				}
	//		#end
		#end
	}
#end

// the wall object
object
{
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 1;			// ...
	#local South = 0;			// ...
	#local West  = 0;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * Width/4
	translate z * Width/4
//	no_shadow
}
object
{
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 1;			// ...
	#local West  = 0;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * Width/4
	translate z * 0
//	no_shadow
}
object
{
	#local North = 0;			// is the hill connected on this side? (0 or 1)
	#local East  = 1;			// ...
	#local South = 1;			// ...
	#local West  = 0;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * Width/4
	translate z * -Width/4
//	no_shadow
}
object
{
	#local North = 0;			// is the hill connected on this side? (0 or 1)
	#local East  = 1;			// ...
	#local South = 0;			// ...
	#local West  = 1;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * 0
	translate z * -Width/4
//	no_shadow
}
object
{
	#local North = 0;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 1;			// ...
	#local West  = 1;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * -Width/4
	translate z * -Width/4
//	no_shadow
}
object
{
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 1;			// ...
	#local West  = 0;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * -Width/4
	translate z * 0
//	no_shadow
}
object
{
	#local North = 1;			// is the hill connected on this side? (0 or 1)
	#local East  = 0;			// ...
	#local South = 0;			// ...
	#local West  = 1;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * -Width/4
	translate z * Width/4
//	no_shadow
}
object
{
	#local North = 0;			// is the hill connected on this side? (0 or 1)
	#local East  = 1;			// ...
	#local South = 0;			// ...
	#local West  = 1;			// ...
	#local AlignY = 1;
	#local BotThick = 1/3;
	#local TopThick = 1/2;
	#local Height = 32;
	#local Wall_Texture = Plain_Red;
	#local Mask_Texture = Plain_Red;
	Fortress_Wall_Object(North,East,South,West)
	scale 1/4
	translate x * 0
	translate z * Width/4
//	no_shadow
}
