function [player1, player2] = Day22_part2(player1, player2)

player_score_arr = [];
while ~isempty(player1) && ~isempty(player2)

    player1_card = player1(1, 1);
    player2_card = player2(1, 1);
    
    if size(player1, 1) - 1 >= player1_card && ...
            size(player2, 1) - 1 >= player2_card
       player1_subcopy = player1(2:1+player1_card);
       player2_subcopy = player2(2:1+player2_card);
       [player1_subcopy, ~] = Day22_part2(player1_subcopy, player2_subcopy);

       if isempty(player1_subcopy)
          player2(end+1, 1) = player2_card;
          player2(end+1, 1) = player1_card;
          player1(1, :) = [];
          player2(1, :) = [];
       else
          player1(end+1, 1) = player1_card;
          player1(end+1, 1) = player2_card;
          player1(1, :) = [];
          player2(1, :) = [];
       end
        
    else
        if player1_card > player2_card
            player1(end+1, 1) = player1_card;
            player1(end+1, 1) = player2_card;
            player1(1, :) = [];
            player2(1, :) = [];
        elseif player2_card > player1_card
            player2(end+1, 1) = player2_card;
            player2(end+1, 1) = player1_card;
            player1(1, :) = [];
            player2(1, :) = [];
        end
    end
        
    player1_score = sum(player1.^2.*(size(player1, 1):-1:1)');
    player2_score = sum(player2.^2.*(size(player2, 1):-1:1)');
    
    if ismember(player1_score*player2_score, player_score_arr)
        break
    else
        player_score_arr(end+1) = player1_score*player2_score;
    end   
end

end