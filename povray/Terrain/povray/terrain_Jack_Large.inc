#macro Jack_Deco_Object()
	#local TempAngle = pi/2 - atan(1/cos(pi/4));
	#local jack_width = 1/16;
	#local jack_length = 1/2;
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
		texture
		{
			pigment {gamma_color_adjust(x/2)}
			finish {Default_Finish}
		}
	}
#end

object {Jack_Deco_Object() scale Width rotate y * rand(Seed) * 360}
