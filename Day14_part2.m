function answer = Day14_part2(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
input_set = regexp(data, '\n', 'split');
input_set = input_set';

mem_array = [-1 -1];

for i = 1:size(input_set, 1)
   row = input_set{i}; 
   if contains(row, 'mask')
      mask = row(8:end);
   end
   
   if contains(row, 'mem')
      mem_split = regexp(row, '[[] = ]', 'split'); 
      decimal_address = str2double(mem_split{2});
      value = str2double(mem_split{6});
      binary_address_pad = zeros(1, 36);
      binary_address = flip(de2bi(decimal_address));
      binary_address_pad(end - length(binary_address) + 1:end) = binary_address;
      
      potential_address_array = [];
      for j = 1:36
          mask_char = mask(j);
          if strcmp(mask_char, 'X')
              binary_address_pad(j) = -1;
          elseif strcmp(mask_char, '1')
              mask_digit = str2double(mask_char);
              binary_address_pad(j) = mask_digit;
          end
      end
      
      num_X = abs(sum(binary_address_pad(binary_address_pad == -1)));
      all_combination = dec2bin(0:2^num_X - 1, num_X) - '0';
      for j = 1:size(all_combination, 1)
          binary_address_pad_cp = binary_address_pad;
          binary_address_pad_cp(binary_address_pad_cp == -1) = all_combination(j, :);
          potential_address_array = [potential_address_array; binary_address_pad_cp];
      end
      
      decimal_address = bi2de(flip(potential_address_array, 2));
      address_value_pair = [decimal_address value*ones(size(decimal_address, 1), 1)];
      
      for j = 1:size(address_value_pair, 1)
          if sum(mem_array(:, 1) == address_value_pair(j, 1)) ~= 0 
              [repeat_address_row, ~] = find(mem_array(:, 1) == address_value_pair(j, 1));
              mem_array(repeat_address_row, 2) = value;
          else
              mem_array = [mem_array; address_value_pair(j, :)];
          end
      end
   end
end

mem_array(1, :) = [];
answer = sum(mem_array(:, 2));

end