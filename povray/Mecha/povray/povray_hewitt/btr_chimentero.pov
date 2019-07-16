//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.11.0.436
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//Robo_Torso_POV_main.ini (initialization file - open this to render)
//Robo_Torso_POV_scene.pov (scene setup of cameras, lights and geometry)
//Robo_Torso_POV_geom.inc (geometry mesh)
//Robo_Torso_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 2238
//Number of vertices............. 1153
//Number of normals.............. 2852
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 4
//Number of groups/meshes........ 9
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-3.039925,-3.971931,-3.413519)
//                      to x,y,z=(3.053103,2.210557,3.516983)
//                 size dx,dy,dz=(6.093028,6.182487,6.930502)
//                  center x,y,z=(0.006589055,-0.8806871,0.05173218)
//                       diagonal 11.10765
//Surface area................... 194.9233
//             Smallest face area 0.0001074517
//              Largest face area 1.534305
//Memory allocated for geometry.. 262 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W640 +H480 +FN +AM3 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
//#include "GearHead_nice_render.inc"
#include "GearHead.inc"
#include "All_Textures.inc"
#include "stdinc.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "btr_chimentero_geom.inc" //Geometry

 
//Assembled object that is contained in Robo_Torso_POV_geom.inc
object{
      Robo_Torso_
      translate y * 3.971931
      rotate y * -45
      scale 5
	rotate y * clock * 360
      }
//==================================================
