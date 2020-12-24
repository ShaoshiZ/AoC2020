function answer = Day24_part2(position_color_arr)

position_color_arr_update = position_color_arr;
for j = 1:200
    position_color_arr_cp = position_color_arr;
    for i = 1:size(position_color_arr, 1)
       tile_position = position_color_arr(i, 1:2);
       neighbour_position_color_arr = [];

       % hexagonal padding
       % e
       tile_e = tile_position + [2 0];
       [tf, ind_e] = ismember(tile_e, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_e, 1]];
           ind_e = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_e, :)];

       % se
       tile_se = tile_position + [1 -1];
       [tf, ind_se] = ismember(tile_se, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_se, 1]];
           ind_se = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_se, :)];

       % sw
       tile_sw = tile_position + [-1 -1];
       [tf, ind_sw] = ismember(tile_sw, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_sw, 1]];
           ind_sw = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_sw, :)];

       % w
       tile_w = tile_position + [-2 0];
       [tf, ind_w] = ismember(tile_w, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_w, 1]];
           ind_w = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_w, :)];

       % nw
       tile_nw = tile_position + [-1 1];
       [tf, ind_nw] = ismember(tile_nw, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_nw, 1]];
           ind_nw = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_nw, :)];

       % ne
       tile_ne = tile_position + [1 1];
       [tf, ind_ne] = ismember(tile_ne, position_color_arr_update(:, 1:2), 'rows');
       if ~tf
           position_color_arr_update = [position_color_arr_update; [tile_ne, 1]];
           ind_ne = size(position_color_arr_update, 1);
       end
       neighbour_position_color_arr = [neighbour_position_color_arr; position_color_arr_update(ind_ne, :)];  
       
       if mod(j, 2) == 0
           tile_color = position_color_arr(i, 3);
           if tile_color == 1
              if sum(neighbour_position_color_arr(:, 3) == -1) == 2
                  position_color_arr_cp(i, 3) = -1;
              end
           else
               if sum(neighbour_position_color_arr(:, 3) == -1) == 0 || ...
                   sum(neighbour_position_color_arr(:, 3) == -1) > 2
                  position_color_arr_cp(i, 3) = 1;
               end
               
           end
       end
        
    end
    
    if mod(j, 2) == 0
       position_color_arr = position_color_arr_cp; 
       position_color_arr_update = position_color_arr_cp;
    else
       position_color_arr = position_color_arr_update;   
    end
 
end

answer = sum(position_color_arr_cp(:, 3) == -1);
end