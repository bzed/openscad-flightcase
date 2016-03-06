use <flightcase/t_extrusion.scad>;

module t_extrusion_case_wall(
    height,
    length,
    wood_thickness,
    wood_color,
    rivets=false,
    rivet_holes=true,
    rivet_diameter=4,
    rivet_distance=100,
    rivet_materialcolor = "silver",
    extrusion_materialcolor = "silver",
    extrution_thickness = 1.5,
) {
    t_extrusion_size = ceil(wood_thickness);
    real_height = height - 2*extrution_thickness;
    t_extrusion(
        length=length,
        size=t_extrusion_size,
        thickness=extrution_thickness,
        materialcolor="silver",
        rivets=rivets,
        rivet_holes=rivet_holes,
        rivet_diameter=rivet_diameter,
        rivet_length=wood_thickness + 1.5 + rivet_diameter,
        rivet_distance=rivet_distance,
        rivet_materialcolor="silver"
    );
    translate([0,0,height]) {
        rotate([0,180,0]) {
            t_extrusion(
                length=length,
                size=t_extrusion_size,
                thickness=extrution_thickness,
                materialcolor="silver",
                rivets=rivets,
                rivet_holes=rivet_holes,
                rivet_diameter=rivet_diameter,
                rivet_length=wood_thickness + 1.5 + rivet_diameter,
                rivet_distance=rivet_distance,
                rivet_materialcolor="silver"
            );
        };
    }
    
    wall = [wood_thickness, length, height - 2*extrution_thickness];
    translate([-wood_thickness/2,0,extrution_thickness]) color(wood_color) cube(wall);
};

t_extrusion_case_wall(200,600,9.8,"blue");