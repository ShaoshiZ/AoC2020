function answer = Day16_part2(criteria_parsed, nearby_ticket, your_ticket)

valid_ticket = nearby_ticket;
valid_count_arr = zeros(20, 20);
for i = 1:20
   field = valid_ticket(:, i);
   for j = 1:20
       criteria = criteria_parsed(j, :);
       valid_count = 0;
       range1 = criteria(1:2); 
       range2 = criteria(3:4);
       for k = 1:size(valid_ticket, 1)
          if (range1(1) <= field(k) && field(k) <= range1(2)) || ...
                 (range2(1) <= field(k) && field(k) <= range2(2))
                valid_count = valid_count + 1;
          end           
       end
       valid_count_arr(i, j) = valid_count;
   end  
end
valid_count_arr = valid_count_arr - min(valid_count_arr(:));

interesting_array = [valid_count_arr sum(valid_count_arr, 2); [sum(valid_count_arr, 1) -1]];
interesting_last_column = interesting_array(:, end);
interesting_last_row = interesting_array(end, :);
six_fields = interesting_last_row(1:6);
six_fields_transformed = 21-six_fields;

answer = 1;
for i = 1:6
    marker = six_fields_transformed(i);
    index = find(interesting_last_column == marker);
    answer = answer * your_ticket(index);
end

end