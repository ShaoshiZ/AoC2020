function answer = Day17_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
input_set = regexp(data, '\n', 'split');
input_set = input_set';

input_convert = zeros(size(input_set, 1));
for i = 1:size(input_set, 1)
   row = input_set{i};
   for j = 1:length(row)
       character = row(j);
       if strcmp(character, '.')
           input_convert(i, j) = 0;
       else
           input_convert(i, j) = 1;
       end       
   end
end

for i = 1:6
   input_convert = padarray(input_convert, [1 1], 0, 'both'); 
   
   conv_kernel = cat(3, ones(3), [1 1 1; 1 0 1; 1 1 1], ones(3));
   num_neighbors = convn(input_convert, conv_kernel); 
   num_neighbors = num_neighbors(2:end-1, 2:end-1, :); %trim the border
   
   input_convert = cat(3, zeros(size(input_convert, 1)), input_convert, zeros(size(input_convert, 1)));
   input_convert_update = input_convert; 
   
   for z=1:size(input_convert, 3)
      for x=1:size(input_convert, 1) 
          for y=1:size(input_convert, 2)
              input_convert_element = input_convert(x, y, z);
              num_neighbors_element = num_neighbors(x, y, z);
              if input_convert_element == 0
                 if num_neighbors_element == 3
                     input_convert_update(x, y, z) = 1;                   
                 end
              else
                  if ~(num_neighbors_element == 2 || num_neighbors_element == 3)
                     input_convert_update(x, y, z) = 0; 
                  end
              end
          end
      end
   end
   
   input_convert = input_convert_update;
end

answer = sum(input_convert_update(:));

end