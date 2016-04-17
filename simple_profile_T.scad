/*
      
      |
      |         b
      |
-----------
      a
      
 material_thickness = c
*/

module simple_profile_T(a,b,c, length) {
    echo(material="<b>T profile</b>", a, b, c, length);
    translate([-a/2,-c,0])
    linear_extrude( height = length ) {
        polygon(
            points = [
                [0,0],
                [a,0],
                [a,c],
                [a/2+c/2,c],
                [a/2+c/2,b],
                [a/2-c/2,b],
                [a/2-c/2,c],
                [0,c]
            ],
            paths = [
                [0,1,2,3,4,5,6,7],
            ]
        );
    }
}

simple_profile_T(50,20,3, 2000);