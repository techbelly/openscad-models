

module channel(width, length, height,thickness) {
    union() {
        cube([width + (thickness * 2),length,thickness]);
        rotate([0,-90,0])
        cube([height + thickness,length,thickness]);
        translate([width + (thickness * 2), 0, 0])
        rotate([0,-90,0])
        cube([height+thickness,length,thickness]);
    }
}

module edge(width, height,thickness) {
    union() {
        cube([width + (thickness * 2),width + (thickness * 2),thickness]);
        rotate([0,-90,0])
        cube([height + thickness,width + (thickness * 2),thickness]);
    }
}

module corner(width, height,thickness) {
    union() {
        cube([width + (thickness * 2),width + (thickness * 2),thickness]);
        rotate([0,-90,0])
        cube([height + thickness,width+ (thickness * 2),thickness]);
        rotate([0,-90,-90])
        cube([height + thickness,width+ (thickness * 2),thickness]);

    }
}

module lshape(width, length, height, thickness) {
    totalWidth = width + thickness * 2.0;
    
    channel(width, length, height, thickness);
    translate([0,-totalWidth,0]) {
        corner(width,height,thickness);
    }
    translate([0,-totalWidth,0])  {
        rotate([0,0,-90]) translate([-totalWidth,totalWidth,0]) {
            channel(width, length, height, thickness);
        }
    }
}

module tshape(width, length, height, thickness) {
    totalWidth = width + thickness * 2.0;
    
    channel(width, length, height, thickness);
    translate([0,-totalWidth,0]) {
        edge(width,height,thickness);
    }
    translate([0,-totalWidth,0])  {
        rotate([0,0,-90]) translate([-totalWidth,totalWidth,0]) {
            channel(width, length, height, thickness);
        }
    }
    translate([0,-totalWidth - length + thickness,0])  
    channel(width, length, height, thickness);
}

lshape(9.5, 40, 8, 1);