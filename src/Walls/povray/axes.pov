#declare Camera_Mode = 3;

#include "GearHead.inc"

object
{
	Axes_Macro
	(
		512,			// The distance from the origin to one of the grid's edges.	(float)
		Width,			// The size of each large-unit square.	(float)
		1,			// The number of small-unit squares that make up a large-unit square.	(integer)
		1/256,			// The thickness of the grid lines (as a factor of Axes_axesSize).	(float)
		0,			// Turns the axes on/off. (boolian)
		1,			// Turns the minor units on/off. (boolian)
		0,			// Turns the plane perpendicular to the x-axis on/off.	(boolian)
		1,			// Turns the plane perpendicular to the y-axis on/off.	(boolian)
		0			// Turns the plane perpendicular to the z-axis on/off.	(boolian)
	)
	Axes_Object
}
