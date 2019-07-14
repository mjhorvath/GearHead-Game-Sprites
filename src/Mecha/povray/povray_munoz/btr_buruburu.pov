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
//btr_buruburu_POV_main.ini (initialization file - open this to render)
//btr_buruburu_POV_scene.pov (scene setup of cameras, lights and geometry)
//btr_buruburu_POV_geom.inc (geometry mesh)
//btr_buruburu_POV_mat.inc (materials)
//gh-burub.bmp
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 924
//Number of vertices............. 464
//Number of normals.............. 464
//Number of UV coordinates....... 362
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.0172806,0.04534675)
//                        to u,v=(0.9575103,0.9642234)
//Bounding Box....... from x,y,z=(-0.2327257,0,-0.09405076)
//                      to x,y,z=(0.2327257,0.7185579,0.1493388)
//                 size dx,dy,dz=(0.4654513,0.7185579,0.2433895)
//                  center x,y,z=(0,0.3592789,0.027644)
//                       diagonal 0.8900611
//Surface area................... 1.089135
//             Smallest face area 4.489395E-5
//              Largest face area 0.007033414
//Memory allocated for geometry.. 83 KBytes
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
#include "btr_buruburu_geom.inc" //Geometry

//Assembled object that is contained in btr_buruburu_POV_geom.inc
object{
      gh_buruburu_
	scale 1.4
	scale 16 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
