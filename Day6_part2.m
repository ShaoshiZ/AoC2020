function sum = Day6_part2(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
answers = regexp(data, '\n\s*\n', 'split');
answers = reshape(answers,[459 1]);
sum = 0;

for i = 1:459
    row = answers{i};
    row = char(strrep(row, char(10), " "));    
    parsed_row = split(row, ' ');
    
    intersection = parsed_row{1, :};
    j = 1;
    while j < size(parsed_row, 1)
        intersection = intersect(intersection, parsed_row{j+1, :});
        j = j+1;
    end
    
    sum = sum + length(intersection);   
end

end