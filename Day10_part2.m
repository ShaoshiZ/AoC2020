function answer = Day10_part2(input)

joltage = load(input);
input_length = length(joltage);
joltage = sort(joltage, 'ascend');

highest_rating = max(joltage) + 3;
joltage(end + 1) = highest_rating;

starting_rating = 0;
joltage = [starting_rating; joltage];

dict = zeros(input_length+2, 2);
dict(:, 1) = joltage;
dict(:, 2) = 1;
for i = 1: (input_length + 1)
    joltage_rating = joltage(i);
    possible_next_joltage = joltage_rating + [1;2;3];
    counter = 0;
    for j = 1:3
        if sum(ismember(joltage, possible_next_joltage(j))) ~= 0
            counter = counter + 1;
        end
    end
    dict(i, 2) = counter;
end

dict = flip(dict);
for i = 2:input_length + 2
    number_of_possible_branches = dict(i, 2);
    if number_of_possible_branches == 1
        dict(i, 2) = dict(i - 1, 2);
    elseif number_of_possible_branches == 2
        total_sum = dict(i - 1, 2) + dict(i - 2, 2);
        dict(i, 2) = total_sum;
    elseif number_of_possible_branches == 3
        total_sum = dict(i - 1, 2) + dict(i - 2, 2) + dict(i - 3, 2);
        dict(i, 2) = total_sum;
    end
end

answer = dict(end, 2);

end