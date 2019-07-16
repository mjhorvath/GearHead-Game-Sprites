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
//btr_joust_mod_POV_main.ini (initialization file - open this to render)
//btr_joust_mod_POV_scene.pov (scene setup of cameras, lights and geometry)
//btr_joust_mod_POV_geom.inc (geometry mesh)
//btr_joust_mod_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 3980
//Number of vertices............. 2012
//Number of normals.............. 8016
//Number of UV coordinates....... 2273
//Number of lines................ 0
//Number of materials............ 5
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.125,0)
//                        to u,v=(0.875,1)
//Bounding Box....... from x,y,z=(-5.87497,0,-3.002182)
//                      to x,y,z=(5.87497,16.55752,2.439253)
//                 size dx,dy,dz=(11.74994,16.55752,5.441435)
//                  center x,y,z=(0,8.27876,-0.2814645)
//                       diagonal 21.01956
//Surface area................... 546.7634
//             Smallest face area 0.0005174363
//              Largest face area 1.751241
//Memory allocated for geometry.. 562 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H240 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

//#declare Camera_Mode = 3;
//#declare Show_GridMarker = 0;
//#declare Show_BasicFloor = 0;
//#declare Show_AxisMarker = 1;
//#declare Show_HeightScale = 1;

#include "GearHead.inc"
#include "btr_joust_geom.inc" //Geometry
 
//Assembled object that is contained in btr_joust_mod_POV_geom.inc
object{
      btr_joust_mod_
	scale 1/16
	scale 16 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
