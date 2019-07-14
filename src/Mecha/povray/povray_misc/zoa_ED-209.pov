// by jean.darc at turbosquid.com

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
//ED-209_POV_main.ini (initialization file - open this to render)
//ED-209_POV_scene.pov (scene setup of cameras, lights and geometry)
//ED-209_POV_geom.inc (geometry mesh)
//ED-209_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 41459
//Number of vertices............. 27565
//Number of normals.............. 48697
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 9
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-3.915039,-4.378906,-4.879944)
//                      to x,y,z=(3.916962,4.378906,4.879822)
//                 size dx,dy,dz=(7.832001,8.757813,9.759766)
//                  center x,y,z=(0.0009613037,0,-6.103516E-5)
//                       diagonal 15.27392
//Surface area................... 630.4455
//             Smallest face area 1.907349E-6
//              Largest face area 1.601262
//Memory allocated for geometry.. 4 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H477 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#include "gearhead.inc"
#include "zoa_ED-209_geom.inc" //Geometry

//Assembled object that is contained in ED-209_POV_geom.inc
object
{
	ED_209_
	translate y * 8.757813/2
	scale 3
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
