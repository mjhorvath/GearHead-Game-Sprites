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
//gh2_shard_POV_main.ini (initialization file - open this to render)
//gh2_shard_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh2_shard_POV_geom.inc (geometry mesh)
//gh2_shard_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 84534
//Number of vertices............. 42384
//Number of normals.............. 45698
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 7
//Number of groups/meshes........ 6
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-3.776289,-1.332886,-2.251661)
//                      to x,y,z=(3.776289,0.6231877,2.193516)
//                 size dx,dy,dz=(7.552578,1.956073,4.445177)
//                  center x,y,z=(0,-0.354849,-0.02907205)
//                       diagonal 8.979268
//Surface area................... 101.1269
//             Smallest face area 6.731549E-10
//              Largest face area 0.07217526
//Memory allocated for geometry.. 6 MBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering

#declare BG_Color = 0;
#include "GearHead.inc"
#include "aer_shard_geom.inc" //Geometry

//Assembled object that is contained in gh2_shard_POV_geom.inc
object
{
	gh2_shard_
	translate y * 1.332886
	scale 5
	rotate y * -45
	rotate y * clock * 360
}
//==================================================
