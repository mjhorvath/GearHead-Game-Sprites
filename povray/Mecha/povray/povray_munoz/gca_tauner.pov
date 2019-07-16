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
//gh_tauner_POV_main.ini (initialization file - open this to render)
//gh_tauner_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_tauner_POV_geom.inc (geometry mesh)
//gh_tauner_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 898
//Number of vertices............. 449
//Number of normals.............. 449
//Number of UV coordinates....... 625
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.01763967,0.02281362)
//                        to u,v=(0.9787822,0.9731484)
//Bounding Box....... from x,y,z=(-0.2116086,0,-0.2730548)
//                      to x,y,z=(0.2116086,0.3086171,0.307592)
//                 size dx,dy,dz=(0.4232171,0.3086171,0.5806467)
//                  center x,y,z=(0,0.1543086,0.01726859)
//                       diagonal 0.7819897
//Surface area................... 0.9070497
//             Smallest face area 1.36306E-5
//              Largest face area 0.005295705
//Memory allocated for geometry.. 87 KBytes
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
#include "gca_tauner_geom.inc" //Geometry

//Assembled object that is contained in gh_tauner_POV_geom.inc
object{
      gh_tauner_
	scale 3.2
	scale 6 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
