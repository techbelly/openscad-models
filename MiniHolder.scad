rows = 5; // [1:12]
columns = 4; // [1:12]
miniSize = 26; // [20:100]
hexRadius = 10; // [10:50]
topSize = 24; // [20:100]
edgeSize = 2; // [1:10]
baseHeight = 3; // [1:10]
totalHeight = 6; // [1:10]
nameplateWidth = 20; // [1:50]

module Segment() {
    bottomY = 0;
    leftX = 0;
    rightX = miniSize + 2 * edgeSize;
    rotate([90,180,90]) {
      linear_extrude(miniSize) {
        polygon(points = [
               [leftX, bottomY], 
               [rightX, bottomY], 
               [rightX, totalHeight], 
               [rightX - edgeSize - (miniSize - topSize)/2, totalHeight], 
               [rightX - edgeSize, bottomY + baseHeight], 
               [leftX + edgeSize, bottomY + baseHeight],
               [leftX + edgeSize + (miniSize - topSize)/2, totalHeight],
               [leftX, totalHeight],
               [leftX, bottomY]]);
           }
       };
};

module SlottedSegment() {
  rightX = miniSize + 2 * edgeSize;

  difference() {       
    Segment();
    translate([miniSize/2,-rightX/2, -totalHeight]) cylinder(h = totalHeight*2, r1=hexRadius, r2=hexRadius, $fn=6);
  };
};

module MiniGrid() {
    for(y=[0:rows-1]) {
        for(x=[0:columns-1]) {
            translate([x*miniSize, -y*(miniSize+2*edgeSize), 0]) SlottedSegment();
        }
    }
}

module MiniTray() {
    endstopWidth = edgeSize;
    yextent = (miniSize + 2*edgeSize)*rows;
    xextent = endstopWidth + miniSize  * columns;
    ytransform = (miniSize + 2*edgeSize)*(rows-1);
    union() {
        translate([0,0, 0]) rotate([90,180,90]) cube([yextent, totalHeight, endstopWidth]);
        translate([endstopWidth, 0, 0]) MiniGrid();
        translate([xextent,0,0]) rotate([90,180,90]) cube([yextent, baseHeight, nameplateWidth]);
    };
}

rotate([180,0,0]) MiniTray();
