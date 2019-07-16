// Author: slippy0 at turbosquid.com

//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.8.18.390
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//product_POV_main.ini (initialization file - open this to render)
//product_POV_scene.pov (scene setup of cameras, lights and geometry)
//product_POV_geom.inc (geometry mesh)
//product_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 9466
//Number of vertices............. 5342
//Number of normals.............. 11331
//Number of UV coordinates....... 3852
//Number of lines................ 0
//Number of materials............ 5
//Number of groups/meshes........ 30
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0,0)
//                        to u,v=(1,1)
//Bounding Box....... from x,y,z=(-323.97,-0.8640003,-231.006)
//                      to x,y,z=(35.87901,561.3802,231.006)
//                 size dx,dy,dz=(359.849,562.2442,462.012)
//                  center x,y,z=(-144.0455,280.2581,2.842171E-14)
//                       diagonal 811.8282
//Surface area................... 1268803
//             Smallest face area 1.188426E-6
//              Largest face area 5172.303
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H477 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Show_AxisMarker = 0;
#include "gearhead.inc"

#include "colors.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "btr_product_geom.inc" //Geometry
 

//Assembled object that is contained in product_POV_geom.inc
object
{
	product_
	scale Scale_LDraw
	scale 1/8
	translate x*16
	rotate y * -135
	rotate y * clock * 360
}
//==================================================
