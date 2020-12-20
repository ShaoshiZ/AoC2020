function answer = Day20_part2(input)

[~, left_border_tile_id, right_border_tile_id, up_border_tile_id, down_border_tile_id, tile_arr] = Day20_part1(input);
[tile_arr_update, id_first_row] = Day20_form_image_right(tile_arr, left_border_tile_id, right_border_tile_id, up_border_tile_id, down_border_tile_id);

image = zeros(96, 96);

for i = 1:12
    [~, img] = Day20_form_image_down(tile_arr_update, left_border_tile_id, right_border_tile_id, up_border_tile_id, down_border_tile_id, id_first_row(i), 8*i-7);
    image = image+img;
end

conv_kernel = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0;...
               1,0,0,0,0,1,1,0,0,0,0,1,1,0,0,0,0,1,1,1;...
               0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,1,0,0,0];

finding_sea_monster = conv2(image, conv_kernel, 'valid');
num_sea_monster = sum(sum(finding_sea_monster == 15));
answer = sum(image(:)) - 15*num_sea_monster;

end