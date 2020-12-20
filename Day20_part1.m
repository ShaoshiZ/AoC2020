function [answer, left_border_tile_id, right_border_tile_id, up_border_tile_id, down_border_tile_id, tile_arr] = Day20_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
tile_set = regexp(data, '\n', 'split');
tile_set = tile_set';

tile_id_arr = zeros(144, 1);
tile_arr = zeros(10, 10, 144);

counter = 1;
for i = 1:12:1717
   tile_individual = tile_set(i:i+10, :); 
   tile_header = tile_individual(1, :); 
   tile_header_split = split(tile_header, [" ", ":"]);
   tile_id = str2double(tile_header_split{2});
   tile_id_arr(counter) = tile_id;
   
   tile = tile_individual(2:11, :);
   tile_convert = zeros(10, 10);
   for j = 1:10
      tile_str = tile{j};
      for k = 1:10 
          tile_char = tile_str(k);
          if strcmp(tile_char, '.')
             tile_convert(j, k) = 0; 
          else
             tile_convert(j, k) = 1; 
          end
      end
   end
   
   tile_arr(:, :, counter) = tile_convert;
   counter = counter + 1;
end

found_match_left = zeros(144, 1);
left_border_tile_id = zeros(144, 4);
for i = 1:144
   tile_of_interest = tile_arr(:, :, i);
   left_edge = tile_of_interest(:, 1);
   for j = 1:144
       if j == i; continue; end
       tile_reference = tile_arr(:, :, j);
       if sum(left_edge == tile_reference(:, 1)) == 10 || sum(left_edge == flip(tile_reference(:, 1))) == 10
           found_match_left(i, 1) = found_match_left(i, 1) + 1;
           left_border_tile_id(i, 1) = j;
       end
       
       if sum(left_edge == tile_reference(1, :)') == 10 || sum(left_edge == flip(tile_reference(1, :)')) == 10
           found_match_left(i, 1) = found_match_left(i, 1) + 1;
           left_border_tile_id(i, 3) = j;
       end
       
       if sum(left_edge == tile_reference(10, :)') == 10 || sum(left_edge == flip(tile_reference(10, :)')) == 10
           found_match_left(i, 1) = found_match_left(i, 1) + 1;
           left_border_tile_id(i, 4) = j;
       end
       
       if sum(left_edge == tile_reference(:, 10)) == 10 || sum(left_edge == flip(tile_reference(:, 10))) == 10
           found_match_left(i, 1) = found_match_left(i, 1) + 1;
           left_border_tile_id(i, 2) = j;
       end
   end   
end

found_match_right = zeros(144, 1);
right_border_tile_id = zeros(144, 4);
for i = 1:144
   tile_of_interest = tile_arr(:, :, i);
   right_edge = tile_of_interest(:, 10);
   for j = 1:144
       if j == i; continue; end
       tile_reference = tile_arr(:, :, j);
       if sum(right_edge == tile_reference(:, 1)) == 10 || sum(right_edge == flip(tile_reference(:, 1))) == 10
           found_match_right(i, 1) = found_match_right(i, 1) + 1;
           right_border_tile_id(i, 1) = j;
       end
       
       if sum(right_edge == tile_reference(1, :)') == 10 || sum(right_edge == flip(tile_reference(1, :)')) == 10
           found_match_right(i, 1) = found_match_right(i, 1) + 1;
           right_border_tile_id(i, 3) = j;
       end
       
       if sum(right_edge == tile_reference(10, :)') == 10 || sum(right_edge == flip(tile_reference(10, :)')) == 10
           found_match_right(i, 1) = found_match_right(i, 1) + 1;
           right_border_tile_id(i, 4) = j;
       end
       
       if sum(right_edge == tile_reference(:, 10)) == 10 || sum(right_edge == flip(tile_reference(:, 10))) == 10
           found_match_right(i, 1) = found_match_right(i, 1) + 1;
           right_border_tile_id(i, 2) = j;
       end
   end   
end

found_match_up = zeros(144, 1);
up_border_tile_id = zeros(144, 4);
for i = 1:144
   tile_of_interest = tile_arr(:, :, i);
   up_edge = tile_of_interest(1, :);
   for j = 1:144
       if j == i; continue; end
       tile_reference = tile_arr(:, :, j);
       if sum(up_edge == tile_reference(:, 1)') == 10 || sum(up_edge == flip(tile_reference(:, 1)')) == 10
           found_match_up(i, 1) = found_match_up(i, 1) + 1;
           up_border_tile_id(i, 1) = j;
       end
       
       if sum(up_edge == tile_reference(1, :)) == 10 || sum(up_edge == flip(tile_reference(1, :))) == 10
           found_match_up(i, 1) = found_match_up(i, 1) + 1;
           up_border_tile_id(i, 3) = j;
       end
       
       if sum(up_edge == tile_reference(10, :)) == 10 || sum(up_edge == flip(tile_reference(10, :))) == 10
           found_match_up(i, 1) = found_match_up(i, 1) + 1;
           up_border_tile_id(i, 4) = j;
       end
       
       if sum(up_edge == tile_reference(:, 10)') == 10 || sum(up_edge == flip(tile_reference(:, 10)')) == 10
           found_match_up(i, 1) = found_match_up(i, 1) + 1;
           up_border_tile_id(i, 2) = j;
       end
   end   
end

found_match_down = zeros(144, 1);
down_border_tile_id = zeros(144, 4);
for i = 1:144
   tile_of_interest = tile_arr(:, :, i);
   down_edge = tile_of_interest(10, :);
   for j = 1:144
       if j == i; continue; end
       tile_reference = tile_arr(:, :, j);
       if sum(down_edge == tile_reference(:, 1)') == 10 || sum(down_edge == flip(tile_reference(:, 1)')) == 10
           found_match_down(i, 1) = found_match_down(i, 1) + 1;
           down_border_tile_id(i, 1) = j;
       end
       
       if sum(down_edge == tile_reference(1, :)) == 10 || sum(down_edge == flip(tile_reference(1, :))) == 10
           found_match_down(i, 1) = found_match_down(i, 1) + 1;
           down_border_tile_id(i, 3) = j;
       end
       
       if sum(down_edge == tile_reference(10, :)) == 10 || sum(down_edge == flip(tile_reference(10, :))) == 10
           found_match_down(i, 1) = found_match_down(i, 1) + 1;
           down_border_tile_id(i, 4) = j;
       end
       
       if sum(down_edge == tile_reference(:, 10)') == 10 || sum(down_edge == flip(tile_reference(:, 10)')) == 10
           found_match_down(i, 1) = found_match_down(i, 1) + 1;
           down_border_tile_id(i, 2) = j;
       end
   end   
end

match = [found_match_left found_match_right found_match_up found_match_down];
sum_match = sum(match, 2);
corner = find(sum_match == 2);
answer = prod(tile_id_arr(corner));


end