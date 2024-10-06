## Assembly Workout Generator

### This program can create randomized workouts or perform health calculations. 

The files included are in Assembly Language and C++ and link together to complete the package. 

The program receives user input through the C++ side, categorizes the input, and calls functions in assembly to do the majority of the work. 

### This program is capable of:
- Calculating BMI if given height in feet and inches, weight in pounds, and age
- Calculating base calories if given height in feet and inches, weight in pounds, age, and gender
- Creating 16 different randomized 4-movement workout plans for the chest, quads, hamstrings, and back

## Implementation
As mentioned, the user input is collected through the C++ side, the program then proceeds through one of two options. 
#### Option 1:
The workout generator is selected and the specific muscle group is collected along with a randomly generated int. These two parameters are passed to the main `movement` function. 
