function Day25(card_public_key, door_public_key)

loop_size = 0;
value = 1;
card_loop_found_flag = 0;
door_loop_found_flag = 0;

while true
    value = value * 7;
    value = mod(value, 20201227);
    loop_size = loop_size + 1;
    
    if value == card_public_key
        card_loop_size = loop_size;
        card_loop_found_flag = 1;
    elseif value == door_public_key
        door_loop_size = loop_size;
        door_loop_found_flag = 1;
    end

    if door_loop_found_flag == 1 && card_loop_found_flag == 1
        break
    end
end

card_value = 1;
for i = 1:door_loop_size
    card_value = card_public_key*card_value;
    card_value = mod(card_value, 20201227);
end

door_value = 1;
for i = 1:card_loop_size
    door_value = door_public_key*door_value;
    door_value = mod(door_value, 20201227);
end

if door_value == card_value
    disp('This is it! The end of AoC 2020.')
    disp(['The answer is ' num2str(card_value)])
end


end