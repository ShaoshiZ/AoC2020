function sum = Day3(input, down, right)

fid = fopen(input, 'r');
stringPattern = textscan(fid,'%s');
fclose(fid);
stringPattern = string(stringPattern{:});

convertedPattern = zeros(1, 31);
for i = 1:323
    row = stringPattern(i);
    for j = 1:31
        character = row{1}(j);
    if character == "."
        convertedPattern(i, j) = 0;
    end
    if character == "#"
        convertedPattern(i, j) = 1;
    end
    end
end

convertedPattern = repmat(convertedPattern, 1, 100);

x_location = 1;
y_location = 1;
sum = 0;

while x_location <= 323
   sum = sum + convertedPattern(x_location, y_location);  
   y_location = y_location + right;
   x_location = x_location + down;
end
end