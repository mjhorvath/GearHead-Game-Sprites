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
//btr_chameleon_mod_POV_main.ini (initialization file - open this to render)
//btr_chameleon_mod_POV_scene.pov (scene setup of cameras, lights and geometry)
//btr_chameleon_mod_POV_geom.inc (geometry mesh)
//btr_chameleon_mod_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 4704
//Number of vertices............. 2384
//Number of normals.............. 9592
//Number of UV coordinates....... 3046
//Number of lines................ 0
//Number of materials............ 6
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.125,0)
//                        to u,v=(0.875,1)
//Bounding Box....... from x,y,z=(-5.330963,-0.091835,-3.475794)
//                      to x,y,z=(5.330963,17.15055,2.616394)
//                 size dx,dy,dz=(10.66193,17.24239,6.092188)
//                  center x,y,z=(0,8.529358,-0.4297)
//                       diagonal 21.16817
//Surface area................... 533.2152
//             Smallest face area 0.0007211877
//              Largest face area 1.714973
//Memory allocated for geometry.. 677 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H240 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
//#declare Camera_Mode = 3;
//#declare Show_GridMarker = 0;
//#declare Show_BasicFloor = 0;
//#declare Show_AxisMarker = 0;
//#declare Show_HeightScale = 1;

#include "GearHead.inc"
#include "btr_chameleon_geom.inc" //Geometry
 
//Assembled object that is contained in btr_chameleon_mod_POV_geom.inc
object{
      btr_chameleon_mod_
	scale 1/16
	scale 14 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
