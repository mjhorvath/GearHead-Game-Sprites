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
//petrobot_POV_main.ini (initialization file - open this to render)
//petrobot_POV_scene.pov (scene setup of cameras, lights and geometry)
//petrobot_POV_geom.inc (geometry mesh)
//petrobot_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 574
//Number of vertices............. 289
//Number of normals.............. 289
//Number of UV coordinates....... 393
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.2769608,0.01176494)
//                        to u,v=(0.9907509,0.9649882)
//Bounding Box....... from x,y,z=(-0.1336976,0.003741555,-0.1579256)
//                      to x,y,z=(0.1336976,0.2581318,0.1324943)
//                 size dx,dy,dz=(0.2673951,0.2543902,0.2904199)
//                  center x,y,z=(0,0.1309367,-0.01271564)
//                       diagonal 0.4696363
//Surface area................... 0.2226441
//             Smallest face area 1.929896E-5
//              Largest face area 0.002565648
//Memory allocated for geometry.. 56 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "GearHead.inc"
#include "monster_petrobot_geom.inc" //Geometry

//Assembled object that is contained in petrobot_POV_geom.inc
object{
      petrobot_
	scale 100
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
