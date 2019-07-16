//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.8.18.390
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//final_POV_main.ini (initialization file - open this to render)
//final_POV_scene.pov (scene setup of cameras, lights and geometry)
//final_POV_geom.inc (geometry mesh)
//final_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 9667
//Number of vertices............. 5157
//Number of normals.............. 12711
//Number of UV coordinates....... 389
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 111
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0,0)
//                        to u,v=(1,1)
//Bounding Box....... from x,y,z=(-157.097,-9.759712,-104.0915)
//                      to x,y,z=(157.097,576.5452,59.27136)
//                 size dx,dy,dz=(314.194,586.3049,163.3629)
//                  center x,y,z=(7.629395E-6,283.3927,-22.41007)
//                       diagonal 684.9516
//Surface area................... 731452
//             Smallest face area 2.785716E-5
//              Largest face area 2770.165
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H477 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#declare Show_AxisMarker = 0; 
//#include "GearHead.inc"
#include "GearHead_nice_render.inc"

#include "colors.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "btr_unnamed_1_geom.inc" //Geometry
 

//Assembled object that is contained in final_POV_geom.inc
object
{
	final_
	scale Scale_LDraw
	scale 1/8
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
