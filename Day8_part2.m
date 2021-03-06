function accumulator = Day8_part2(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
instructions_set = regexp(data, '\n', 'split');
instructions_set = instructions_set';

instructions_parsed_original = {};
for i = 1:641
    row = instructions_set{i, 1}; 
    instruction_split = split(row, ' ');
    command = instruction_split{1};
    value = instruction_split{2};
    instructions_parsed_original{i, 1} = command;
    instructions_parsed_original{i, 2} = value;
end

for i = 1:641
    instructions_parsed = instructions_parsed_original;
    instruction = instructions_parsed(i, :);
    command = instruction{1};
    if strcmp(command, 'nop')
       instructions_parsed(i, 1) = {'jmp'}; 
    elseif strcmp(command, 'jmp')
       instructions_parsed(i, 1) = {'nop'};
    end
    
    accumulator = 0;
    instruction_pos = 1;
    instruction_pos_arr = [];
    instruction_pos_arr(end+1, :) = 1;
    
    while length(unique(instruction_pos_arr)) == size(instruction_pos_arr, 1)
        instruction = instructions_parsed(instruction_pos, :);
        command = instruction{1};
        value = instruction{2};

        if strcmp(command, 'nop')
           instruction_pos = instruction_pos + 1; 
           instruction_pos_arr(end+1, :) = instruction_pos; 
        end

        if strcmp(command, 'acc')
           instruction_pos = instruction_pos + 1;
           instruction_pos_arr(end+1, :) = instruction_pos; 
           sign = value(1);
           abs_value = str2double(value(2:end));
           if strcmp(sign, '+')
              accumulator = accumulator + abs_value;
           elseif strcmp(sign, '-')
              accumulator = accumulator - abs_value;
           end
        end

        if strcmp(command, 'jmp')
           sign = value(1);
           abs_value = str2double(value(2:end));
           if strcmp(sign, '+')
              instruction_pos = instruction_pos + abs_value;
           elseif strcmp(sign, '-')
              instruction_pos = instruction_pos - abs_value;
           end
           instruction_pos_arr(end+1, :) = instruction_pos; 
        end

        if instruction_pos == 642
           break 
        end
    end
    
    if instruction_pos == 642
        break
    end

end


end