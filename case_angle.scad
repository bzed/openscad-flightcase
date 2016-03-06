use <flightcase/extrusion_plate.scad>;
module case_angle(
    length=200,
    size=30,
    thickness=1.5,
    materialcolor="silver",
    rivets=true,
    rivet_holes=true,
    rivet_diameter=4,
    rivet_length=12,
    rivet_distance=50,
    rivet_materialcolor="silver"
) {
  
    color(materialcolor) union() {
        translate([size,0,0]) {
            rotate([180,180,0]) {
                extrusion_plate(
                    size,
                    thickness,
                    length,
                    2,
                    rivet_diameter=rivet_diameter,
                    rivet_length=rivet_length,
                    rivets=rivets,
                    rivet_holes=rivet_holes,
                    rivet_cut=1,
                    rivet_distance=rivet_distance,
                    rivet_materialcolor=rivet_materialcolor
                );
            };
        };
        translate([0,size,length]) {
            rotate([0,180,90]) {
                extrusion_plate(
                    size,
                    thickness,
                    length,
                    2,
                    rivet_diameter=rivet_diameter,
                    rivet_length=rivet_length,
                    rivets=rivets,
                    rivet_holes=rivet_holes,
                    rivet_cut=1,
                    rivet_distance=rivet_distance,
                    rivet_materialcolor=rivet_materialcolor
                );
            };
        };
        linear_extrude(height=length) {
            rotate(180) intersection() {
                square(2*thickness,2*thickness);
                circle(thickness);
            };
        };
    };
};

case_angle();

