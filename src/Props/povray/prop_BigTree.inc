/* arbres.inc written by J.L PRADEL
#include "arbres.inc"
object
{
	Arbre
	finish {Default_Finish}
	no_shadow
}
*/

#declare txtTree = texture
{
	#declare TreeColor1 = pigment
	{
		gamma_color_adjust(<098,064,030,>/255)
	}
	#declare TreeColor2 = pigment
	{
		gamma_color_adjust(<140,123,93,>/255)
	}
        pigment
        {
//        	granite
                bozo
                pigment_map
                {
                        [0 TreeColor1]
                        [1 TreeColor2]
                }
        }
        normal {wrinkles 2 scale 0.3}
	finish {Default_Finish}
}

// m_tree.mcr written by Gilles Tran
#include "m_tree.mcr"
object
{
	Tree1
	finish {Default_Finish}
	translate y * -6
	no_shadow
	scale 8
}
