// This function finds the nearest point along a path (argument0) as the variables new_path_point_x and new_path_point_y, as well as the path position
        // as the variable new_path_position, and the new path direction as the varialbe new_path_direction

path_to_check = argument0

path_to_check_segment = 0
path_to_check_point_count = path_get_number(path_to_check)
path_to_check_covered_distance = 0


new_path_point_x = -1000
new_path_point_y = -1000

if (x - (x-lengthdir_x(abs(speed),direction)) != 0)
{
    player_movement_slope = (y - (y-lengthdir_y(abs(speed),direction))) / (x - (x-lengthdir_x(abs(speed),direction)))
}
else
{
    player_movement_slope = 1000000
}

player_movement_intercept = y - (player_movement_slope * x)

for (i = 0 ; i < path_to_check_point_count ; i++)
{
    if ((path_get_point_x(path_to_check,(i+1)%path_to_check_point_count) - path_get_point_x(path_to_check,(i)%path_to_check_point_count)) != 0)
    {
        segment_slope = (path_get_point_y(path_to_check,(i+1)%path_to_check_point_count) - path_get_point_y(path_to_check,(i)%path_to_check_point_count)) 
                        /   (path_get_point_x(path_to_check,(i+1)%path_to_check_point_count) - path_get_point_x(path_to_check,(i)%path_to_check_point_count))
        
        segment_intercept = path_get_point_y(path_to_check,i) - (segment_slope * path_get_point_x(path_to_check,i))
       
        if ( (y < get_line_y(segment_slope,x,segment_intercept) && (y-lengthdir_y(abs(speed),direction)) >= get_line_y(segment_slope,(x-lengthdir_x(abs(speed),direction)),segment_intercept))
            ||  (y >= get_line_y(segment_slope,x,segment_intercept) && (y-lengthdir_y(abs(speed),direction)) < get_line_y(segment_slope,(x-lengthdir_x(abs(speed),direction)),segment_intercept)) )    //  if we crossed the segment
        {
    
            new_point_x = (segment_intercept - player_movement_intercept) / (player_movement_slope - segment_slope)
            new_point_y = get_line_y(segment_slope,new_point_x,segment_intercept)
        
            if (point_distance((x-lengthdir_x(abs(speed),direction)),(y-lengthdir_y(abs(speed),direction)),new_point_x,new_point_y) < point_distance((x-lengthdir_x(abs(speed),direction)),(y-lengthdir_y(abs(speed),direction)),new_path_point_x,new_path_point_y))
            {
                new_path_point_x = new_point_x
                new_path_point_y = new_point_y
            
                new_path_position = (path_to_check_covered_distance + point_distance(new_point_x,new_point_y,path_get_point_x(path_to_check,i),path_get_point_y(path_to_check,i))) / path_get_length(path_to_check)

                new_path_direction = point_direction(new_point_x,new_point_y,path_get_point_x(path_to_check,i),path_get_point_y(path_to_check,i))
            }   //  if the new segment crossed was closer to the old point  
        }
    }
    else
    {   
        if ((x < path_get_point_x(path_to_check,(i) % path_to_check_point_count) && x - lengthdir_x(abs(speed),direction) >= path_get_point_x(path_to_check,(i) % path_to_check_point_count))
        || (x >= path_get_point_x(path_to_check,i % path_to_check_point_count) && x - lengthdir_x(abs(speed),direction) < path_get_point_x(path_to_check,i % path_to_check_point_count)))
        {       
            new_point_x = path_get_point_x(path_to_check,i % path_to_check_point_count)
            new_point_y = y
        
            if (point_distance((x-lengthdir_x(abs(speed),direction)),(y-lengthdir_y(abs(speed),direction)),new_point_x,new_point_y) < point_distance((x-lengthdir_x(abs(speed),direction)),(y-lengthdir_y(abs(speed),direction)),new_path_point_x,new_path_point_y))
            {
                new_path_point_x = new_point_x
                new_path_point_y = new_point_y
                
                new_path_position = (path_to_check_covered_distance + point_distance(new_point_x,new_point_y,path_get_point_x(path_to_check,i),path_get_point_y(path_to_check,i))) / path_get_length(path_to_check)

                new_path_direction = point_direction(new_point_x,new_point_y,path_get_point_x(path_to_check,i),path_get_point_y(path_to_check,i))
            }   //  if the new segment crossed was closer to the old point 
        }
    }
    
    path_to_check_covered_distance += point_distance(path_get_point_x(path_to_check,i),path_get_point_y(path_to_check,i),path_get_point_x(path_to_check,(i+1)%path_to_check_point_count),path_get_point_y(path_to_check,(i+1)%path_to_check_point_count))
}   //  for each segment in the path
