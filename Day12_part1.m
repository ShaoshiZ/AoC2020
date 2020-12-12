function answer = Day12_part1(input)

fid = fopen(input);
input = textscan(fid, '%s');
input = input{1};
input_parsed = zeros(length(input), 2);

for i = 1:length(input)
   row = char(input(i)); 
   command =  row(1);
   if strcmp(command, 'E')
       input_parsed(i, 1) = 1; 
   elseif strcmp(command, 'S')
       input_parsed(i, 1) = 2;
   elseif strcmp(command, 'W')
       input_parsed(i, 1) = 3;
   elseif strcmp(command, 'N')
       input_parsed(i, 1) = 4;
   elseif strcmp(command, 'L')
       input_parsed(i, 1) = 5;
   elseif strcmp(command, 'R')
       input_parsed(i, 1) = 6;
   elseif strcmp(command, 'F')
       input_parsed(i, 1) = 7;
   end

   value = row(2:end);
   input_parsed(i, 2) = str2double(value); 
end

east_west_position = 0;
north_south_position = 0;
facing_direction = 1;

for i = 1:size(input_parsed, 1)
   command = input_parsed(i, 1);
   value = input_parsed(i, 2);
   
   if command == 5
      facing_direction = facing_direction - value/90;
      if facing_direction < 1
         facing_direction = facing_direction + 4; 
      end
      if facing_direction > 4
          facing_direction = facing_direction - 4;
      end
   end
   
   if command == 6
      facing_direction = facing_direction + value/90;
      if facing_direction < 0
         facing_direction = facing_direction + 4; 
      end
      if facing_direction > 4
          facing_direction = facing_direction - 4;
      end
   end
   
   if command == 7
      if facing_direction == 1
         east_west_position = east_west_position + value; 
      elseif facing_direction == 2
         north_south_position = north_south_position - value; 
      elseif facing_direction == 3
         east_west_position = east_west_position - value;
      elseif facing_direction == 4
         north_south_position = north_south_position + value;           
      end   
   end
   
   if command == 1
       east_west_position = east_west_position + value;
   end
   
   if command == 2
       north_south_position = north_south_position - value;
   end
   
   if command == 3
       east_west_position = east_west_position - value;
   end
   
   if command == 4
       north_south_position = north_south_position + value;
   end  
   
   position = [east_west_position; north_south_position];
end

answer = sum(abs(position));
    
end