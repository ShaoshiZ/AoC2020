function [player1, player2] = Day22(player1, player2)

length_player1 = length(player1);
length_player2 = length(player2);

while length_player1 ~= 0 && length_player2 ~=0
    player1_card = player1(1);
    player2_card = player2(1);
    
    if player1_card > player2_card
        player1(end+1) = player1_card;
        player1(end+1) = player2_card;
        player1(1) = [];
        player2(1) = [];
    elseif player2_card > player1_card
        player2(end+1) = player2_card;
        player2(end+1) = player1_card;
        player1(1) = [];
        player2(1) = [];        
    end   
    
    length_player1 = length(player1);
    length_player2 = length(player2);
end


end