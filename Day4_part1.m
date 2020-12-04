function valid_passport = Day4_part1(input)

fid = fopen(input, 'r');
data = fread(fid, '*char').';
fclose(fid);
passport = regexp(data, '\n\s*\n', 'split');
passport = reshape(passport,[296 1]);

valid_count = 0;
valid_passport = {};
for i = 1:296
   counter = 0; 
   row = passport{i};
   if contains(row, 'byr')
       counter = counter + 1;
   end
   if contains(row, 'iyr')
       counter = counter + 1;
   end
   if contains(row, 'eyr')
       counter = counter + 1;
   end
   if contains(row, 'hgt')
       counter = counter + 1;
   end
   if contains(row, 'hcl')
       counter = counter + 1;
   end
   if contains(row, 'ecl')
       counter = counter + 1;
   end
   if contains(row, 'pid')
       counter = counter + 1;
   end
   if counter == 7
       valid_count = valid_count + 1;
       valid_passport{valid_count} = row;
   end
    
end

end