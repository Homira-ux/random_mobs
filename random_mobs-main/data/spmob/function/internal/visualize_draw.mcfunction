# Range edge visualization (Macro function)
# Display particles along the 4 edges of the bottom face only

# Bottom face 4 edges (Y = min_y)
# Use spread parameter to show line
$particle minecraft:dust{color:[1.0,0.5,0.0],scale:0.75} $(min_x) $(min_y) $(min_z) $(max_x) 0 $(min_z) 0 20 force
$particle minecraft:dust{color:[1.0,0.5,0.0],scale:0.75} $(max_x) $(min_y) $(min_z) $(max_x) 0 $(max_z) 0 20 force
$particle minecraft:dust{color:[1.0,0.5,0.0],scale:0.75} $(max_x) $(min_y) $(max_z) $(min_x) 0 $(max_z) 0 20 force
$particle minecraft:dust{color:[1.0,0.5,0.0],scale:0.75} $(min_x) $(min_y) $(max_z) $(min_x) 0 $(min_z) 0 20 force
