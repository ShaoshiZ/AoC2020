function answer = Day14_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
input_set = regexp(data, '\n', 'split');
input_set = input_set';

mem_array = zeros(65386, 1); %the max value of the memory address

for i = 1:size(input_set, 1)
   row = input_set{i}; 
   if contains(row, 'mask')
      mask = row(8:end);
   end
   
   if contains(row, 'mem')
      mem_split = regexp(row, '[[] = ]', 'split'); 
      address = str2double(mem_split{2});
      mem_decimal = str2double(mem_split{6});
      mem_binary_num_pad = zeros(1, 36);
      mem_binary = flip(de2bi(mem_decimal));
      mem_binary_num_pad(end - length(mem_binary) + 1:end) = mem_binary;
      
      for j = 1:36
          mask_char = mask(j);
          if strcmp(mask_char, '0')
              mask_digit = str2double(mask_char);
              mem_binary_num_pad(j) = mask_digit;
          elseif strcmp(mask_char, '1')
              mask_digit = str2double(mask_char);
              mem_binary_num_pad(j) = mask_digit;
          end
      end
      
      mem_decimal = bi2de(flip(mem_binary_num_pad));
      mem_array(address) = mem_decimal;
   end
       
end

answer = sum(mem_array);

end