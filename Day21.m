function [answer_part1, allergen_dict] = Day21(input)

length_input = 40;
fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
food_set = regexp(data, '\n', 'split');
food_set = food_set';

food_parse = cell(length_input, 2);
allergen_list = {};

total_ingredient = 0;
for i = 1:length_input
    food = food_set{i};
    food_split = split(food, "(");
    ingredients = food_split{1};
    allergens = food_split{2};
    
    ingredients = split(ingredients, " ");
    ingredients = ingredients(1:end-1);
    allergen_split = split(allergens, [" ", ", ", ")"]);
    allergens = allergen_split(2:end-1);
    
    total_ingredient = total_ingredient + length(ingredients);
    food_parse{i, 1} = ingredients;
    food_parse{i, 2} = allergens;
    
    allergen_list = [allergen_list; allergens];
    allergen_list = unique(allergen_list);
end

allergen_dict = cell(length(allergen_list), 2);
for i = 1:length(allergen_list)
    allergen = allergen_list{i};
    allergen_dict{i, 1} = allergen;
    
    counter = 0;
    for j = 1:length_input
        allergens = food_parse{j, 2};
        if ismember(allergen, allergens)
           ingredients = food_parse{j, 1}; 
           counter = counter + 1;
           if counter == 1
               ingredient_list = ingredients;
           else
               ingredient_list = intersect(ingredient_list, ingredients);
           end
        end
    end
    
    allergen_dict{i, 2} = ingredient_list;
end

all_allergen_foreign_language = unique(vertcat(allergen_dict{:, 2}));
total_allergen = 0;
for i = 1:length(all_allergen_foreign_language)
    allergen = all_allergen_foreign_language{i};
    for j = 1:length_input
        ingredients = food_parse{j, 1};
        idx = strcmp(ingredients, allergen);
        num_allergen = sum(idx);
        total_allergen = total_allergen + num_allergen;
    end
end

answer_part1 = total_ingredient - total_allergen;
end