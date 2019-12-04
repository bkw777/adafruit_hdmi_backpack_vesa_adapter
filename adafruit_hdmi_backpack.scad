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
// The size will vary depending on the design of the particular vesa mount, and whether or not a Pi in installed.
//
// The mount holes for the Pi take M2.5 screws.
// The Pi mount posts can be used 2 ways. A Pi can be mounted bare on the posts,
// and M2.5x8 screws can go in from the top of the Pi and thread into the posts.
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=137
//
// Or, a Pi in a solid aluminum armor heatsink case can be mounted by running longer M2.5 screws (perhaps 20mm)
// from the front side of the frame (the screen side), through the entire length of the posts,
// through that bottom half of the heatsink case, through the Pi pcb, and thread into the top half of the heatsink case.
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

// Configuration
size = "7inch";   // 5, 7
vesa = "vesa75";  // 75, 100

/////////////////////////////////////////////////////////////////////

ft = 3;    // frame thickness

sx = (size=="5inch") ? 112.7 : 157.1; // screen x
sy = (size=="5inch") ? 83.8 : 108.2;  // screen y
shd = 2.8; // screen hole diameter - M3 screw
sph = 6.5; // screen post height
spd = 8;   // screen post diameter

vx = (vesa=="vesa75") ? 75 : 100; // vesa x
vy = (vesa=="vesa75") ? 75 : 100; // vesa y
vhd = 3.8; // vesa hole diameter - M4 screw
vph = sph; // vesa post height
vpd = 10; // vesa post diameter

// pi 3B+ 4
px = 58;   // pi x
py = 49;   // pi y
phd = 2.2; // pi hole diameter - M2.5 screw
pph = 3;   // pi post height
ppd = 6.5; // pi post diameter

$fn = 36; // smooth arcs

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
