# AoC2020
This github repo is used for [Advent of Code 2020](https://adventofcode.com/2020). Most of the codes are written in MATLAB.



## Day 1

Question from [Day 1](https://adventofcode.com/2020/day/1) is usually just a warm-up. Same for this year. I use 3 nested `for` loops to solve this question. This approach is definitely not the most efficient one, but surely it will get you the correct answer. 

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

## Day 6

Finally, we got a [question](https://adventofcode.com/2020/day/6) that I can efficiently implement on MATLAB. The key to 2 parts of the question is just `unique` and `intersect` functions. There is a slight twist in the second part as the number of people in each group is not fixed and `intersect` function can only compute the intersection of 2 arrays. A while loop can solve both problems.

```
Time & Rank
00:09:39  3531
00:19:08  3471
```

## Day 7

I do not like my [Day 7](https://adventofcode.com/2020/day/7) solution at all. Even though the solution is intuitive, but it is not clean, not efficient and not easy to use. First of all, this question reminds of of [Day 14](https://adventofcode.com/2019/day/14) question of 2019, which also took me horribly long time to solve. In fact, anything that involves recursion and maybe a fancy data structure will direcly knock me out. Before doing any real solving, the input file needs to be parsed into 2 separate columns, one column of outer bags, one column of inner bags.

For the first part, look for 'shiny gold' in the inner bag columns, then put the corresponding outer bag color into a list. This list will eventually gets longer and longer and stops. The final number of colors is the answer. To use my script, run 

```
outer_bag_list = Day7_part1({'shiny gold'});
outer_bag_list = Day7_part1({outer_bag_list});
```

Run the second line multiple times until `outer_bag_list` becomes an empty list. Add the number of colors along the way, and that will be the final answer. 

For the second part, I used a top-down approach. From the outer-most layer, gradully multiply the number of inner bags. Eventually, the codes will reach the inner-most bags and stop. Run iteratively

```
inner_bag_list = Day7_part2({'shiny gold'});
inner_bag_list = Day7_part2(inner_bag_list);
```

Prepare an EXCEL sheet and record down the output at each iteration. Sum everything up except the number in front of 'The end' (to avoid double-counting). The sum is the final answer for the second part.

```
Time & Rank
00:46:47  4251
04:00:23  10809
```

## Day 8

[Day 8](https://adventofcode.com/2020/day/8) question gives me a vibe of last year  `Intcode` question. I like this kind of question much more than the question from yesterday. Hopefully, we can continue to build on today's codes in the following days. The first part of the question is simply to implement according to the instructions. The implementation is straightforward as long as the codes can track the instruction positions (or instruction pointers) properly. In my implementation, I keep track of all instruction positions that are executed before, thus, if there is a repeated instruction somewhere, the while-loop will stop and return the latest `accumulator` value.

The second part is more like a wrapper function of the first part. In this part, I chose to modify the instructions line by line if a `nop` or `jmp` is encountered. If by modifying one of these instructions, the instruction position can reach 1 beyond the last instruction (in my case, 642), that means the program is fixed.

```
Time & Rank
00:31:47  7200
00:48:34  5328
```

## Day 9

Unfortunately, I have to start doing [today's question](https://adventofcode.com/2020/day/9) 3 hours 13 minutes later than usual. IMO, today's question is surprisingly simple. For the first part, compute sums of all combination of pairs of 2 different numbers within a section (25 numbers) and check if the next number is a member of the array of sums. For the second part, since the required set is contiguous, the stopping criteria are either the sum blows up (greater than the answer from part 1) or reaching the bottom of the list while the sum is still smaller than the asnwer from part 1. 

```
Time & Rank
03:37:42  18066
03:51:59  16517
Actual Time Taken
00:24:00 (approximate to minutes)
00:39:00 (approximate to minutes)
```

## Day 10

When I first looked at the second part of [Day 10](https://adventofcode.com/2020/day/10) question, I thought this would be a very hard problem and might involve some fancy dynamic programming. But it turns out that there is a very simple approach (which took me 1 hour to come up with).

For the first part, we just need to sort the entries in ascending order and calculate the difference between 2 consecutive entries. Then, count the number of difference that is equal to 1 and the number of difference that is equal to 3. Multiply these 2 counts, and that is the answer for part 1.

The second part looks very challenging to me at first because I thought some dynamic programming is needed. But there is a very simple approach. This time, we need to sort the entries from high to low, in other words, we are finding the valid connections in reverse. Then take each entry as a starting point, count how many different "children" it can have. For example, a list like `154 151 150 149 148` (notice the entries are in descending order). `154` has no possible children because it is the end of the list (but we will assign 1 to this entry as well, for numerical purpose). Therefore, `154` has "1" child. Next, for `151`, we can only have 1 child, which is `154`, so we will assign `1` to `151`. Smae for `150`.For `149`, there are 2 possible children, `150` or `151`, so we will assign `2` to `149`. Then we can construct a list like this

```
154 "1"
151 1
150 1
149 2
148 3
```

The first column is the original entry, the second column is the number of children the entry can have, except for the first entry, which we assign a fake child to it. To get the final answer, we need to get the total number of children for each entry. That is, the number of children acculumated. The algorithm is as follows:

Starting from the first entry,

1) If the number of children is 1, then the total number of children is equal to the number of children of the previous entry. Since the number of children for `150` is `1`, then the total number of children for `150` will be the same as the number of children of `151`, which is `1`. 

2) If the number of children is 2, then the total number of children is equal to the sum of the number of children of the previous 2 entries.

3) If the number of children is 3, then the total number of children is equal to the sum of the number of children of the previous 3 entries.

By using the above algorithm, the updated list will look like

```
154 "1"
151 1 = 1         (1)
150 1 = 1         (1)
149 2 = 1 + 1     (2)
148 4 = 2 + 1 + 1 (3)
```

So, the total number of ways of arranging the adaptors is 4, which is the total number of children of the **last entry**.

```
Time & Rank
00:17:21   5036
01:41:38   5192
```

## Day 11

Well, [today's puzzle](https://adventofcode.com/2020/day/11) is pretty interesting and straightforward to implement. It is a variation of [Game of Life](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life). After converting the input to a numerical array, the only tedius part is to consolidate the seating status of the adjacent 8 seats. For the second part, the seating status of the 4 diagonal directions are determined by a `while` loop. The `while` loop stops once it hits a non-floor seating status, otherwise the it will continue moving in a zigzag fashion. 

```
Time & Rank
00:46:38   4061
02:13:52   6147
```

## Day 12

For [Day 12 puzzle](https://adventofcode.com/2020/day/12), I almost hard-coded everything. Even though I believe there is a much more efficient implementation method, I chose the most intuitive (to me) way to solve it. 

First, I convert `E, W, S, N, L, R, F` to `1, 2, 3, 4, 5, 6, 7`. I find working with numbers is much easier than manipulating the actual direction. Second, the coordinates I used follows the convention of `East` and `North` as **positive** directions and `South` and `West` as **negative** directions. The rest is just to implement according to the puzzle specifications. Nothing exiciting about it.

```
Time & Rank
00:31:04   4334
00:53:49   3495
```

## Day 13

[Day 13 puzzle](https://adventofcode.com/2020/day/13) is by far the weirdest puzzle. For the first part, we just need to find the smallest remainder. For the second part, it is about [Chinese Remainder Theorem](https://en.wikipedia.org/wiki/Chinese_remainder_theorem). I thought it would involve Diophantine Equation, but eventually I spent 3 hours and couldn't get anything. All these coprime numbers did ring a bell but I did not even **think** about Chinese Remainder Theorem. Anyway, this puzzle is extremely simple for those who knows the math; but I do not know how challenging this puzzle would be for those who derives Chinese Remainder Theorem from scratch. 

The code for the second part is taken from here: [Chinese Remainder Theorem for integers (simple)](https://www.mathworks.com/matlabcentral/fileexchange/32649-chinese-remainder-theorem-for-integers-simple)

````
Time & Rank
00:08:24   1167
03:18:04   4685
````

## Day 14

[Today's puzzle](https://adventofcode.com/2020/day/14) is more striaghtforward to implement than yesterdays's puzzle. The implementations involve pattern parsing, binary-to-decimal/decimal-to-binary conversion, bit-wise comparison, and data-logging (with overwrite). The only tricky part for part 2 is to generate all possible combinations of '0's and '1's and insert them to replace 'X'. In MATLAB, finding all the combinations can be achieved in one line: `   all_combination = dec2bin(0:2^num_X - 1, num_X) - '0';` .

```
Time & Rank
00:37:51   3564
02:22:04   5273
```

## Day 15

[Day 15](https://adventofcode.com/2020/day/15) is about [Van Eck sequence](https://oeis.org/A181391). 

```
Time & Rank
00:19:39   2003
01:51:57   6112
```

## Day 16

[Day 16](https://adventofcode.com/2020/day/16) is a really interesting puzzle. I should have done the second part 1 hour earlier if I did not have a meeting half way. The second part is like a treasure hunt. I got my first correct answer using Excel manually (It is now incorporated to the MATLAB script). The algorithm for the second part is interesting but difficult to explain.

```
Time & Rank
00:22:26   2401
02:37:14   5116
```

## Day 17

[This puzzle](https://adventofcode.com/2020/day/17) took me 30 minutes to understand. This is also the first puzzle that I spent 1 hour just on the first part. The second part is done by some minor changes in dimension and trial and error (It is difficult to wrap my head around the 4-th dimension, so I have to use trial-and-error to ensure the dimensions match). The most interesting part of the puzzle is the realization of using convolution to compute the neighbors, what a brilliant idea (thanks to this [webpage](https://www.mathworks.com/matlabcentral/answers/402080-how-to-find-the-neighbors-of-each-element-in-a-matrix)).

```
Time & Rank
01:01:51   2749
03:19:00   5582
```

## Day 20

[This puzzle](https://adventofcode.com/2020/day/20) is fun but chanllenging to me. The tedious part is to code up all the possiblities of tile-matching (flipping, rotation). The nice part is that each edge of the tile at most can match with 1 edge of another tile (no 3 same edges). For the first part, we only need to care about 4 corners, so just look for tiles that have 2 unmatched edges. Simple to formulate the idea, tedious to code up the actual scripts.

The second part literally took me 4 hours to solve! At some point, I even thought about piecing everything together manually. But as soon as I realized all the tiles are rotated and flipped, it becomes time-consuming like hell to do it manually. In the end, I decided to piece together the first row, then fix the direction of the tiles of the first row along the way. Then, starting from each tile in the first row, piece together everything else column by column from top to bottom. Finding the sea monsters is actually the easiest part if using convolution. Define a convolution kernel which has a shape of the sea monster. Convolve with the entire image. The count the number of 15 (that is the number of # in a sea monster). The final answer is just total number of # minus off 15 times the number of sea monster.

I am so proud that I managed to do this question all by myself. Now that I think of it, maybe I can finish the second part manually in 4 hours as well (but it is definitely more error-prone and I might die of boredom along the way).

```
Time & Rank
01:20:05   1877
05:28:36   1605
```

## Day 21

The idea of [this puzzle](https://adventofcode.com/2020/day/21) is very simple, so the only thing to do is just to translate my thoughts into codes. After parsing everything, since there is a one-to-one mapping between ingredients and allergens, we can sift out all allergens by taking the intersection of all the foods, then form a unique list of allergens (Of course, the correspondence between English name and the "foreign" name maybe off, but we don't need that in the first part, and we can easily fix the correspondence for the second part).

For the first part, count the total number of ingredients and the total number of occurrences of allergens. The difference is the answer for part 1.

For part 2, the first time of this year that the answer is not numerical! Just fix the correspondence based on `allergen_dict`, then we can get the answer.

Today's puzzle is much simpler than yesterday's.

```
Time & Rank
01:15:58   2691 
01:22:31   2485
```

## Day 22

Well, I spent almost 3 hours on [part 2](https://adventofcode.com/2020/day/22) because I did not understand the infinite loop prevention rule correctly at the beginning. I thought the entire game stops if there is an infinite loop everywhere in the game, but actually only the sub-game stops. There are also 2 weird situations where I never thought those could actually happen. One is that without specifiying the appending direction, the default appending direction is by **columns**, instead of **rows**; the other one is regarding my way to check if there is an infinite loop, I thought the product of 2 players' scores would be a good way to keep track of all states, but apparently there are cases that $4 = 1\times4 = 2\times2$. Therefore, instead of direct product of the 2 raw scores, I first square the card values then calculate the scores. Anyway, this is yet another easy puzzle.

```
Time & Rank
00:10:16   1142
02:58:00   3916 (Hmm...)
```

## Day 24

Second last day of AoC this year. [This puzzle](https://adventofcode.com/2020/day/24) is relatively simple. The key idea is to track the center of each hexagon using a scaled and rotated plane coordiate system. I do not like my solution for the second part. It is highly unoptimized.

```
Time & Rank
01:52:22   3829
05:29:45   5535
```





