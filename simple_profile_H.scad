/*

hex bar
side distance = a

*/
module simple_profile_H(a, length) {
    echo(material="<b>H profile</b>", a, length);
    linear_extrude( height = length ) {
        circle(a/2,$fn=6);
    }
}

simple_profile_H(20, 200);