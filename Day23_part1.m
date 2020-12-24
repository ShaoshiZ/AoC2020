function cup_arrangement = Day23_part1(cup_arrangement)

current_cup_index = 1;

for i = 1:100
    cup_arrangement_update = cup_arrangement;
    
    current_cup = cup_arrangement_update(current_cup_index);
    
    pick_up_cup = cup_arrangement_update(current_cup_index+1:current_cup_index+3);
    destination_cup = current_cup;
    while true
       destination_cup = destination_cup - 1;
       if destination_cup <= 0
           destination_cup = max(cup_arrangement_update);
       end
       
       if ~ismember(destination_cup, pick_up_cup)
           cup_arrangement_update(current_cup_index+1:current_cup_index+3) = [];
           destination_cup_index = find(cup_arrangement_update == destination_cup);
           cup_arrangement_update = [cup_arrangement_update(1:destination_cup_index) ...
               pick_up_cup cup_arrangement_update(destination_cup_index+1:end)];
           break           
       end             
    end  
    
    current_cup_index = find(cup_arrangement_update == current_cup);
    current_cup_index = current_cup_index + 1;
    if current_cup_index > 9
        current_cup_index = current_cup_index - 9;
    end
    
    cup_arrangement_update = circshift(cup_arrangement_update, -current_cup_index+1);
    current_cup_index = 1;
    cup_arrangement = cup_arrangement_update;
end

end