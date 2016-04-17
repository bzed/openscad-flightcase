/*

 a |_| c
    b
 material_thickness = d
*/

module simple_profile_U(a,b,c,d, length) {
    echo(material="<b>U profile</b>", a, b, c, d, length);
    translate([-b/2,-d,0])
    linear_extrude( height = length ) {
        polygon(
            points = [
                [0,0],
                [b,0],
                [b,c],
                [b-d,c],
                [b-d,d],
                [d,d],
                [d,a],
                [0,a]
            ],
            paths = [
                [0,1,2,3,4,5,6,7],
            ]
        );
    }
}

simple_profile_U(20,50,20,3, 2000);