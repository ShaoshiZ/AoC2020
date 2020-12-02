function valid_count = Day2_part1(lower_bound_array, upper_bound_array, key_array, password_array)

valid_count = 0;
for i = 1:1000
   password = password_array(i);
   key = key_array(i);
   lower_bound = lower_bound_array(i);
   upper_bound = upper_bound_array(i);
   
   occurrence = length(strfind(password, key));
   if occurrence >= lower_bound && occurrence <= upper_bound
       valid_count = valid_count + 1;
   end
end


end