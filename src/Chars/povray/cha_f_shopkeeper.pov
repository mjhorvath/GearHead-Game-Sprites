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
//gh_f_shopkeeper_POV_main.ini (initialization file - open this to render)
//gh_f_shopkeeper_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_f_shopkeeper_POV_geom.inc (geometry mesh)
//gh_f_shopkeeper_POV_mat.inc (materials)
//gh-f-shopkeeper-texture.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 874
//Number of vertices............. 439
//Number of normals.............. 439
//Number of UV coordinates....... 611
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.005992128,0.01197509)
//                        to u,v=(0.9931743,0.9915599)
//Bounding Box....... from x,y,z=(-0.1121325,0,-0.07077431)
//                      to x,y,z=(0.1121325,0.6750479,0.07077431)
//                 size dx,dy,dz=(0.224265,0.6750479,0.1415486)
//                  center x,y,z=(0,0.3375239,0)
//                       diagonal 0.7252727
//Surface area................... 0.308306
//             Smallest face area 1.358796E-5
//              Largest face area 0.005891237
//Memory allocated for geometry.. 85 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "GearHead.inc"
#include "cha_f_shopkeeper_geom.inc" //Geometry
 
//Assembled object that is contained in gh_f_shopkeeper_POV_geom.inc
object{
      gh_f_shopkeeper_
	scale 100
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
