use <flightcase/extrusion_plate.scad>;
module case_angle(
    length=200,
    size=30,
    thickness=1.8,
    materialcolor="silver",
    rivets=true,
    rivet_holes=true,
    rivet_diameter=4,
    rivet_length=12,
    rivet_distance=50,
    rivet_materialcolor="silver"
) {
  echo(material="<b>case angle</b>", length, size, thickness);
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


module case_angle_edge(
    size=30,
    thickness=1.8,
    materialcolor="silver",
) {
    union() {
        
        difference() {
            translate([0,0,-size+thickness]) case_angle(
                length=size,
                size=size,
                thickness=thickness,
                materialcolor=materialcolor,
                rivets=false,
                rivet_holes=false
            );
            translate([size,-size,thickness]) {
                rotate([0,180,0])
                    scale(size+thickness) __case_angle_miter_cutter();
            };
        };
      
        difference() {
            translate([-thickness,0,0]) {
                rotate([0,90,0]) case_angle(
                        length=size,
                        size=size,
                        thickness=thickness,
                        materialcolor=materialcolor,
                        rivets=false,
                        rivet_holes=false
                );
            };
            union() {
                translate([-thickness,-size/2,-size+thickness]) {
                    scale(size) __case_angle_miter_cutter();
                };
                translate([size/2,-size/2,-2*size+thickness]) cube(size);
            };
        };
        
    };
    
};
//translate([-500, 0, 0]) case_angle();
case_angle_edge();

