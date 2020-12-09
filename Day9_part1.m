function number = Day9_part1(input)

number_list = load(input);
preamble_length = 25;

counter = 1;
for i = preamble_length + 1 : 1000
    number = number_list(i);
    preamble = number_list(counter:counter + preamble_length - 1);
    sum_array = [];
    for j = 1 : preamble_length
       for k = j + 1 : preamble_length
           if preamble(j) ~= preamble(k)
                addition = preamble(j) + preamble(k);
                sum_array(end+1) = addition;
           end
       end        
    end
    
    if sum(ismember(sum_array, number)) == 0
        break
    end
    
    counter = counter + 1;
end

end