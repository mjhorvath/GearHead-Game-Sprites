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
//gh2_gorilla_POV_main.ini (initialization file - open this to render)
//gh2_gorilla_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_gorilla_POV_geom.inc (geometry mesh)
//gh2_gorilla_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 14681
//Number of vertices............. 7616
//Number of normals.............. 11631
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 9
//Number of groups/meshes........ 23
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-3.841196,-5.023915,-1.880547)
//                      to x,y,z=(3.841196,2.739323,4.937199)
//                 size dx,dy,dz=(7.682392,7.763237,6.817745)
//                  center x,y,z=(0,-1.142296,1.528326)
//                       diagonal 12.87512
//Surface area................... 261.7475
//             Smallest face area 1.928626E-10
//              Largest face area 0.7570937
//Memory allocated for geometry.. 1 MByte
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Meters = 4;
#declare BG_Color = 0;
#include "GearHead.inc"
#include "btr_gorilla_geom.inc" //Geometry
 
//Assembled object that is contained in gh2_gorilla_POV_geom.inc
//Bounding Box....... from x,y,z=(-3.841196,-5.023915,-1.880547)
//                      to x,y,z=(3.841196,2.739323,4.937199)
object
{
	gh2_gorilla_
	translate y * 5.023915
	scale 1/6.5
	scale 16 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
