// Ruthelessly functional minimalist adapter frame for Adafruit 2232, 2260, 2406, 2407
// HDMI 800x480 Display Backpack, 5" or 7", with or without touch
// and Raspberry Pi 3B+ or 4 (and whatever else has the same mount holes)
// to Vesa 75 or Vesa 100

// Brian K. White - b.kenyon.w@gmail.com

// https://www.adafruit.com/product/2232
// https://www.adafruit.com/product/2260
// https://www.adafruit.com/product/2406
// https://www.adafruit.com/product/2407
// 7" model: holes 157.1 x 108.2 x 3  back 6.3  pcb 1.6  front(w/touch) 7.3
// 5" model: holes 112.7 x 83.8 x 3   back 6.3  pcb 1.6  front(w/touch) 7.3

// Mount holes in screen pcb are 3mm. Screw holes are 2.5mm to allow M3 screws to anchor in the plastic.
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=207

// The vesa screw posts also take M3 screws.
// Most vesa mounts probably expect an M4 or M5 screw, but an M3 flat head works well in a M4 hole.
// Spacer posts between the frame and the vesa mount will usually be needed to use a vesa mount.
// The size will vary depending on the design of the particular vesa mount, and whether or not a Pi in installed.
//
// Mount holes in the Pi pcb are 2.75mm and Pi case screws are M2.5
// The Pi mount posts take M2.5 screws.
// The Pi mount posts can be used 2 ways. A Pi can be mounted bare on the posts,
// and M2.5x8 screws can go in from the top of the Pi and thread into the posts.
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=137
//
// Or, a Pi in a solid aluminum armor heatsink case can be mounted by running longer M2.5 screws (perhaps 20mm)
// from the front side of the frame (the screen side), through the entire length of the posts,
// through that bottom half of the heatsink case, through the Pi pcb, and thread into the top half of the heatsink case.
//   https://www.amazon.com/dp/B07VMD25SK/
//   https://www.metricscrews.us/index.php?main_page=product_info&products_id=166

// TODO
// * Makefile (generate STLs and renders for all variants using variable overrides)
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
shd = 2.5; // screen hole diameter for M3 screw
sph = 6.5; // screen post height
spd = 8;   // screen post diameter

vx = (vesa=="vesa100") ? 100 : 75; // vesa x
vy = (vesa=="vesa100") ? 100 : 75; // vesa y
vhd = shd; // vesa hole diameter
vph = sph; // vesa post height
vpd = spd; // vesa post diameter

// pi 3B+ 4
px = 58;   // pi x
py = 49;   // pi y
phd = 2.2; // pi hole diameter for M2.5 screw
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
      translate([-vx/2,vy/2,0]) cylinder(h=ft,d=vpd);
      translate([vx/2,vy/2,0]) cylinder(h=ft,d=vpd);
    }
    hull(){
      translate([-vx/2,-vy/2,0]) cylinder(h=ft,d=vpd);
      translate([vx/2,-vy/2,0]) cylinder(h=ft,d=vpd);
    }
    hull(){
      translate([-vx/2,vy/2,0]) cylinder(h=ft,d=vpd);
      translate([-vx/2,-vy/2,0]) cylinder(h=ft,d=vpd);
    }
    hull(){
      translate([vx/2,vy/2,0]) cylinder(h=ft,d=vpd);
      translate([vx/2,-vy/2,0]) cylinder(h=ft,d=vpd);
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
