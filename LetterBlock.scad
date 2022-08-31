// LetterBlock.scad - Basic usage of text() and linear_extrude()

// Module instantiation
LetterBlock("E A G");

// Module definition.
// size=30 defines an optional parameter with a default value.
module LetterBlock(letter, size=30) {
    boxlength = size * len(letter);
    difference() {
        translate([0,0,size/2]) cube([boxlength,size,1], center=true);
        translate([0,0,-size/2]) {
            // convexity is needed for correct preview
            // since characters can be highly concave
            linear_extrude(height=size*2, convexity=4)
                text(letter, 
                     size=size*22/30,
                     font="Stencil Time:style=Regular",
                     halign="center",
                     valign="center");
        }
    }
}

echo(version=version());

