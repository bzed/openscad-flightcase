module panel(length, width, thickness, material, color="brown") {
    color(color) cube([length, width, thickness]);
    echo(material="<b>panel</b>", length, width, thickness, material, color);
}

panel(20, 40, 3, "phenol", "blue");
