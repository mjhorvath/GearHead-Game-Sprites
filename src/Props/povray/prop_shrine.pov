#include "colors.inc"
#include "GearHead.inc"

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
//shg00_POV_main.ini (initialization file - open this to render)
//shg00_POV_scene.pov (scene setup of cameras, lights and geometry)
//shg00_POV_geom.inc (geometry mesh)
//shg00_POV_mat.inc (materials)
// 
//==================================================
//Model Statistics:
//Number of triangular faces..... 164
//Number of vertices............. 148
//Number of normals.............. 223
//Number of UV coordinates....... 0
//Number of lines................ 0
//Number of materials............ 1
//Number of groups/meshes........ 1
//Number of subdivision faces.... 0
//Bounding Box....... from x,y,z=(-0.750806,0,-0.75219)
//                      to x,y,z=(0.750806,2.96695,0.749422)
//                 size dx,dy,dz=(1.501612,2.96695,1.501612)
//                  center x,y,z=(0,1.483475,-0.001384)
//                       diagonal 3.648626
//Surface area................... 17.21046
//             Smallest face area 1.045E-10
//              Largest face area 1.127419
//Memory allocated for geometry.. 26 KBytes
// 
//==================================================
//IMPORTANT:
//This file was designed to run with the following command line options: 
// +W579 +H496 +FN +AM1 +A -UA
//if you are not using an INI file copy and paste the text above to the command line box before rendering
 
#include "colors.inc"
#include "skies.inc"
#include "stars.inc"
#include "textures.inc"
#include "prop_shrine_geom.inc" //Geometry
 
global_settings {
  //This setting is for alpha transparency to work properly.
  //Increase by a small amount if transparent areas appear dark.
   max_trace_level 10
 
}

//Assembled object that is contained in shg00_POV_geom.inc
object{
      shg00_
      scale Width/2
      }
//==================================================
