//
// Blank wall plate for the removed power outlet that did not have anything to attach a 
// traditional blank plate to.  
//

// The Belfry OpenScad Library, v2:  https://github.com/BelfrySCAD/BOSL2
// This library must be installed in your instance of OpenScad to use this model.
include <BOSL2/std.scad>

// *** Model Parameters ***
/* [Model Parameters] */

// Width of the opening that is being covered.
opening_width = 55;

// Height of the opening that is being covered.
opening_height = 93;

// Depth of the opening.  This is used to make the snap-in tabs.
opening_depth = 10;

// Thickness of the wall plate.
plate_thickness = 3;

// Snap in tab width.  This is the width of the tabs that will snap into the opening.
tab_width = 10;

// Snap in tab thickness.  This is the depth of the tabs that will snap into the opening.
tab_thickness = 5; 

// The external size of the wall plate driven by the opening size.  
// 1.2 = 120% of the opening.
plate_size_pct = 1.20;

// Tab Nub Diameter
nub_diameter = 4;

// *** "Private" variables ***
/* [Hidden] */

// OpenSCAD System Settings
$fa = 1;
$fs = 0.4;

// Calculated Global Vars

// Snap in height is the depth of the opening plus a nub to hold in the plate.
tab_height = opening_depth + nub_diameter;

//
// Creates the wall plate.
//
module wall_plate () {
    plate_width = opening_width * plate_size_pct;
    plate_height = opening_height * plate_size_pct;

    corner_rounding = 1;

    cuboid([plate_width, plate_height, plate_thickness],
            rounding=corner_rounding, except=[TOP], anchor=BOTTOM);
}

//
// Tabs for snapping the wall plate into the opening.
//
module snap_in_tabs() {
    plate_width = opening_width * plate_size_pct;
    plate_height = opening_height * plate_size_pct;

    // Calculate offsets to place tabs at the four corners of the opening
    x_offsets = [
        -opening_width/2 + tab_thickness/2,
        opening_width/2 - tab_thickness/2
    ];
    y_offsets = [
        -opening_height/2 + tab_width/2,
        opening_height/2 - tab_width/2
    ];

    // Place tabs at each corner, with their bottom at the top of the wall plate
    for (x = x_offsets, y = y_offsets) {
        echo(str("Placing tab at: ", x, ", ", y));
        color("red")
            translate([x, y, plate_thickness])
                cuboid([tab_thickness, tab_width, tab_height], anchor=BOTTOM);

        // Add a nub to help hold the tab in place
        if (x < 0) {
            nub_x = x - tab_thickness/2;
            tab_nub(x, y, nub_x);
        } else {
            nub_x = x + tab_thickness/2;
            tab_nub(x, y, nub_x);
        }
    }
}

//
// Creates a tab nub
//
module tab_nub(tab_x, tab_y, nub_x) {
    translate([nub_x, tab_y + tab_width/2, plate_thickness + tab_height - (nub_diameter / 2)])
    {
        rotate([90, 0, 0])
            cylinder(d=nub_diameter, h=tab_width, anchor=BOTTOM);
    }
}

// 
// Main module that creates the model.
//
module build_model() {
    // Create the wall plate
    wall_plate();

    // Add in the snap-in tabs
    snap_in_tabs();

}

build_model();