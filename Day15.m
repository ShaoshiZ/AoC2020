function answer = Day15(input, num_iter)

memory_array = ones(length(input), 3);
memory_array(:, 1) = input';
memory_array(:, 2) = 1:length(input);
memory_array(:, 3) = 1:length(input);

row_zero = memory_array(:, 1) == 0;
memory_array(row_zero, 3) = size(memory_array, 1)+1;

previous_num = 0;
for i = size(memory_array, 1) + 2:num_iter
   row_previous = memory_array(:, 1) == previous_num;
   occurrence_indictor = memory_array(row_previous, 2:3);
   
   if occurrence_indictor(2) - occurrence_indictor(1) == 0
       row_zero = memory_array(:, 1) == 0;
       memory_array(row_zero, 2) = memory_array(row_zero, 3);
       memory_array(row_zero, 3) = i;
       previous_num = 0;
   else
       difference = occurrence_indictor(2) - occurrence_indictor(1);
       if sum(memory_array(:,1) == difference)~=0
          row_difference = memory_array(:, 1) == difference;
          memory_array(row_difference, 2) = memory_array(row_difference, 3);
          memory_array(row_difference, 3) = i;
       else
          memory_array(end+1, :) = [difference i i];          
       end
       previous_num = difference;      
   end
end

row = memory_array(:, 3) == num_iter;
answer = memory_array(row, 1);
end
