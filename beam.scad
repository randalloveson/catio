/*
 * beam.scad
 * 1 = 1 inch
 * Variables: defaultBeamHeight (=1.5), defaultBeamWidth (=3.5), beamColor (="wheat")
 */

defaultBeamHeight = 1.5;
defaultBeamWidth = 3.5;
beamColor = "wheat";

module xBeamY(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([length, beamWidth, beamHeight]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}

module xBeamZ(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([length, beamHeight, beamWidth]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}

module yBeamX(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([beamWidth, length, beamHeight]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}

module yBeamZ(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([beamHeight, length, beamWidth]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}

module zBeamX(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([beamWidth, beamHeight, length]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}

module zBeamY(length, translation=[0, 0, 0], rotation=[0, 0, 0], beamHeight=defaultBeamHeight, beamWidth=defaultBeamWidth) {
    color(beamColor)
        translate(translation)
        rotate(rotation)
        cube([beamHeight, beamWidth, length]);
    echo("BEAM: ", beamHeight, beamWidth, length);
}
