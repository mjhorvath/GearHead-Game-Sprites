//==================================================
//POV-Ray Main scene file
//==================================================
//This file has been created by PoseRay v3.10.3.412
//3D model to POV-Ray/Moray Converter.
//Author: FlyerX
//Email: flyerx_2000@yahoo.com
//Web: http://mysite.verizon.net/sfg0000/
//==================================================
//Files needed to run the POV-Ray scene:
//F601_B_POV_main.ini (initialization file - open this to render)
//F601_B_POV_scene.pov (scene setup of cameras, lights and geometry)
//F601_B_POV_geom.inc (geometry mesh)
//F601_B_POV_mat.inc (materials)
//METAL7.JPG
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 27491
//Number of vertices............. 31338
//Number of normals.............. 37585
//Number of UV coordinates....... 26754
//Number of lines................ 0
//Number of materials............ 15
//Number of groups/meshes........ 38
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(-0.3334598,-0.2480129)
//                        to u,v=(1.260622,1.286322)
//Bounding Box....... from x,y,z=(-5.649996,-1.352045,-6.464604)
//                      to x,y,z=(5.113455,1.208585,3.881957)
//                 size dx,dy,dz=(10.76345,2.56063,10.34656)
//                  center x,y,z=(-0.2682703,-0.07172972,-1.291324)
//                       diagonal 15.14794
//Surface area................... 139.2737
//             Smallest face area 3.185399E-10
//              Largest face area 5.424895
//Memory allocated for geometry.. 4 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W640 +H480 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#include "gearhead.inc"
#include "aer_F601_B_geom.inc" //Geometry

//Assembled object that is contained in F601_B_POV_geom.inc
object
{
	F601_B_
	translate y * 2.56063/2
	scale Scale_LDraw
	scale 10
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
