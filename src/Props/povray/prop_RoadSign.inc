#local leg_thick = 0.03;
#local leg_separate = 1/3;
#local total_height = 1;
#local sign_width = 1/2;
#local sign_height = 1/2;
#local sign_thick = 0.01;
//#local sign_width = 0.553;
//#local sign_height = 0.433;
//#local sign_thick = 0.01;


union
{
	box
	{
		<-leg_separate/2-leg_thick/2,0,-leg_thick>,
		<-leg_separate/2+leg_thick/2,+total_height,0>
		pigment {DarkTan}
	}
	box
	{
		<+leg_separate/2-leg_thick/2,0,-leg_thick>,
		<+leg_separate/2+leg_thick/2,+total_height,0>
		pigment {DarkTan}
	}
	box
	{
		<-sign_width/2,+total_height-sign_height,0>,
		<+sign_width/2,+total_height,+sign_thick>
		pigment {White}
	}

	polygon
	{
		4, <0, 0,>, <1, 0,>, <1, 1,>, <0, 1,>
		pigment {image_map {png "Helsinki_tram_map.png" gamma 50}}
		translate <-0.5, 0, 0>
		scale <sign_width,sign_height,1>
		rotate y * 180
		translate <0,total_height-sign_height,sign_thick+0.00001>
	}

	rotate y * 90
	scale Width
}
