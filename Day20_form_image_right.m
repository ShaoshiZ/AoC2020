function [tile_arr, id_to_the_right] = Day20_form_image_right(tile_arr, left_border_tile_id, right_border_tile_id, up_border_tile_id, down_border_tile_id)

image = zeros(96, 96);
id = 42;
id_to_the_right = id;

for i = 1:12
    adjacent_id = [sum(left_border_tile_id(id, :)) sum(right_border_tile_id(id, :)) ...
        sum(up_border_tile_id(id, :)) sum(down_border_tile_id(id, :))];
    tile_id = tile_arr(:, :, id);
    
    tile_trim = tile_id(2:end-1, 2:end-1);
    image(1:8, 8*i-7:8*i) = tile_trim;
    
    right_edge = tile_id(:, 10);
    for j = 1:4
       if adjacent_id(j) == 0; continue; end
       potential_right_tile_id = adjacent_id(j);
       tile_reference = tile_arr(:, :, potential_right_tile_id);
       
       if sum(right_edge == tile_reference(:, 1)) == 10 || sum(right_edge == flip(tile_reference(:, 1))) == 10
           if sum(right_edge == tile_reference(:, 1)) == 10
              tile_arr(:, :, potential_right_tile_id) = tile_arr(:, :, potential_right_tile_id); 
           else
              tile_arr(:, :, potential_right_tile_id) = flip(tile_arr(:, :, potential_right_tile_id), 1); 
           end
           id_to_the_right = [id_to_the_right potential_right_tile_id];
           id = potential_right_tile_id;
           
       end
       
       if sum(right_edge == tile_reference(1, :)') == 10 || sum(right_edge == flip(tile_reference(1, :)')) == 10
           if sum(right_edge == tile_reference(1, :)') == 10
               tile_arr(:, :, potential_right_tile_id) = tile_arr(:, :, potential_right_tile_id)';
           else
               tile_arr(:, :, potential_right_tile_id) = flip(tile_arr(:, :, potential_right_tile_id)', 1);
           end
           id_to_the_right = [id_to_the_right potential_right_tile_id];
           id = potential_right_tile_id;
       end
       
       if sum(right_edge == tile_reference(10, :)') == 10 || sum(right_edge == flip(tile_reference(10, :)')) == 10
           if sum(right_edge == tile_reference(10, :)') == 10
               tile_arr(:, :, potential_right_tile_id) = flip(tile_arr(:, :, potential_right_tile_id)', 2);
           else
               tile_arr(:, :, potential_right_tile_id) = flip(flip(tile_arr(:, :, potential_right_tile_id)', 2), 1);
           end
           id_to_the_right = [id_to_the_right potential_right_tile_id];
           id = potential_right_tile_id;
       end
       
       if sum(right_edge == tile_reference(:, 10)) == 10 || sum(right_edge == flip(tile_reference(:, 10))) == 10
           if sum(right_edge == tile_reference(:, 10)) == 10
               tile_arr(:, :, potential_right_tile_id) = flip(tile_arr(:, :, potential_right_tile_id), 2);
           else
               tile_arr(:, :, potential_right_tile_id) = flip(flip(tile_arr(:, :, potential_right_tile_id), 2), 1);
           end
           id_to_the_right = [id_to_the_right potential_right_tile_id];
           id = potential_right_tile_id;
       end
        
    end
    
end




end