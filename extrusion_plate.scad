use <flightcase/rivet.scad>;

module extrusion_plate(
    width,
    height,
    length,
    cuts=3,
    materialcolor="silver",
    rivets = false,
    rivet_holes = false,
    rivet_cut = 1,
    rivet_diameter=4,
    rivet_length=10,
    rivet_materialcolor="silver",
    rivet_distance=50,
) {

    cut_width = 1.2*height;
    cut_distance = (width / (cuts + 1));
    cut_start_position = cut_distance - (cut_width/2);
    rivet_number = floor((length - 2*rivet_distance) / rivet_distance) + 1;
    rivet_start = (length - (rivet_number*rivet_distance)) / 2;
    rivet_drill_diameter = rivet_diameter + 0.2;
    rivet_position = rivet_cut * cut_distance;
    rivet_radius = rivet_diameter / 2;
    rivet_drill_radius = rivet_drill_diameter / 2;
    
    color(materialcolor) {
        difference() {
            linear_extrude(length) {
                difference() {
                    translate([height,0,0]) {
                        union() {
                            square([width-height, height]);
                            rotate(90) intersection() {
                                square([2*height,2*height]);
                                circle(height, $ts=200);
                            };
                        };
                    };
                    
                    translate([0, height / 2, 0]) {
                        
                        for( i = [0:1:cuts-1]) {
                            position = cut_start_position + i*cut_distance;
                            translate([position, 0, 0]) {
                                square([cut_width, cut_width]);
                            };
                        };
                    };
                };
            };
            union() {
                if (rivet_holes) {
                    for(i=[0:1:rivet_number]) {
                        translate([rivet_position, 0, rivet_start + i*rivet_distance]) {
                            rotate([90,0,0]) {
                                cylinder(
                                    r=rivet_drill_radius,
                                    h=rivet_length,
                                    center=true
                                );
                            };
                        };
                    };
                };
            };
        };
    };
    if (rivets) {
        for(i=[0:1:rivet_number]) {
            translate([rivet_position, height, rivet_start + i*rivet_distance]) {
                rotate([90,0,0]) rivet(
                    diameter=rivet_diameter, 
                    length = rivet_length,
                    materialcolor=rivet_materialcolor
                );
            }
        };
    };
};

extrusion_plate(
    20,
    1.5,
    100,
    3,
    rivet_diameter=4,
    rivet_length=12,
    rivets=true,
    rivet_holes=true,
    rivet_cut=2,
    rivet_distance=30,
    rivet_materialcolor="gold"
);