module Cutter() {
    union() {
        cube([24,3,21], center=true);
        rotate([90, 0., 0]) translate([0,5.5]) cylinder(h=20, r=2.5, center=true);
    };
}
// hole - 5mm

module KeyCap() {
    union() {
    translate([0,0,0.5]) cube([28,5,22], center=true);
    minkowski() { 
        translate([0,0,0.5]) cube([60,3,18], center=true);
        sphere(r=.75, $fn=16);
    }
}
}

rotate([180,0,0]) difference() {
    KeyCap();
    Cutter();
}
    