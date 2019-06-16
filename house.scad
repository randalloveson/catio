/*
 * Partial North Wall
 * 1 = 1 inch
 */
 
// brick wall
brickdepth = 3.625;
difference() {
    color("red")
        translate([-brickdepth, 0, 34])
            cube([brickdepth, 112, 93]);

    translate([-brickdepth - 0.1, 26, 78])
        cube([brickdepth + 0.2, 34, 49.5]);
}

// Window base
color("red")
    translate([-brickdepth, 26, 73.5])
        cube([7, 34, 4.5]);


// trim
color("white")
    translate([-brickdepth, 0, 127])
        cube([brickdepth + 0.75, 112, 4]);

// foundation
concretedepth = 16;
difference() {
    color("lightgrey")
        translate([-concretedepth, 0, -13])
            cube([concretedepth, 112, 47]);

    translate([-concretedepth - 0.1, 32, -7.5])
        cube([concretedepth + 0.2, 26, 36]);
}

// earth
translate([0.01,0,0])
difference() {
    color([0.62, 0.32, 0.18, 0.50])
        translate([0, 0, -20])
            cube([94, 112, 20]);

    translate([-0.2, 26, -13])
        cube([38, 38, 13 + 0.1]);
}

// Window well brick
color("darkgrey") {
    for (y = [21.5, 64])
        translate([0, y, -3])
            cube([43, 4.5, 4]);

    translate([38.5, 21.5, -3])
        cube([4.5, 47, 4]);
}
