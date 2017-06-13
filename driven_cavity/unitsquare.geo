ncells = ${ncells};

Point(1) = {0, 0, 0, 1.0};
Extrude {1, 0, 0} {
  Point{1};
}
Extrude {0, 0.5, 0} {
  Line{1};
}
Extrude {0, 0.5, 0} {
  Line{2};
}

Transfinite Line {3} = ncells/2+1 Using Progression 1;
Transfinite Line {7} = ncells/2+1 Using Progression 1;
Transfinite Line {4} = ncells/2+1 Using Progression 1;
Transfinite Line {8} = ncells/2+1 Using Progression 1;
Transfinite Line {1} = ncells+1 Using Progression 1;
Transfinite Line {2} = ncells+1 Using Progression 1;
Transfinite Line {6} = ncells+1 Using Progression 1;

Transfinite Surface {5} Alternated;
Transfinite Surface {9} Alternated;

Physical Line(1) = {3, 7}; // Left
Physical Line(2) = {4, 8}; // Right
Physical Line(3) = {1};    // Bottom
Physical Line(4) = {6};    // Top
Physical Surface(1) = {5}; // Lower
Physical Surface(2) = {9}; // Upper
