function [error_rate, criteria_parsed, nearby_ticket_array] = Day16_part1(criteria, nearby_ticket)

error_rate = 0;
nearby_ticket_array = zeros(237, 20);
invalid_ticket_index = [];

fid = fopen(criteria, 'r');
data = fread(fid, '*char').';
fclose(fid);
criteria_set = regexp(data, '\n', 'split');
criteria_set = criteria_set';

criteria_parsed = zeros(20, 4);

for i = 1:20
   row = criteria_set{i}; 
   row_split = split(row, [":", "-", " or "]);
   range1_lower = str2double(row_split{2});
   range1_higher = str2double(row_split{3});
   
   range2_lower = str2double(row_split{4});
   range2_higher = str2double(row_split{5});
   criteria_parsed(i, :) = [range1_lower range1_higher range2_lower range2_higher];
end

fid = fopen(nearby_ticket, 'r');
data = fread(fid, '*char').';
fclose(fid);
nearby_ticket_set = regexp(data, '\n', 'split');
nearby_ticket_set = nearby_ticket_set';

for i = 1:237
   row = nearby_ticket_set{i}; 
   row_split = split(row, ",")'; 
   row_split = str2double(row_split);
   nearby_ticket_array(i, :) = row_split;
   for j = 1:20
      valid = 0; 
      for k = 1:20
         range1 = criteria_parsed(k, 1:2); 
         range2 = criteria_parsed(k, 3:4);         
         if (range1(1) <= row_split(j) && row_split(j) <= range1(2)) || ...
                 (range2(1) <= row_split(j) && row_split(j) <= range2(2))
            valid = 1; 
         end
      end
      
      if valid == 0
         error_rate = error_rate + row_split(j); 
         invalid_ticket_index(end+1) = i;
      end
   end
   
   
end
nearby_ticket_array(invalid_ticket_index, :) = [];

end