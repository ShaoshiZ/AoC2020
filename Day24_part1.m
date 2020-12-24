function answer = Day24_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
instruction_set = regexp(data, '\n', 'split');
instruction_set = instruction_set';

% 1 white, -1 black
position_color_arr = [0, 0, 1];

for i = 1:length(instruction_set)
   instruction = instruction_set{i}; 
   instruction_array = [];
   j = 1;
   while j<=length(instruction)
       direction_char = instruction(j);
       if strcmp(direction_char, 'e')
           instruction_array = [instruction_array, 1];
           j = j+1;
       elseif strcmp(direction_char, 'w')
           instruction_array = [instruction_array, 4];
           j = j+1;
       elseif strcmp(direction_char, 'n')
           next_direction_char = instruction(j+1);
           if strcmp(next_direction_char, 'w')
               instruction_array = [instruction_array, 5];
           elseif strcmp(next_direction_char, 'e')
               instruction_array = [instruction_array, 6];
           end
           j = j+2;
       elseif strcmp(direction_char, 's')
           next_direction_char = instruction(j+1);
           if strcmp(next_direction_char, 'w')
               instruction_array = [instruction_array, 3];
           elseif strcmp(next_direction_char, 'e')
               instruction_array = [instruction_array, 2];
           end
           j = j+2;
       end    
   end
   
   position = [0, 0];
   for j = 1:size(instruction_array, 2)
       instruction = instruction_array(j);
       if instruction == 1
           x_incremental = 2;
           y_incremental = 0;
           
       elseif instruction == 2
           x_incremental = 1;
           y_incremental = -1;
           
       elseif instruction == 3
           x_incremental = -1;
           y_incremental = -1;
           
       elseif instruction == 4
           x_incremental = -2;
           y_incremental = 0; 
           
       elseif instruction == 5
           x_incremental = -1;
           y_incremental = 1;
           
       elseif instruction == 6
           x_incremental = 1;
           y_incremental = 1;
       end
       
       position = position + [x_incremental, y_incremental];     
   end

   [tf, ind] = ismember(position, position_color_arr(:, 1:2), 'rows');

   if tf == 1
       position_color_arr(ind, 3) = -position_color_arr(ind, 3);
   else
       position_color_arr = [position_color_arr; [position, -1]];
   end  
end

answer = sum(position_color_arr(:, 3) == -1);

end