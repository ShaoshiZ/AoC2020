function answer = Day12_part2(input)

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

ship_east_west_position = 0;
ship_north_south_position = 0;

waypoint_east_west_position = 10;
waypoint_north_south_position = 1;

for i = 1:size(input_parsed, 1)
   command = input_parsed(i, 1);
   value = input_parsed(i, 2);
   
   if command == 1
      waypoint_east_west_position = waypoint_east_west_position + value;        
   end
   
   if command == 2
       waypoint_north_south_position = waypoint_north_south_position - value;
   end
   
   if command == 3
       waypoint_east_west_position = waypoint_east_west_position - value;
   end
   
   if command == 4
       waypoint_north_south_position = waypoint_north_south_position + value;
   end
   
   if command == 5
      if value/90 == 1
         waypoint_east_west_position_tmp = waypoint_east_west_position;
         waypoint_east_west_position = -waypoint_north_south_position;
         waypoint_north_south_position = waypoint_east_west_position_tmp;
      end
      
      if value/90 == 2
         waypoint_east_west_position = -waypoint_east_west_position;
         waypoint_north_south_position = -waypoint_north_south_position; 
      end
      
      if value/90 == 3
         waypoint_east_west_position_tmp = waypoint_east_west_position;
         waypoint_east_west_position = waypoint_north_south_position;   
         waypoint_north_south_position = -waypoint_east_west_position_tmp; 
      end
   end
   
   if command == 6
      if value/90 == 1
         waypoint_east_west_position_tmp = waypoint_east_west_position;
         waypoint_east_west_position = waypoint_north_south_position;
         waypoint_north_south_position = -waypoint_east_west_position_tmp;
      end
      
      if value/90 == 2
         waypoint_east_west_position = -waypoint_east_west_position;
         waypoint_north_south_position = -waypoint_north_south_position; 
      end
      
      if value/90 == 3
         waypoint_east_west_position_tmp = waypoint_east_west_position;
         waypoint_east_west_position = -waypoint_north_south_position;   
         waypoint_north_south_position = waypoint_east_west_position_tmp; 
      end
   end
   
   if command == 7
      ship_east_west_position = ship_east_west_position + value*waypoint_east_west_position; 
      ship_north_south_position = ship_north_south_position + value*waypoint_north_south_position; 
   end
   
   ship_position = [ship_east_west_position; ship_north_south_position];
   %waypoint_position = [waypoint_east_west_position; waypoint_north_south_position];
end

answer = sum(abs(ship_position));
    
end