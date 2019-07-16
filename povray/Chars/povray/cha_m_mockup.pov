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
//gh_mockup_male1_POV_main.ini (initialization file - open this to render)
//gh_mockup_male1_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_mockup_male1_POV_geom.inc (geometry mesh)
//gh_mockup_male1_POV_mat.inc (materials)
//gh_mockup-male1-small.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 974
//Number of vertices............. 489
//Number of normals.............. 489
//Number of UV coordinates....... 390
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.02551705,0.02694332)
//                        to u,v=(0.9690199,0.9882025)
//Bounding Box....... from x,y,z=(-0.1492844,0,-0.06067319)
//                      to x,y,z=(0.1492844,0.6865107,0.06067319)
//                 size dx,dy,dz=(0.2985688,0.6865107,0.1213464)
//                  center x,y,z=(0,0.3432554,0)
//                       diagonal 0.7583965
//Surface area................... 0.3867377
//             Smallest face area 1.075101E-5
//              Largest face area 0.002615643
//Memory allocated for geometry.. 87 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "GearHead.inc"
#include "cha_m_mockup_geom.inc" //Geometry

//Assembled object that is contained in gh_mockup_male1_POV_geom.inc
object{
      gh_mockup_male1_
	scale 100
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
