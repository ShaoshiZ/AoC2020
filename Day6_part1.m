function sum = Day6_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
answers = regexp(data, '\n\s*\n', 'split');
answers = reshape(answers,[459 1]);
sum = 0;

for i = 1:459
    row = answers{i};
    row = char(strrep(row, char(10), ""));    
    
    sum = sum + length(unique(row));   
end

end