function answer = Day10_part1(input)

joltage = load(input);
joltage = sort(joltage, 'ascend');

highest_rating = max(joltage) + 3;
joltage(end + 1) = highest_rating;

starting_rating = 0;
joltage = [starting_rating; joltage];

counter_1_diff = 0;
counter_3_diff = 0;

for i = 1:94
    current_joltage = joltage(i);
    next_joltage = joltage(i+1);
    difference = next_joltage - current_joltage;
    if difference == 1 
        counter_1_diff = counter_1_diff + 1;
    elseif difference == 3
        counter_3_diff = counter_3_diff + 1;
    end
end

answer = counter_1_diff * counter_3_diff;
end