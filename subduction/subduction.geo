mindx = ${mindx};

dx_fine   = 2.0;
dx_medium = 10.0;
dx_coarse = 50.0;

dx_scale = mindx/dx_fine;

dx_fine   = dx_fine*dx_scale;
dx_medium = dx_medium*dx_scale;
dx_coarse = dx_coarse*dx_scale;

delta = ${delta};// slab dip angle
d = 40.0;  // thickness of overriding rigid plate
c = 80.0;  // coupling depth
t = 300.0; // total depth
e = 50.0;  // extra distance on right

dx = d/Tan(delta*Pi/180.);
cx = c/Tan(delta*Pi/180.);
tx = t/Tan(delta*Pi/180.);

Point(1) = {0, 0, 0, dx_medium};     // trench (top left corner)
Point(2) = {tx+e, 0, 0, dx_medium};  // top right corner
Point(3) = {dx, -d, 0, dx_fine};     // intersection of slab and overriding plate
Point(4) = {tx+e, -d, 0, dx_medium}; // right hand end of overriding plate
Point(5) = {cx, -c, 0, dx_fine};     // coupling point
Point(6) = {0, -t, 0, dx_coarse};    // lower left corner
Point(7) = {tx, -t, 0, dx_medium};   // bottom of slab
Point(8) = {tx+e, -t, 0, dx_coarse}; // bottom right corner

Line(1) = {1, 2}; // top
Physical Line(1) = {1}; // top

Line(2) = {3, 4}; // base of overriding plate
Physical Line(2) = {2}; // base of overriding plate

Line(3) = {6, 7}; // base of domain beneath slab
Physical Line(3) = {3}; // base of domain beneath slab

Line(4) = {7, 8}; // base of domain beneath wedge
Physical Line(4) = {4}; //base of domain beneath wedge

Line(5) = {1, 6}; // left hand side (incoming slab)
Physical Line(5) = {5}; // left hand side (incoming slab)

Line(6) = {2, 4}; // right hand side (overriding plate)
Physical Line(6) = {6}; // right hand side (overriding plate)

Line(7) = {4, 8}; // right hand side (wedge)
Physical Line(7) = {7}; // right hand side (wedge)

Line(8) = {1, 3}; // slab (fault)
Physical Line(8) = {8}; // slab (fault)

Line(9) = {3, 5}; // slab (coupling)
Physical Line(9) = {9}; // slab (coupling)

Line(10) = {5, 7}; // slab (fully coupled)
Physical Line(10) = {10}; // slab (fully coupled)

Line Loop(1) = {5, 3, -10, -9, -8};
Plane Surface(1) = {1};
Physical Surface(1) = {1}; // slab

Line Loop(2) = {9, 10, 4, -7, -2};
Plane Surface(2) = {2};
Physical Surface(2) = {2}; // wedge

Line Loop(3) = {2, -6, -1, 8};
Plane Surface(3) = {3};
Physical Surface(3) = {3}; // overriding plate

