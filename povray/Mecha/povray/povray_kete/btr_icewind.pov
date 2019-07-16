//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.12.2.456
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//gh2_icewind_POV_main.ini (initialization file - open this to render)
//gh2_icewind_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_icewind_POV_geom.inc (geometry mesh)
//gh2_icewind_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 19548
//Number of vertices............. 9840
//Number of normals.............. 12094
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 7
//Number of groups/meshes........ 19
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-1.763337,-7.110811,-0.9208703)
//                      to x,y,z=(1.763337,0.6237145,1.483168)
//                 size dx,dy,dz=(3.526673,7.734526,2.404038)
//                  center x,y,z=(0,-3.243548,0.2811489)
//                       diagonal 8.834009
//Surface area................... 107.3198
//             Smallest face area 5.139921E-6
//              Largest face area 0.4286635
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Meters = 4;
#declare BG_Color = 0;
#include "GearHead.inc"
#include "btr_icewind_geom.inc" //Geometry

//Bounding Box....... from x,y,z=(-1.763337,-7.110811,-0.9208703)
//                      to x,y,z=(1.763337,0.6237145,1.483168)
//Assembled object that is contained in gh2_icewind_POV_geom.inc
object
{
	gh2_icewind_
	translate y * 7.110811
	scale 1/7.3
	scale 13 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
