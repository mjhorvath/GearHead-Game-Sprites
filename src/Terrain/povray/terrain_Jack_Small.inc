#macro Jack_Deco_Object()
	#local TempAngle = pi/2 - atan(1/cos(pi/4));
	#local jack_width = Width/16;
	#local jack_length = Width/2;
	#local jack_box = box
	{
		-1,+1
		scale <jack_length,jack_width,jack_width>
	}
	union
	{
		object {jack_box}
		object {jack_box rotate y * 90}
		object {jack_box rotate z * 90}
		rotate x * 45
		rotate z * degrees(TempAngle)
		translate y * sin(TempAngle) * jack_length
		scale 1/4
		texture
		{
			pigment {gamma_color_adjust(x/2)}
			finish {Default_Finish}
		}
	}
#end

object {Jack_Deco_Object() rotate y * rand(Seed) * 360 translate <rand(Seed)*Width-Width/2,0,rand(Seed)*Width-Width/2>}
object {Jack_Deco_Object() rotate y * rand(Seed) * 360 translate <rand(Seed)*Width-Width/2,0,rand(Seed)*Width-Width/2>}
object {Jack_Deco_Object() rotate y * rand(Seed) * 360 translate <rand(Seed)*Width-Width/2,0,rand(Seed)*Width-Width/2>}
object {Jack_Deco_Object() rotate y * rand(Seed) * 360 translate <rand(Seed)*Width-Width/2,0,rand(Seed)*Width-Width/2>}
