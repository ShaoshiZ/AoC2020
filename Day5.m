function [row_loc_array, col_loc_array, highest_value] = Day5(input)

fid = fopen(input);
boarding_pass = textscan(fid, '%s');
fclose(fid);

seatingID = zeros(876, 1);
row_loc_array = zeros(876, 1);
col_loc_array = zeros(876, 1);

for i = 1:876
   row_upper_limit = 127;
   row_lower_limit = 0;
   
   col_upper_limit = 7;
   col_lower_limit = 0;
   
   single_boarding_pass = boarding_pass(1);
   single_boarding_pass = char(single_boarding_pass{1});
   single_boarding_pass = single_boarding_pass(i, :);
   
   row = single_boarding_pass(1:7);
   col = single_boarding_pass(8:10);   
   
   for j = 1:7
       if strcmp(row(j), 'F')
          row_upper_limit = row_upper_limit - (row_upper_limit - row_lower_limit + 1)/2;
          if j == 7
              row_loc = row_upper_limit;
          end
       elseif strcmp(row(j), 'B')
          row_lower_limit = row_lower_limit + (row_upper_limit - row_lower_limit + 1)/2;
          if j == 7
             row_loc = row_lower_limit; 
          end
       end
   end
   
   
    for j = 1:3
       if strcmp(col(j), 'L')
          col_upper_limit = col_upper_limit - (col_upper_limit - col_lower_limit + 1)/2;
          if j == 3
              col_loc = col_upper_limit;
          end
       elseif strcmp(col(j), 'R')
          col_lower_limit = col_lower_limit + (col_upper_limit - col_lower_limit + 1)/2;
          if j == 3
             col_loc = col_lower_limit; 
          end
       end
    end
    
    seatingID_value = row_loc*8 + col_loc;
    seatingID(i) = seatingID_value;
    row_loc_array(i) = row_loc;
    col_loc_array(i) = col_loc;
end

highest_value = max(seatingID);

ideal_seating_plan = combvec(0:127, 0:7);
ideal_seating_plan = ideal_seating_plan';
hold on
set(gca, 'FontSize', 15)
% Look for the red circle, that is the missing seating ID
plot(ideal_seating_plan(:, 2), ideal_seating_plan(:, 1), 'ro')
plot(col_loc_array, row_loc_array, 'bo');
xlabel('Column');
ylabel('Row')
ylim([0, 127])
legend({'Ideal seating plan', 'Actual seating plan'}, 'Location', 'BestOutside')
title('The missing seat is at (64, 3)')
hold off
end