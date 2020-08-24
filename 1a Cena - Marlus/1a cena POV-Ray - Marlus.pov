#include "colors.inc"
#include "shapes.inc"
#include "textures.inc"  

#declare posX = 0;
#declare posY = 0;
#declare posZ = 0;  
#declare Xinc = 2;
#declare Yinc = -0.01;
#declare Zinc = 1; 
#declare qBall = 8;


camera {
    location <0,-1,-10>
    look_at <0,0,0>
}                  


//global_settings { ambient_light rgb<0,0,0> }
  
#declare Omnibal =  
difference{
    sphere{    
        <posX,posY,posZ>, 1
        finish{
            ambient 0.5
            diffuse 0.5
            specular 0.1
            roughness 0
            phong 1    
            phong_size 0
            reflection 1
        } 
    }
    cone{
        <posX,posY,posZ-2> 0.5
        <posX,posY,posZ+2> 0
        texture{
            Silver3
        }
        
    }  
} 

#for (i, 0, qBall) 
    object {Omnibal translate <posX, posY, posZ>}   
    #declare posX = posX+Xinc;
    #declare posY = posY+Yinc;      
    #declare posZ = posZ+Zinc;
    object {Omnibal translate <-posX, posY, posZ>}   
#end      
  


plane {
    y, 1
    texture{
        Blue_Sky
    }
}
   
plane {
    y, -2
    material{
        M_Glass3
    }
}   
 
light_source{
    <2,1,2>
    color White
    spotlight 
    point_at<0,0,0>   
    tightness 0
    radius 10
    falloff 12
}
             
light_source{
    <-1,0,3>
    color Red
    area_light <4,0,0>, <0,0,4> 4,4
    adaptive 1
    jitter    
}