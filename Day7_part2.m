function inner_bag_list_update = Day7_part2(inner_bag_list_format)

outer_amount = cell2mat(inner_bag_list_format(:, 1));
outer_color = inner_bag_list_format(:, 2);

inner_bag_list_update = {};
for i = 1:size(outer_color, 1)
   bag_color = outer_color{i};
   if ~strcmp(bag_color, 'The end')
       inner_bag_list = find_inner_bag_one_layer_down('Day7_input.txt', bag_color);
       inner_amount = cell2mat(inner_bag_list(:, 1));
       total_amount = outer_amount(i) * inner_amount;
       inner_bag_list_update_each_row = horzcat(num2cell(total_amount), inner_bag_list(:, 2));

       inner_bag_list_update = vertcat(inner_bag_list_update, inner_bag_list_update_each_row);
   else
       inner_bag_list_update = vertcat(inner_bag_list_update, inner_bag_list_format(i, :));
   end
end

end