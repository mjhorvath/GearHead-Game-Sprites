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
//gh2_warcry_POV_main.ini (initialization file - open this to render)
//gh2_warcry_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_warcry_POV_geom.inc (geometry mesh)
//gh2_warcry_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 91140
//Number of vertices............. 45688
//Number of normals.............. 49747
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 11
//Number of groups/meshes........ 20
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-4.03954,-18.51981,-2.204845)
//                      to x,y,z=(4.03954,1.254402,3.223392)
//                 size dx,dy,dz=(8.07908,19.77421,5.428238)
//                  center x,y,z=(0,-8.632702,0.5092736)
//                       diagonal 22.03989
//Surface area................... 555.9663
//             Smallest face area 3.234756E-10
//              Largest face area 0.3155871
//Memory allocated for geometry.. 7 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

//#include "GearHead_nice_render.inc"
#include "GearHead.inc"
#include "All_Textures.inc"
#include "gh2_warcry_POV_geom.inc" //Geometry

//Assembled object that is contained in gh2_warcry_POV_geom.inc
object
{
	gh2_warcry_
	translate y * 18.51981
	scale 3
	rotate y * clock * 360
}
//==================================================
