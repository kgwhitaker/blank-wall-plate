# Blank Wall Plate

When installing a new oven in our kitchen, a power outlet had to be removed leaving an empty hole in our cabinet.  
A traditional blank plate could not be used since the outlet box had to also be removed; there was nothing
to screw the plate into. This model creates a snap-in blank plate.

While our use case was very specific as to the size of hole that needed to be covered, the model is parametric,
so it may be of use to someone else.

## Model Parameters

| Parameter       | Description                                                                                  |
| --------------- | -------------------------------------------------------------------------------------------- |
| opening_width   | Width of the opening that is being covered.                                                  |
| opening_height  | Height of the opening that is being covered.                                                 |
| opening_depth   | Depth of the opening. This is used to make the snap-in tabs.                                 |
| plate_thickness | Thickness of the wall plate.                                                                 |
| tab_width       | Snap in tab width. This is the width of the tabs that will snap into the opening.            |
| tab_thickness   | Snap in tab thickness. This is the depth of the tabs that will snap into the opening.        |
| plate_size_pct  | The external size of the wall plate driven by the opening size. 1.2 = 120% of the opening.   |
| nub_diameter    | Diameter of the "nub" that holds the retaining tab. It will actually protrude 1/2 this value |
|                 |                                                                                              |

## Realized Model

The `*.stl` file is the model used in our specific use case. The `3mf` file is an [Orca Slicer](https://orcaslicer.com) project files 
used to print the model.

## Dependencies and Building the 3D Model

This model is built using the tools listed below. Install these tools and you can open up the SCAD file in this repo to create your own printable object.

- [OpenSCAD](https://openscad.org)
- [The Belfry OpenScad Library, v2.0.](https://github.com/BelfrySCAD/BOSL2)

## Sample Output

Back side of the blank wall plate.

[Blank Wall Plate Back](images/blank-wall-plate.jpeg)

Blank wall plate installed.

[Installed Blank Wall Plate](images/blank-wall-plate-installed.jpeg)


