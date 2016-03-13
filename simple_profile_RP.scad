/*
round pipe
 diameter = a
 material_thickness = b
*/

module simple_profile_RP(a,b, length) {
    radius = a/2;
    linear_extrude( height = length ) {
        difference() {
            circle(r=radius, center=true);
            circle(r=radius-b, center=true);
        };
    }
}

simple_profile_RP(50,3, 2000);