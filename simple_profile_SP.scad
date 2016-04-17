/*
square pipe
   a
 ###
 # #  b  
 ### 
 material_thickness = c
*/

module simple_profile_SP(a,b,c, length) {
    echo(material="<b>square pipe</b>", a, b, c, length);
    linear_extrude( height = length ) {
        polygon(
            points = [
                [0,0],
                [a,0],
                [a,b],
                [0,b],
        
                [c,c],
                [a-c,c],
                [a-c,b-c],
                [c,b-c]
            ],
            paths = [
                [0,1,2,3],
                [4,5,6,7]
            ]
        );
    }
}

simple_profile_SP(50,30,3, 2000);