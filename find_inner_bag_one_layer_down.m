function inner_bag_list_format = find_inner_bag_one_layer_down(input, bag_color)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
answers = regexp(data, '\n', 'split');
answers = answers';

for i = 1:594
    bag = split(answers{i, 1}, ' ');
    outer_bag = {bag{1} bag{2}};
    outer_bag = strjoin(outer_bag);
    
    inner_bag = bag(5:end);
    inner_bag = strjoin(inner_bag);
    
    if contains(outer_bag, bag_color)
       inner_bag_list = inner_bag; 
    end
end

inner_bag_list_split = split(inner_bag_list, ', ');
inner_bag_list_format = {};
for j = 1:size(inner_bag_list_split, 1)
    inner_bag_list_each_row_split = split(inner_bag_list_split{j}, ' ');
    amount = str2double(inner_bag_list_each_row_split{1});
    inner_bag_color_each_row = strjoin({inner_bag_list_each_row_split{2}, ...
        inner_bag_list_each_row_split{3}});
    if ~isnan(amount)
        inner_bag_list_format{j, 1} = amount;
        inner_bag_list_format{j, 2} = inner_bag_color_each_row;
    else
        inner_bag_list_format{j, 1} = 1;
        inner_bag_list_format{j, 2} = 'The end'; 
    end
end

end