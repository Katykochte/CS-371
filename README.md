
![Workout Logo 2](https://github.com/user-attachments/assets/4bb803e3-b3e9-489f-a7f6-c77443cc9e0c)
## Assembly Workout Generator and Health Value Calculator


This program can create randomized workouts or perform health calculations. The files included are in Assembly Language and C++ and link together to complete the package. The program receives user input through the C++ side, categorizes the input, and calls functions in assembly to do the majority of the work. 

### This program is capable of:
- Calculating BMI if given height in feet and inches, weight in pounds, and age
- Calculating base calories if given height in feet and inches, weight in pounds, age, and gender
- Creating 16 different randomized 4-movement workout plans for the chest, quads, hamstrings, and back

## Implementation
The user input is collected through the C++ side in `main`, the program then proceeds through one of two options. 
#### Option 1:
The workout generator is selected and the specific muscle group is collected along with a randomly generated int. These two parameters are passed to the `movements` function in the .asm file which will then compare the parameters and jump to the corresponding muscle's function. Inside there four movements will be chosen, each with two possible variations. The random number will be bit-shifted in `random` and come out either positive or negative, and that will decide which of the two variants is printed. The movement then is printed with repetitions of 12, 9, and 6. This repeats four times to complete the full workout program. A diagram of the process can be seen [here](https://www.canva.com/design/DAGSv6Jukqo/RjeSRpXwNcB8ErjT3idy3A/view?utm_content=DAGSv6Jukqo&utm_campaign=designshare&utm_medium=link&utm_source=editor).
#### Option 2:
The health calculator is selected. This calculator can compute basal metabolic calorie intake and body mass index. The multiple personal values needed are collected in `main` and then passed into either the `calbmi` or `calorie` functions located in the .asm file. Inside there all the calculations are performed with stored variables and the function parameters, the answer is then stored and returned back to be printed in C++. 
