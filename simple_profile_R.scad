/*
 rod
 diameter = a
*/

module simple_profile_R(a, length) {
    radius = a/2;
    linear_extrude( height = length ) {
        circle(r=radius, center=true);
    }
}

simple_profile_R(50, 2000);