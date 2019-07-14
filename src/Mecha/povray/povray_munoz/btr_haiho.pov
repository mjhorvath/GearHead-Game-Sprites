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
//gh_haiho_POV_main.ini (initialization file - open this to render)
//gh_haiho_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_haiho_POV_geom.inc (geometry mesh)
//gh_haiho_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 874
//Number of vertices............. 439
//Number of normals.............. 503
//Number of UV coordinates....... 390
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.04728421,0.01505853)
//                        to u,v=(0.9884587,0.9535747)
//Bounding Box....... from x,y,z=(-0.2598897,0,-0.102628)
//                      to x,y,z=(0.2598897,0.5834245,0.1639588)
//                 size dx,dy,dz=(0.5197794,0.5834245,0.2665868)
//                  center x,y,z=(0,0.2917123,0.03066539)
//                       diagonal 0.8256048
//Surface area................... 0.8853147
//             Smallest face area 5.877953E-5
//              Largest face area 0.01166812
//Memory allocated for geometry.. 81 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
//#declare Camera_Mode = 3;
//#declare Show_GridMarker = 0;
//#declare Show_BasicFloor = 0;
//#declare Show_AxisMarker = 0;
//#declare Show_HeightScale = 1;

#include "GearHead.inc"
#include "btr_haiho_geom.inc" //Geometry
 
//Assembled object that is contained in gh_haiho_POV_geom.inc
object{
      gh_haiho_
	scale 1.7
	scale 13 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
