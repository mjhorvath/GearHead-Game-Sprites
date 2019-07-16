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
//gh_vespa2_POV_main.ini (initialization file - open this to render)
//gh_vespa2_POV_scene.pov (scene setup of cameras, lights and geometry)
//gh_vespa2_POV_geom.inc (geometry mesh)
//gh_vespa2_POV_mat.inc (materials)
//placeholder.png
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 964
//Number of vertices............. 478
//Number of normals.............. 566
//Number of UV coordinates....... 625
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//UV boundaries........ from u,v=(0.01588889,0.009677778)
//                        to u,v=(0.9815384,0.6946028)
//Bounding Box....... from x,y,z=(-0.1470902,0.002136548,-0.3216926)
//                      to x,y,z=(0.1387549,0.3775911,0.3693786)
//                 size dx,dy,dz=(0.2858451,0.3754546,0.6910711)
//                  center x,y,z=(-0.00416764,0.1898638,0.02384299)
//                       diagonal 0.8368111
//Surface area................... 0.7973338
//             Smallest face area 1.397379E-5
//              Largest face area 0.008055787
//Memory allocated for geometry.. 94 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W320 +H239 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "GearHead.inc"
#include "gca_vespa_geom.inc" //Geometry

//Assembled object that is contained in gh_vespa2_POV_geom.inc
object{
      gh_vespa2_
	scale 20
	rotate y * -45
	rotate y * clock * 360
      }
//==================================================
