function outer_bag_list = Day7_part1(bag_color_list)

outer_bag_list = {};
for i = 1:length(bag_color_list)
    bag_color = bag_color_list{i};
    outer_bag = find_outer_bag_one_layer_up('Day7_input.txt', bag_color);
    outer_bag_list = {[outer_bag_list{:}; outer_bag']};
end
outer_bag_list = unique(outer_bag_list{1, 1});


end