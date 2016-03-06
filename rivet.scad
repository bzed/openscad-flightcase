module rivet(diameter=4, length=10, materialcolor="silver") {
    radius= diameter / 2;
    color(materialcolor)
   union() { 
        difference() {
            difference() {    
                union() {
                    cylinder(r=radius, h=length-radius);
                    
                    
                    // head
                    difference() {
                    
                        translate([0,0,-1]) minkowski() {
                            sphere(1);
                            cylinder(r=diameter-1, h=1);
                            
                        };
                        cylinder(r=1.5*diameter, h=2);
                    };
    
                };
                translate([0,0,-2])
                    cylinder(r=radius*0.5, h=length-diameter);
            };
            translate([0,0,-2]) rotate_extrude() {
                        translate([radius*0.5,0,0])
                        circle(r=0.25);
            };
        };
        translate([0,0,length-radius*1.65]) sphere(r=radius*1.65);
    };
}

rivet(diameter=4.2, length=12);

