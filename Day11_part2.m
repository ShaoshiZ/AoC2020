function answer = Day11_part2(input)

fid = fopen(input);
input = textscan(fid, '%s');
input = input{1};
input_convert = zeros(size(input, 1), length(char(input(1))));
for i = 1:size(input, 1)
   row = input(i);
   row = char(row);
   for j = 1:length(row)
       character = row(j);
       if strcmp(character, 'L')
          input_convert(i, j) = 0;
       elseif strcmp(character, '#')
           input_convert(i, j) = 1;
       elseif strcmp(character, '.')
           input_convert(i, j) = -1;
       end   
   end
end

% padding
input_convert = [-1*ones(1, size(input_convert, 2)); input_convert; -1*ones(1, size(input_convert, 2))];
input_convert = [-1*ones(size(input_convert, 1), 1) input_convert -1*ones(size(input_convert, 1), 1)];


seat_plan_original = input_convert;
seat_plan_updated = seat_plan_original;
for repeat = 1:105
    for i = 2:size(input, 1) + 1
        for j = 2:length(char(input(1))) + 1
          current_seat_status = seat_plan_original(i, j);
          
          up_seat_array = seat_plan_original(1:i-1, j);
          up_seat_array = flip(up_seat_array);
          up_seat_status = 0;
          for k = 1:length(up_seat_array)
             if up_seat_array(k) ~= -1
                 up_seat_status = up_seat_array(k);
                 break
             end
          end
          
          down_seat_array = seat_plan_original(i+1:end, j);
          down_seat_status = 0;
          for k = 1:length(down_seat_array)
             if down_seat_array(k) ~= -1
                 down_seat_status = down_seat_array(k);
                 break
             end
          end
          
          left_seat_array = seat_plan_original(i, 1:j-1);
          left_seat_array = flip(left_seat_array);
          left_seat_status = 0;
          for k = 1:length(left_seat_array)
             if left_seat_array(k) ~= -1
                 left_seat_status = left_seat_array(k);
                 break
             end
          end
          
          right_seat_array = seat_plan_original(i, j+1:end);
          right_seat_status = 0;
          for k = 1:length(right_seat_array)
             if right_seat_array(k) ~= -1
                 right_seat_status = right_seat_array(k);
                 break
             end
          end
          
          % upper left
          p = i - 1;
          q = j - 1;
          upper_left_seat_status = 0;
          while p >= 1 && q >= 1
              if seat_plan_original(p, q) ~= -1
                 upper_left_seat_status = seat_plan_original(p, q); 
                 break
              end
              p = p - 1;
              q = q - 1;
          end
          
          % upper right
          p = i - 1;
          q = j + 1;
          upper_right_seat_status = 0;
          while p >= 1 && q <= size(seat_plan_original, 2)
              if seat_plan_original(p, q) ~= -1
                 upper_right_seat_status = seat_plan_original(p, q); 
                 break
              end
              p = p - 1;
              q = q + 1;
          end
          
          % lower left
          p = i + 1;
          q = j - 1;
          lower_left_seat_status = 0;
          while p <= size(seat_plan_original, 1) && q >= 1
              if seat_plan_original(p, q) ~= -1
                 lower_left_seat_status = seat_plan_original(p, q); 
                 break
              end
              p = p + 1;
              q = q - 1;
          end
          
          % lower right
          p = i + 1;
          q = j + 1;
          lower_right_seat_status = 0;
          while p <= size(seat_plan_original, 1) && q <= size(seat_plan_original, 2)
              if seat_plan_original(p, q) ~= -1
                 lower_right_seat_status = seat_plan_original(p, q); 
                 break
              end
              p = p + 1;
              q = q + 1;
          end

          ajacent_seat_status_array = [upper_left_seat_status; up_seat_status; ...
              upper_right_seat_status; left_seat_status; right_seat_status; ...
              lower_left_seat_status; down_seat_status; lower_right_seat_status];

          if current_seat_status == 0
             if sum(ajacent_seat_status_array(:) == 1) == 0
                 seat_plan_updated(i, j) = 1;
             end          
          end

          if current_seat_status == 1
              if sum(ajacent_seat_status_array(:) == 1) >= 5
                 seat_plan_updated(i, j) = 0; 
              end
          end

       end

    end
    seat_plan_original = seat_plan_updated;
end

answer = (sum(seat_plan_original(:) == 1));
end
