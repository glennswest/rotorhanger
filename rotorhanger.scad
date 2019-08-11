include <screw_holes.scad>
// screw_hole_fn = 64;                // Optional. The default is 32.
//
// difference()
// {
//   draw_solid_object();
//   translate(screw_position)
//     rotate(screw_orientation)
//       screw_hole(iso_norm, metric, length, thread_length, fn);
// }
//

module top_cover()
{
    difference(){
       translate([0,0,-3]) cylinder(r=23,h=3, $fn=1024);
       cover_screws();
    }
   // %translate([0,0,0]) top_body();
}
module top_plug(){
    translate([0,0,0]) cylinder(r=23,h=3, $fn=1024);
    translate([0,0,3]) cylinder(r=15,h=3,$fn=32);
}


module cover_screws()
{
   // Drill a hole for a DIN965 M3 screw of length 20 mm,
  // with 10 mm thread.
  rotate([180,0,180-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);
  //%rotate([180,0,180-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5); 
  rotate([180,0,0-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);
  //%rotate([180,0,0-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);   
  rotate([180,0,-90-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);
  //%rotate([180,0,-90-45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5); 
  rotate([180,0,45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);
  //%rotate([180,0,45]) translate([19,0,-3.2]) screw_hole(DIN965, M3, 6.5, 6.5);      
    
}

module bottom_screws()
{
     // Drill a hole for a DIN965 M3 screw of length 20 mm,
  // with 10 mm thread.
  rotate([180,0,180]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10);
  //%rotate([180,0,180]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10); 
  rotate([180,0,0]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10);
  //%rotate([180,0,0]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10);   
  rotate([180,0,-90]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10);
  //%rotate([180,0,-90]) translate([19,0,-5]) screw_hole(DIN965, M3, 12, 10);     
    
}
module bottom_part()
{
     difference(){
        translate([0,0,0]) cylinder(r=23,h=5,$fn=1024);
        translate([0,0,8.1]) rotate([0,180,0]) scale([1.02,1.02,1.02]) top_body();
        //%translate([0,0,8.1]) rotate([0,180,0]) top_body();
        bottom_screws();   
     }
    
}

module top_body(){
    difference(){
        top_plug();
        translate([0,13,-.1]) cylinder(r=7.5,h=2);
        translate([0,20,-.1]) cube([2,7,2]);
        cover_screws();     
    }
    translate([0,13,-.1]) cylinder(r=5.5,h=2,$fn=1024);
}

top_body();
translate([55,0,0]) bottom_part();
translate([0,55,3]) top_cover();