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
//gh_wraith2_POV_main.ini (initialization file - open this to render)
//gh_wraith2_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_wraith2_POV_geom.inc (geometry mesh)
//gh_wraith2_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 396
//Number of vertices............. 200
//Number of normals.............. 200
//Number of UV coordinates....... 327
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.02120968,0.05175213)
//                        to u,v=(0.9543966,0.9766178)
//Bounding Box....... from x,y,z=(-0.2904293,0,-0.3714008)
//                      to x,y,z=(0.2904293,0.1964292,0.3714008)
//                 size dx,dy,dz=(0.5808585,0.1964292,0.7428015)
//                  center x,y,z=(0,0.0982146,0)
//                       diagonal 0.9631901
//Surface area................... 0.4952044
//             Smallest face area 5.944062E-5
//              Largest face area 0.01692529
//Memory allocated for geometry.. 41 KBytes
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
#include "aer_wraith_geom.inc" //Geometry
 
//Assembled object that is contained in gh_wraith2_POV_geom.inc
object{
      gh_wraith2_
	scale 5.5
	scale 5 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
