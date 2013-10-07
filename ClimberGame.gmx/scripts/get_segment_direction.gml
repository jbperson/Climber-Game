// This function returns a direction parallel to the current movement_path of the player. Can only be used while the player is on a path.

player_distance_along_path = path_position * path_get_length(movement_path)
counted_distance_along_path = 0

for (i = 1 ; i < path_get_number(movement_path) ; i++)
{
    counted_distance_along_path += point_distance(path_get_point_x(movement_path,i-1)  ,path_get_point_y(movement_path,i-1),
                                                  path_get_point_x(movement_path,i),path_get_point_y(movement_path,i)) // add current segment
                                                  
    if (counted_distance_along_path >= player_distance_along_path)
    {
        return point_direction( path_get_point_x(movement_path,i-1)  ,path_get_point_y(movement_path,i-1),
                                path_get_point_x(movement_path,i),path_get_point_y(movement_path,i)) // if you have exceeded it now, return the direction of current segment
    }
}
