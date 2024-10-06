// Katy Kochte
// 11/2/23
// Links with Workout_asm
// An assembly & C++ program that creates a workout for the day, as well as computes BMI and calorie intake
// Most of the program is done in assembly for practice with machine code

#include <iostream>

using std::cout;
using std::cin;
using std::string;

extern "C" double calorie(double w, double f, double i, double a, int g);
extern "C" int calbmi(double w, double f, double i); 
extern "C" void movements(long x, int y);

// Above section is any assembly functions

int main() {
	cout<<"Planner or Calculator?\n"; //Check if planner or calculator
	string ans;
	cin>>ans;
	srand(time(0));
	int ran = rand(); //Get a randomly generated int to use
	if (ans=="Planner") { 
		cout<<"Enter a split: Chest, Back, Quad or Hamstring\n";
		string ans;
		cin>>ans;
		if (ans=="Chest") {
			movements(4, ran);
		} else if (ans=="Back") {
			movements(3, ran);
		} else if (ans=="Quad") {
			movements(2, ran);
		} else if (ans=="Hamstring") {
			movements(1, ran);
		} else {
			cout<<"Unknown split\n"; 
		} //Determine movement and send right input to assembly
	} else if (ans=="Calculator") {
		cout<<"Enter weight (in lbs) and height (space between ft and in) and age (in years)\n";
		double w, f, i, a;
		cin>>w>>f>>i>>a;
		if (w>=1 && f>=1 && i>=1 && a>=1) {
			cout<<"BMI or Calories?\n"; //Send to right calculation function
			string calc;
			cin>>calc;
			if (calc == "BMI") {
				double bmi = calbmi(w, f, i);
				cout<<"Your BMI is: "<<bmi<<"\n";
			} else if (calc == "Calories") {
				cout <<"What is your gender? Enter 1 for woman and 2 for man\n";
				int g;
				cin>>g;
				if (g<= 2 && g>=1) {
					double cals = calorie(w, f, i, a, g);
					cout<<"Your base calories are: "<<cals<<"\n";
					cout<<"Would you like maintenance calories? (Yes or No)\n";
					string ans2;
					cin>>ans2;
					if (ans2=="Yes") {
						cout<<"How active are you on a scale of 1-4? (1 being sedimentary, 4 being extremely active)\n";
						char e;
						cin>>e;
						if (e=='1') {
							double maintain = cals*1.2;
							cout<<"Your maintenance is "<<maintain<<"\n";
						} else if (e=='2') {
							double maintain = cals*1.375;
							cout<<"Your maintenance is "<<maintain<<"\n";
						} else if (e=='3') {
							double maintain = cals*1.55;
							cout<<"Your maintenance is "<<maintain<<"\n";
						} else if (e=='4') {
							double maintain = cals*1.725;
							cout<<"Your maintenance is "<<maintain<<"\n";
						} else {
							cout<<"Unknown input\n";
						}
					} else if (ans2=="No") {
						cout<<"Answer understood\n";
					} else {
						cout<<"Unknown action\n";
					} 
				} else {
					cout<<"Bad input, must be 1 or 2\n";
				}
				} else {
					cout<<"Unknown calculation\n";
			}
		} else {
			cout<<"Inputs cannot be negative or zero\n";
		}
	}
		else {
			cout<<"Unknown action\n";
	}
	return 0;
}
