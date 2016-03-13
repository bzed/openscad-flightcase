/*
 width = a
 material_thickness = b
*/

module simple_profile_flat(a,b, length) {
    translate([0,-b,0])
    linear_extrude( height = length ) {
        square([a,b]);
    }
}

simple_profile_flat(20,3, 2000);