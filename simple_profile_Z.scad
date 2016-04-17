/*
Z profile

  a
___
    |
    | b
    |____
       c
 material thickness = d
 */
module simple_profile_Z(a,b,c,d, length) {
    echo(material="<b>Z profile</b>", a, b, c, d, length);
    linear_extrude( height = length ) {
        translate([-a,-d,0])
        polygon(
            points = [
                [0,b-d],
                [a-d, b-d],
                [a-d, 0],
                [a-d+c, 0],
                [a-d+c, d],
                [a,d],
                [a,b],
                [0,b]
            ],
            paths = [
                [0,1,2,3,4,5,6,7],
            ]
        );
    }
}

simple_profile_Z(50,30,40,7, 2000);