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

[Day 2](https://adventofcode.com/2020/day/2) question is about string manipulation, which we all know that it is not a strong area for MATLAB. This question took me much longer than Day 1 even though these 2 questions are around the same level of difficulty. To approach this question, I use both MATLAB and EXCEL, EXCEL is used for parsing the given input into 4 columns. The 4 columns are lower bound (later becomes first position), upper bound (later becomes second position), key, and password. Remeber to choose the correct delimiter when parsing each rows. 

The MATLAB implementation is rather straightforward. For the first part, use `length(strfind(password, key))`to count the number of occurrences. The password is valid if the number of occurrences fall in between the lower bound and the upper bound. For the second part, use `extractBetween` to extract the characters at the given 2 locations, then compare the characters with the key. If they only match once, then it is a valid count, if they match twice or zero times, it is an invalid count.

```
Time & Rank
00:16:14  3705 
00:25:32  3907
```

## Day 3

By now, I am pretty convinced that from [Day 3](https://adventofcode.com/2020/day/3) onwards, all the questions will involve some string manipulation. Day 3 question is  a simple counting problem. The only catch for MATLAB is to make the raw inputs (consists of `.`  and `#`) into 0s and 1s. After converting a string array to an integer array, the rest is just counting how many 1s along the zigzag path. Another thing worth noting is that the x-y plane in MATLAB array is the clockwise-90-degree-rotated version of mathematical x-y plane.

After finishing the first part, the second part is almost like a free meal. Just change the amount of incremental of x-axis and y-axis to different values and multiply all the results, that product is the final answer.

```
Time & Rank
00:23:56  5488
00:26:22  4184
```

## Day 4

Well, [Day 4](https://adventofcode.com/2020/day/4) is another string manipulation problem. This problem is actually very straightforward, but for some reason, I decided to go for a extremely inefficient approach on the second part. It took me 6 hours before I decided to let my first approach go and restart doing everything. That is the reason why the codes for part1 and part2 are very different structurally. 

The idea of solution is simple. First, remove all the carriage returns and collapse each passport into 1 line. Then, parse the passports into key-value pairs. By analysing each key-value pair, the rest of the questions are very straightforward to implement. The first time I approached this problem, I chose not to parse each passports into key-value pair, but hope to get the results in a quick-and-dirty way. Of course, that quick-and-dirty way did not work and I spent much longer time refactoring the codes in the end. Lesson learnt today: Remeber to let it go at the right time. Sometimes starting a new approach is much better than fixing the old approach.

```
Time & Rank
00:18:02  3562
06:19:09  21886 (Wow)
```

## Day 5

[Day 5](https://adventofcode.com/2020/day/5) question is really an interesting one. The seating ID is encoded by a set of letters, where each letter cuts the space into 2 halves. Each spatial point can be uniquely characterized by 7 row letters and 3 column letters. The first part is just to translate this characterization process into codes. 

The second part is really fun, I managed to find the missing seating ID using EXCEL. But to visualize it better, I plot all the seat coordinates in MATLAB and found a missing dot in the middle (Of course, as the question mentioned, the missing seats at the very front and back do not count).  The seating ID of that missing dot (in red circle) is the answer.

```
Time & Rank
00:31:16  5630
00:43:00  5534
```

