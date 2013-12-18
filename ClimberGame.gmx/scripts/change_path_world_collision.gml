// This function takes a path index as argument0 and the index of a point along that path as argument1. The function modifies either the given point
// or the next point in the list to be exactly 16 pixels from the surface of the world. if argument2 is true, then the given point stays the same ; 
// if it is false, then the given point will be moved. IE argument2 is true if the given point is outside the world.

path_to_modify = argument0
path_point_index = argument1
given_point_outside_world = argument2

if(path_get_point_x(path_to_modify,path_point_index) - path_get_point_x(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)) != 0) // if the line is not vertical
{
    // Set up variables for quadratic equation. They are complex because we are finding the intersections of a line with a circle.
    qe_slope = (path_get_point_y(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)) - path_get_point_y(path_to_modify,path_point_index)) / (path_get_point_x(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)) - path_get_point_x(path_to_modify,path_point_index))

    qe_a = 1 + sqr(qe_slope)

    qe_b = (-2*obj_world_initialize_god.world_center_x) - (2*sqr(qe_slope)*path_get_point_x(path_to_modify,path_point_index)) + (2*qe_slope*path_get_point_y(path_to_modify,path_point_index)) - (2*qe_slope*obj_world_initialize_god.world_center_y)

    qe_c = sqr(obj_world_initialize_god.world_center_x) + (sqr(qe_slope)*sqr(path_get_point_x(path_to_modify,path_point_index))) - (2*qe_slope*path_get_point_x(path_to_modify,path_point_index)*path_get_point_y(path_to_modify,path_point_index)) + (2*qe_slope*path_get_point_x(path_to_modify,path_point_index)*obj_world_initialize_god.world_center_y) + sqr(path_get_point_y(path_to_modify,path_point_index)) - (2*path_get_point_y(path_to_modify,path_point_index)*obj_world_initialize_god.world_center_y) + sqr(obj_world_initialize_god.world_center_y) - (sqr(WORLD_RADIUS + 16))
    
    // Get two possible points of collision
    test1_x = quadratic_root_1(qe_a,qe_b,qe_c)

    test2_x = quadratic_root_2(qe_a,qe_b,qe_c)
    
    if (test1_x != -1234567 && ((test1_x <= path_get_point_x(path_to_modify,path_point_index) && test1_x >= path_get_point_x(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)))
          ||
          (test1_x >= path_get_point_x(path_to_modify,path_point_index) && test1_x <= path_get_point_x(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)))))
    {
        modified_x = test1_x
    }   //  if test1_x is on the line segment, use it as the correct x
    else
        modified_x = test2_x // else it must be test2_x
        
    modified_y = get_line_y_point_slope(path_get_point_x(path_to_modify,path_point_index),path_get_point_y(path_to_modify,path_point_index),qe_slope,modified_x)
}
else // slope is vertical
{
    modified_x = path_get_point_x(path_to_modify,path_point_index)
    
    test1_y = quadratic_root_1(1, (-2*obj_world_initialize_god.world_center_y), (obj_world_initialize_god.world_center_y^2) + modified_x^2 - (2*modified_x*obj_world_initialize_god.world_center_x) + (obj_world_initialize_god.world_center_x^2) - ((WORLD_RADIUS+16)^2))
    test2_y = quadratic_root_2(1, (-2*obj_world_initialize_god.world_center_y), (obj_world_initialize_god.world_center_y^2) + modified_x^2 - (2*modified_x*obj_world_initialize_god.world_center_x) + (obj_world_initialize_god.world_center_x^2) - ((WORLD_RADIUS+16)^2))

    if (test1_y != -1234567 && ((test1_y <= path_get_point_y(path_to_modify,path_point_index) && test1_y >= path_get_point_y(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)))
          ||
          (test1_y >= path_get_point_y(path_to_modify,path_point_index) && test1_y <= path_get_point_y(path_to_modify,(path_point_index+1)%path_get_number(path_to_modify)))))
    {
        modified_y = test1_y
    }   //  if test1_y is on the line segment
    else    //  else it must be test2_y
        modified_y = test2_y
}

// add the given point outside world clause so that if the gien point is outside the world, we treat the next point as being inside, and vise versa
path_change_point(path_to_modify,(path_point_index+given_point_outside_world)%path_get_number(path_to_modify),modified_x,modified_y,100)
global.path_inside_world = true
