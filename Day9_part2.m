function weakness = Day9_part2(input, threshold)

number_list = load(input);

for i = 1:1000
    counter = i;
    summation = number_list(counter);
    while(summation <= threshold && counter <= 1000)
        counter = counter + 1;
        summation = summation + number_list(counter);
        if summation == threshold
            low = min(number_list(i:counter));
            high = max(number_list(i:counter));
            weakness = low+high;
            break
        end
    end     
end

end