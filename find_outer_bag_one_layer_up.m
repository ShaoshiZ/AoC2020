function outer_bag_list = find_outer_bag_one_layer_up(input, bag_color)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
answers = regexp(data, '\n', 'split');
answers = answers';

outer_bag_list = {};

for i = 1:594
    bag = split(answers{i, 1}, ' ');
    outer_bag = {bag{1} bag{2}};
    outer_bag = strjoin(outer_bag);
    
    inner_bag = bag(5:end);
    inner_bag = strjoin(inner_bag);
    
    if contains(inner_bag, bag_color)
       outer_bag_list{end+1} = outer_bag; 
    end

end

end