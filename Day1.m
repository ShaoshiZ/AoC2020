function product = Day1(expense_list)

for i = 1:200
    for j=1:200
        for k=1:200
            sum = expense_list(i) + expense_list(j) + expense_list(k);
            if sum == 2020
                disp(['Found it! ' num2str(expense_list(i)) '+' num2str(expense_list(j)) '+' num2str(expense_list(k)) '=2020']) 
                product = expense_list(i) * expense_list(j) * expense_list(k);
            end
        end
    end
end

end