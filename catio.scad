include <beam.scad>
include <house.scad>

// for beam.scad
defaultBeamHeight = 1.5;
defaultBeamWidth = 3.5;

beamHeight = defaultBeamHeight;
beamWidth = defaultBeamWidth;

totalX = 52;
totalY = 108;
totalZ = 127;

foundationDepth = 2.5;
firstTierZ = 70;
secondTierZ = 40;

offsety = 2;

function ratioPlacement(ratio, totalWidth, placementWidth) = max(0, min(totalWidth - placementWidth, totalWidth * ratio - placementWidth / 2));

function evenStuds(studCount, totalWidth) = [ for (x = [0 : 1 / (studCount + 1) : 1]) ratioPlacement(x, totalWidth, beamHeight) ];

longWallWidth = totalY - beamWidth * 2;

farWallStuds = evenStuds(3, longWallWidth);

closeWallStuds = [
    ratioPlacement(0, longWallWidth, beamHeight),
    ratioPlacement(0.14, longWallWidth, beamHeight),
    ratioPlacement(0.66, longWallWidth, beamHeight),
    ratioPlacement(1, longWallWidth, beamHeight)
];

leftWallStuds = evenStuds(1, totalX);

rightWallStuds = evenStuds(1, totalX);

rafters = [
    ratioPlacement(0, totalY, beamHeight),
    farWallStuds[1] + beamWidth,
    farWallStuds[2] + beamWidth,
    farWallStuds[3] + beamWidth,
    ratioPlacement(1, totalY, beamHeight)
];
rafterLength = 60;

module tier(height) {

        // Floor and top plates
        for (z = [0, height - beamHeight]) {
            // Side walls
            for (y = [0, totalY - beamWidth])
                xBeamY(totalX, [0, y, z]);

            // Long walls
            for (x = [0, totalX - beamWidth])
                yBeamX(totalY - 2 * beamWidth, [x, beamWidth, z]);
        }

        studLength = height - 2 * beamHeight;

        for (x = leftWallStuds)
            zBeamY(studLength, [x, 0, beamHeight]);

        for (x = rightWallStuds)
            zBeamY(studLength, [x, totalY - beamWidth, beamHeight]);

        for (y = farWallStuds)
            zBeamX(studLength, [totalX - beamWidth, y + beamWidth, beamHeight]);

        for (y = closeWallStuds)
            zBeamX(studLength, [0, y + beamWidth, beamHeight]);

}

module roofBeam() {
    yBeamZ(totalY + 0.02, [0, -0.01, totalZ - beamWidth]);
}

translate ([0, offsety, 0]) {

    // Foundation
    translate([0, 0, -foundationDepth]) {
        // Side walls
        for (y = [0, totalY - beamWidth])
            xBeamZ(totalX - 2 * beamWidth, [beamWidth, y, 0], beamHeight=3.5, beamWidth=3.5);

        // Long walls
        for (x = [0, totalX - beamWidth])
            yBeamZ(totalY, [x, 0, 0], beamHeight=3.5, beamWidth=3.5);
    }

    // First tier
    translate ([0, 0, beamWidth - foundationDepth])
        tier(firstTierZ);

    // Second tier
    translate([0, 0, firstTierZ + beamWidth - foundationDepth])
        tier(secondTierZ);

    // Roof
    roofBeam();

    for (y = rafters)
        difference() {
            xBeamZ(rafterLength, [0, y, totalZ - beamWidth + 0.5], [0, 15, 0]);
            roofBeam();
            yBeamX(totalY + 0.02, [totalX - beamWidth, -0.01, totalZ - beamHeight]);
        }
}
