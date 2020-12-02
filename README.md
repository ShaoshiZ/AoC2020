# AoC2020
This github repo is used for [Advent of Code 2020](https://adventofcode.com/2020). Most of the codes are written in MATLAB.



## Day 1

Question from [Day 1](https://adventofcode.com/2020/day/1) is usually just for a warm-up. Same for this year. I use 3 nested `for` loops to solve this question. This approach is definitely not the most efficient one, but surely it will get you the correct answer. 

```
Time & Rank
00:07:52  1070 
00:15:21  2163
```

## Day 2

[Day 2](https://adventofcode.com/2020/day/2) question is about string manipulation, which we all know that it is not a strong area for MATLAB. This question took me much longer than Day 1even though these 2 questions are around the same level of difficulty. To approach this question, I use both MATLAB and EXCEL, EXCEL is used for parsing the given input into 4 columns. The 4 columns are lower bound (later becomes first position), upper bound (later becomes second position), key, and password. Remeber to choose the correct delimiter when parsing each rows. 

The MATLAB implementation is rather straightforward. For the first part, use `length(strfind(password, key))`to count the number of occurrences. The password is valid is the number of occurrences fall in between the lower bound and the upper bound. For the second part, use `extractBetween` to extract the characters at the given 2 locations, then compare the characters with the key. If they only match once, then it is a valid count, if they match twice or zero times, it is an invalid count.

```
Time & Rank
00:16:14  3705 
00:25:32  3907
```



