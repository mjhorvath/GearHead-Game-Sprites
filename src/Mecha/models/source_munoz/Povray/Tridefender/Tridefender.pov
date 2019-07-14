union {
   //*PMName body
   
   difference {
      //*PMName upper half
      cone {
         <0, 0, 0>, 10,
         <0, 10, 0>, 5
      }
      box {
         <-10, 8, -4.5>, <10, 6, -15>
      }
      pigment {
         color rgb <1, 0, 0>
      }
   }
   
   cone {
      //*PMName window
      <0, 0.01, 0>, 9.9,
      <0, 9.99, 0>, 4.95
      pigment {
         color rgb <0, 1, 0>
      }
   }
   intersection {
      //*PMName lower half
      
      sphere {
         <0, 0, 0>, 10
      }
      box {
         <-11, 0, -11>, <11, -11, 11>
      }
      pigment {
         color rgb <1, 0, 0>
      }
   }
   
   union {
      //*PMName missile rack
      superellipsoid {
         //*PMName missile rack
         <0.35, 0.35>
         scale <4, 3, 3>
         translate z*(-8)
         pigment {
            color rgb <1, 1, 0>
         }
      }
      union {
         //*PMName missiles
         sphere {
            <-3, 1.5, 0>, 0.5
         }
         sphere {
            <-1.5, 1.5, 0>, 0.5
         }
         sphere {
            <0, 1.5, 0>, 0.5
         }
         sphere {
            <1.5, 1.5, 0>, 0.5
         }
         sphere {
            <3, 1.5, 0>, 0.5
         }
         sphere {
            <-3, -1.5, 0>, 0.5
         }
         sphere {
            <-1.5, -1.5, 0>, 0.5
         }
         sphere {
            <0, -1.5, 0>, 0.5
         }
         sphere {
            <1.5, -1.5, 0>, 0.5
         }
         sphere {
            <3, -1.5, 0>, 0.5
         }
         pigment {
         	color rgb <0.5, 0.5, 0.5>
         }
         translate z*(-11)
      }
   }
}

union {
   //*PMName turret
   
   sphere {
      <0, 10, 0>, 4.75
      pigment {
         color rgb <1, 1, 0>
      }
   }
   
   intersection {
      sphere {
         <0, 10, 0>, 5
      }
      box {
         <-2, 0, -11>, <2, 16, 11>
      }
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <0, 0, 0>, 1,
      <0, 0, -15>, 0.8
      pigment {
         color rgb <0.5, 0.5, 0.5>
      }
      scale 1
      rotate x*30
      translate y*10
   }
   cone {
      <0, 0, 0>, 0.5,
      <0, 0, -10>, 0.3
      pigment {
         color rgb <0.5, 0.5, 0.5>
      }
      scale 1
      rotate x*30
      translate <-3, 12, 0>
   }
}

union {
   //*PMName leg
   sphere {
      <0, 0, 0>, 2.5
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <0, 0, 0>, 2,
      <8, 8, 0>, 1.75
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <8, 8, 0>, 2.25
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <8, 8, 0>, 1.75,
      <15, 0, 0>, 1.5
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <15, 0, 0>, 2
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <15, 0, 0>, 1.5,
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }
   translate x*10.5
   rotate y*30
}

union {
   //*PMName leg
   sphere {
      <0, 0, 0>, 2.5
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <0, 0, 0>, 2,
      <8, 8, 0>, 1.75
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <8, 8, 0>, 2.25
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <8, 8, 0>, 1.75,
      <15, 0, 0>, 1.5
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <15, 0, 0>, 2
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <15, 0, 0>, 1.5,
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }
   translate x*10.5
   rotate y*150
}

union {
   //*PMName leg
   sphere {
      <0, 0, 0>, 2.5
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <0, 0, 0>, 2,
      <8, 8, 0>, 1.75
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <8, 8, 0>, 2.25
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <8, 8, 0>, 1.75,
      <15, 0, 0>, 1.5
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <15, 0, 0>, 2
      pigment {
         color rgb <1, 0, 0>
      }
   }
   cone {
      <15, 0, 0>, 1.5,
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }
   sphere {
      <10, -11, 0>, 1.25
      pigment {
         color rgb <1, 1, 0>
      }
   }   translate x*10.5
   rotate y*(-90)
}

global_settings {
   assumed_gamma 1.5
   noise_generator 2
}

light_source {
   <20, 20, -20>, rgb <1, 1, 1>
}

camera {
   perspective
   location <20, 40, -40>
   sky <0, 1, 0>
   direction <0, 0, 1>
   right <1.3333, 0, 0>
   up <0, 1, 0>
   look_at <0, 0, 0>
}