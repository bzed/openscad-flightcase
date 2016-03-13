/*
square bar
   a
 ###
 # #  b  
 ### 
*/

module simple_profile_S(a,b, length) {
    linear_extrude( height = length ) {
        polygon(
            points = [
                [0,0],
                [a,0],
                [a,b],
                [0,b],
            ],
            paths = [
                [0,1,2,3],
            ]
        );
    }
}

simple_profile_S(50,30, 2000);