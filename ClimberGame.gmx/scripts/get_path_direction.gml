// This script return the direction the player must be travelling by using path_move_speed, path_position, and movement_path

var positive

if(path_move_speed) < 0
    positive = -1
else
    positive = 1
return point_direction(path_get_x(movement_path,path_position),path_get_y(movement_path,path_position),path_get_x(movement_path,path_position + positive/path_get_length(movement_path)),path_get_y(movement_path,path_position + positive/path_get_length(movement_path)))
