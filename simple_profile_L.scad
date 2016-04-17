/*

 a |_
    b
 material_thickness = c
*/

module simple_profile_L(a,b,c, length) {
    echo(material="<b>L profile</b>", a, b, c, length);
    translate([-c,-c,0])
    linear_extrude( height = length ) {
        polygon(
            points = [
                [0,0],
                [b,0],
                [b,c],
                [c,c],
                [c,a],
                [0,a]
            ],
            paths = [
                [0,1,2,3,4,5],
            ]
        );
    }
}

simple_profile_L(20,50,3, 2000);