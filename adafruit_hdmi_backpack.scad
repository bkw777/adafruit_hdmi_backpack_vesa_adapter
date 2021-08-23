// Adapter frame for Adafruit models 2232, 2260, 2406, 2407
// HDMI Display Backpack
// and Raspberry Pi 3B+ or 4 (and whatever else has the same mount holes)
// to Vesa 75 or Vesa 100 mount

// Brian K. White - b.kenyon.w@gmail.com

// https://www.adafruit.com/product/2232
// https://www.adafruit.com/product/2260
// https://www.adafruit.com/product/2406
// https://www.adafruit.com/product/2407
// 7" model: holes 157.1 x 108.2 x 3  back 6.3  pcb 1.6  front(w/touch) 7.3
// 5" model: holes 112.7 x 83.8 x 3   back 6.3  pcb 1.6  front(w/touch) 7.3

// The mount holes for the screen take M3 screws.
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=207

// The mount holes for the vesa mount take M4 screws.
// Spacer posts between the frame and the vesa mount will usually be needed to use a vesa mount.
// The length of screws and spacers required for the Vesa mount will vary depending on the design of the particular vesa mount or stand being used, and whether or not a Pi is installed.
//
// The mount holes for the Pi take M2.5 screws.
// The Pi mount posts can be used 2 ways:
//   1: A Pi can be mounted bare on the posts, and M2.5x8 screws can go in from the top of the Pi and thread into the posts.
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=137
//
//   2: Or, a Pi in a solid aluminum armor heatsink case can be mounted by running longer M2.5x20 screws
//   from the front side of the frame (the screen side), through the entire length of the posts,
//   through the bottom half of the heatsink case, through the Pi pcb, and thread into the top half of the heatsink case.
//   https://www.amazon.com/dp/B07VMD25SK/
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=166
//
// HDMI and USB 90 degree adapters and short ribbon cables for the display:
// Search "hdmi ribbon" on ebay or aliexpress
//   https://www.aliexpress.com/item/32862500237.html  A2 + D2 + 20cm cable
// Search "usb ribbon" on ebay or aliexpress
//   https://www.aliexpress.com/item/33035211371.html  A2 + C2 + 20cm cable
//
// vesa stand - use any, but here is an example
//   https://www.thingiverse.com/thing:3808242
// standoffs for vesa mount
//   https://www.amazon.com/dp/B014KJKWWW/


// TODO
// * cable management
// * front bezel
// * back cover

// Display Size: "5inch" or "7inch"
size = "7inch";

// Vesa Mount Size: "vesa75" or "vesa100"
vesa = "vesa75";

/////////////////////////////////////////////////////////////////////

// Frame Thickness
ft = 3;

// Screen Size X (derived from Display Size)
sx = (size=="5inch") ? 112.7 : 157.1;

// Screen Size Y (derived from Display Dize)
sy = (size=="5inch") ? 83.8 : 108.2;

// Screen Mount Post I.D. (2.8 -> M3 screw)
shd = 2.8;

// Screen Mount Post Height
sph = 6.5;

// Screen Mount Post O.D.
spd = 8;

// Vesa Mount X (derived from Vesa Mount Size)
vx = (vesa=="vesa75") ? 75 : 100;

// Vesa Mount Y (derived from Vesa Mount Size)
vy = (vesa=="vesa75") ? 75 : 100;

// Vesa Mount Post I.D. (3.8 -> M4 screw)
vhd = 3.8;

// Vesa Mount Post Height ( = Screen Mount Post Height)
vph = sph;

// Vesa Mount Post O.D.
vpd = 10;

// pi 3B+/4

// Pi Mount Post X
px = 58;

// Pi Mount Post Y
py = 49;

// Pi Mount Post I.D. (2.2 - M2.5 screw)
phd = 2.2;

// Pi Mount Post Height
pph = 3;

// Pi Mount Post O.D.
ppd = 6.5;

// arc smoothness
$fn = 36;

/////////////////////////////////////////////////////////////////////////

difference(){
  group(){ // add - frame & screw posts
    // screen
    hull(){
      translate([-sx/2,sy/2,0]) cylinder(h=ft,d=spd);
      translate([sx/2,-sy/2,0]) cylinder(h=ft,d=spd);
    }
    hull(){
      translate([sx/2,sy/2,0]) cylinder(h=ft,d=spd);
      translate([-sx/2,-sy/2,0]) cylinder(h=ft,d=spd);
    }
    translate([-sx/2,sy/2,0]) cylinder(h=ft+sph,d=spd);
    translate([sx/2,-sy/2,0]) cylinder(h=ft+sph,d=spd);
    translate([sx/2,sy/2,0]) cylinder(h=ft+sph,d=spd);
    translate([-sx/2,-sy/2,0]) cylinder(h=ft+sph,d=spd);
    // vesa
    hull(){
      translate([-vx/2,vy/2,0]) cylinder(h=ft,d=spd);
      translate([vx/2,vy/2,0]) cylinder(h=ft,d=spd);
    }
    hull(){
      translate([-vx/2,-vy/2,0]) cylinder(h=ft,d=spd);
      translate([vx/2,-vy/2,0]) cylinder(h=ft,d=spd);
    }
    hull(){
      translate([-vx/2,vy/2,0]) cylinder(h=ft,d=spd);
      translate([-vx/2,-vy/2,0]) cylinder(h=ft,d=spd);
    }
    hull(){
      translate([vx/2,vy/2,0]) cylinder(h=ft,d=spd);
      translate([vx/2,-vy/2,0]) cylinder(h=ft,d=spd);
    }
    translate([-vx/2,vy/2,0]) cylinder(h=ft+vph,d=vpd);
    translate([vx/2,-vy/2,0]) cylinder(h=ft+vph,d=vpd);
    translate([vx/2,vy/2,0]) cylinder(h=ft+vph,d=vpd);
    translate([-vx/2,-vy/2,0]) cylinder(h=ft+vph,d=vpd);
    // pi
    translate([-px/2,py/2,-pph]) cylinder(h=ft+pph,d=ppd);
    translate([px/2,-py/2,-pph]) cylinder(h=ft+pph,d=ppd);
    translate([px/2,py/2,-pph]) cylinder(h=ft+pph,d=ppd);
    translate([-px/2,-py/2,-pph]) cylinder(h=ft+pph,d=ppd);
  }
  group(){ // remove - screw holes
    // screen
    translate([-sx/2,sy/2,1]) cylinder(h=ft+sph,d=shd);
    translate([sx/2,-sy/2,1]) cylinder(h=ft+sph,d=shd);
    translate([sx/2,sy/2,1]) cylinder(h=ft+sph,d=shd);
    translate([-sx/2,-sy/2,1]) cylinder(h=ft+sph,d=shd);
    // vesa
    translate([-vx/2,vy/2,-1]) cylinder(h=ft+vph,d=vhd);
    translate([vx/2,-vy/2,-1]) cylinder(h=ft+vph,d=vhd);
    translate([vx/2,vy/2,-1]) cylinder(h=ft+vph,d=vhd);
    translate([-vx/2,-vy/2,-1]) cylinder(h=ft+vph,d=vhd);
    // pi
    translate([-px/2,py/2,-0.1-pph]) cylinder(h=0.1+ft+pph+0.1,d=phd);
    translate([px/2,-py/2,-0.1-pph]) cylinder(h=0.1+ft+pph+0.1,d=phd);
    translate([px/2,py/2,-0.1-pph]) cylinder(h=0.1+ft+pph+0.1,d=phd);
    translate([-px/2,-py/2,-0.1-pph]) cylinder(h=0.1+ft+pph+0.1,d=phd);
  }
}
