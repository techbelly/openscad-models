module Cutter() {
    union() {
        cube([24,3,21], center=true);
        rotate([90, 0., 0]) translate([0,6,0]) cylinder(h=20, r=2.5, center=true);
    };
}
// hole - 5mm

module KeyCap() {
    translate([0,0,0.5]) cube([48,5,22], center=true);
}

rotate([180,0,0]) difference() {
    KeyCap();
    Cutter();
}
    