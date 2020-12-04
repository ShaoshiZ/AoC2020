function valid_count = Day4_part2(passport_part1)

passport = passport_part1;
valid_count = 0;

for i = 1:239
    counter = 0;
    row = passport{i};
    row = strrep(row, char(10), " ");
    parsed_row = split(row, ' ');
    
    for j = 1:size(parsed_row, 1)
        entry = parsed_row(j, 1);
        key = extractBetween(entry, 1, 3);
        value = extractAfter(entry, 4);
        
        if strcmp(key, 'byr')
           if str2double(value) >= 1920 && str2double(value) <= 2002 
               counter = counter + 1;
           end
        end
        
        if strcmp(key, 'iyr')
           if str2double(value) >= 2010 && str2double(value) <= 2020
              counter = counter + 1; 
           end
        end
        
        if strcmp(key, 'eyr')
           if str2double(value) >= 2020 && str2double(value) <= 2030
              counter = counter + 1; 
           end
        end
        
        if strcmp(key, 'hgt')
            if contains(value, 'cm')
                value = char(value);
                height_cm = value(1:end-2);
                if str2double(height_cm) >= 150 && str2double(height_cm) <= 193
                   counter = counter + 1; 
                end
            elseif contains(value, 'in')
                value = char(value);
                height_in = value(1:end-2);
                if str2double(height_in) >= 59 && str2double(height_in) <= 76
                   counter = counter + 1; 
                end                
            end
        end
        
        if strcmp(key, 'hcl')
           value = char(value); 
           hash = value(1); 
           if strcmp(hash, '#')
              color_code = value(2:end); 
              check_regex_pattern = sum(regexp(color_code, '[0-9_a-f]'));
              if check_regex_pattern == 21
                 counter = counter + 1; 
              end
           end
        end       
        
        if strcmp(key, 'ecl')
           if strcmp(value, 'amb') || strcmp(value, 'blu') || ...
              strcmp(value, 'brn') || strcmp(value, 'grn') || ...
              strcmp(value, 'gry') || strcmp(value, 'hzl') || ...
              strcmp(value, 'oth')
                counter = counter + 1;
           end
        end
        
        if strcmp(key, 'pid')
           value = char(value); 
           if length(value) == 9
              counter = counter + 1; 
           end
        end

    end

    if counter == 7
       valid_count = valid_count + 1; 
    end    
end

end