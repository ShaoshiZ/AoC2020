function valid_count = Day2_part2(first_position_array, second_position_array, key_array, password_array)

valid_count = 0;
for i = 1:1000
   occurrence = 0;
   password = password_array(i);
   key = key_array(i);
   first_position = first_position_array(i);
   second_position = second_position_array(i);
   
   first_letter = extractBetween(password, first_position, first_position);
   if strcmp(first_letter, key)
       occurrence = occurrence + 1;
   end
   
   second_letter = extractBetween(password, second_position, second_position);
   if strcmp(second_letter, key)
       occurrence = occurrence + 1;
   end
   
   if occurrence == 1
       valid_count = valid_count + 1;
   end
end


end