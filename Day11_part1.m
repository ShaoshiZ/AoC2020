function answer = Day11_part1(input)

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
for repeat = 1:100
    for i = 2:size(input, 1) + 1
        for j = 2:length(char(input(1))) + 1
          current_seat_status = seat_plan_original(i, j);
          upper_left_seat_status = seat_plan_original(i-1, j-1);
          up_seat_status = seat_plan_original(i-1, j);
          upper_right_seat_status = seat_plan_original(i-1, j+1);
          left_seat_status = seat_plan_original(i, j-1);
          right_seat_status = seat_plan_original(i, j+1);
          lower_left_seat_status = seat_plan_original(i+1, j-1);
          down_seat_status = seat_plan_original(i+1, j);
          lower_right_seat_status = seat_plan_original(i+1, j+1);
          ajacent_seat_status_array = [upper_left_seat_status; up_seat_status; ...
              upper_right_seat_status; left_seat_status; right_seat_status; ...
              lower_left_seat_status; down_seat_status; lower_right_seat_status];

          if current_seat_status == 0
             if sum(ajacent_seat_status_array(:) == 1) == 0
                 seat_plan_updated(i, j) = 1;
             end          
          end

          if current_seat_status == 1
              if sum(ajacent_seat_status_array(:) == 1) >= 4
                 seat_plan_updated(i, j) = 0; 
              end
          end

       end

    end
    seat_plan_original = seat_plan_updated;
end

answer = (sum(seat_plan_updated(:) == 1));
end