use <flightcase/extrusion_plate.scad>;


module t_extrusion(
    length=200,
    size=10,
    thickness=1.5,
    materialcolor="silver",
    rivets=true,
    rivet_holes=true,
    rivet_diameter=4,
    rivet_length=12,
    rivet_distance=50,
    rivet_materialcolor="silver"
) {
    
    side = 15;
    height = 20;
    width = size + 2*thickness + 2*side;
    
    translate([-(width/2),length,0]) {
        rotate([90,0,0]) {
            union() {
                extrusion_plate(
                    side,
                    thickness,
                    length,
                    3,
                    rivet_diameter=rivet_diameter,
                    rivet_length=rivet_length,
                    rivets=rivets,
                    rivet_holes=rivet_holes,
                    rivet_cut=2,
                    rivet_distance=rivet_distance,
                    rivet_materialcolor=rivet_materialcolor
                );
                translate([side + side + size + 2*thickness, 0, length]) {
                    rotate([0,180,0]) extrusion_plate(
                        side,
                        thickness,
                        length,
                        3,
                        rivet_diameter=rivet_diameter,
                        rivet_length=rivet_length,
                        rivets=rivets,
                        rivet_holes=rivet_holes,
                        rivet_cut=2,
                        rivet_distance=rivet_distance,
                        rivet_materialcolor=rivet_materialcolor
                    );
                };
        
                translate([side + thickness + size, height + thickness, 0]) {
                    rotate([0,0,-90]) extrusion_plate(
                        height,
                        thickness,
                        length,
                        4,
                        rivet_diameter=rivet_diameter,
                        rivet_length=size + 2*thickness + rivet_diameter,
                        rivets=rivets,
                        rivet_holes=rivet_holes,
                        rivet_cut=2,
                        rivet_distance=rivet_distance,
                        rivet_materialcolor=rivet_materialcolor
                    );
                };
                
                translate([side + thickness, height + thickness, length]) {
                    rotate([0,180,90]) extrusion_plate(
                        height,
                        thickness,
                        length,
                        4,
                        rivet_diameter=rivet_diameter,
                        rivet_length=size + 2*thickness + rivet_diameter,
                        rivets=false,
                        rivet_holes=rivet_holes,
                        rivet_cut=2,
                        rivet_distance=rivet_distance,
                        rivet_materialcolor=rivet_materialcolor
                    );
                };
                
                color(materialcolor) translate([side, 0, 0])
                    cube([size + 2*thickness, thickness, length]);
            };
        };
    };
};
t_extrusion(rivets=true);

