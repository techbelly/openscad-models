include <BOSL/constants.scad>
use <BOSL/masks.scad>
use <BOSL/transforms.scad>

thickness = 2.5;
width = 87;
height = 14;

tabDepth = 1.7;
tabHeight = 1.5;
tabWidth=11;
tabCount = 6;

fillet = 5;

tabCenterZ = height - tabHeight/2;

innerWidth = width - thickness * 2;
averageWidth = width - thickness;

$fs = .2;
$fa = 2;

module lid() {
    union() {
        difference() {
        difference() {
            cylinder(d=width, h=height);
            translate([0,0,thickness]) cylinder(d=innerWidth,h=height);
        };
        rotate([0,180,0]) fillet_cylinder_mask(r=width/2, fillet=fillet);
        }
    
        difference() {
            intersection() {
                for ( i = [0 : tabCount] ){		
                    rotate( (360/tabCount) * i, [0, 0, 1])
                    translate([averageWidth/2, 0, tabCenterZ])
                    cube([tabDepth*20, tabWidth,tabHeight], center=true);
                }
                cylinder(d=width, h=height);
            };
            cylinder(d=width - (thickness * 2) - (tabDepth*2), h=height+5);
        }
    }
}

difference() {
    lid();
    //translate([0,0,-40])
    //cylinder(d=width-10, h=80, center = false);
    cube([40,6,20], center=true);
}


