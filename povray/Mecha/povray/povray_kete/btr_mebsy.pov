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
//gh2_mebsy_POV_main.ini (initialization file - open this to render)
//gh2_mebsy_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_mebsy_POV_geom.inc (geometry mesh)
//gh2_mebsy_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 3844
//Number of vertices............. 1942
//Number of normals.............. 2813
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 6
//Number of groups/meshes........ 7
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-1.243747,-5.759879,-0.8700222)
//                      to x,y,z=(1.243747,0.4373541,1.225711)
//                 size dx,dy,dz=(2.487494,6.197233,2.095733)
//                  center x,y,z=(0,-2.661262,0.1778444)
//                       diagonal 6.998958
//Surface area................... 81.57935
//             Smallest face area 9.058629E-5
//              Largest face area 1.496941
//Memory allocated for geometry.. 343 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare Meters = 4;
#declare BG_Color = 0;
#include "GearHead.inc"
#include "btr_mebsy_geom.inc" //Geometry

object
{
	gh2_mebsy_
	translate y * 5.759879
	scale 1/6
	scale 15 * Meters
	scale Scale_Mecha
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
