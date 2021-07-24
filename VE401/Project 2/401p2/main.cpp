#include <iostream>
#include <fstream>
#include <string>
#include<sstream>
#include<cmath>
const int TOTALDAY = 1826;
using namespace std;

int main() {
	ifstream iFile;
	iFile.open("source.txt");
	int num[TOTALDAY];
	for (int i = 0; i < TOTALDAY; i++)num[i] = 0;
	for (int i = 0; i < 940; i++) {
		int data_t;
		iFile >> data_t;
		iFile >> num[data_t - 1];
	}
	int weekday[7];
	int weekdayNum[7];
	for (int i = 0; i < 7; i++) { weekday[i] = 0; weekdayNum[i] = 0; }
	for (int i = 0; i < 1826; i++) { weekday[i % 7] += num[i]; weekdayNum[i % 7]++; }
	int week[260];
	for (int i = 0; i < 260; i++)week[i] = 0;
	for (int i = 5; i < 1825; i++) { week[i / 7] += num[i]; }
	const int MAX = 19;
	int weekNum[MAX];
	for (int i = 0; i < MAX; i++)weekNum[i] = 0;
	for (int i = 0; i < 260; i++)weekNum[week[i]] += 1;

	double mu1 = 0, mu2 = 0;
	for (int i = 0; i < TOTALDAY; i++) {
		if (i % 7 == 4 || i % 7 == 5) mu2 += num[i];
		else mu1 += num[i];
	}
	mu1 = mu1 / 1304;
	mu2 = mu2 / 522;
	double var1 = 0, var2 = 0;
	for (int i = 0; i < 1826; i++) {
		if (i % 7 == 4 || i % 7 == 5) var2 += pow((num[i] - mu2), 2);
		else var1 += pow((num[i] - mu1), 2);
	}
	var1 = sqrt(var1 / 1303);
	var2 = sqrt(var2 / 521);
	double yearWeek[5] = { 0,0,0,0,0 };
	double VaryearWeek[5] = {0,0,0,0,0};
	for (int j = 0; j < 5; j++) {
		for (int i = 52 * j; i < 52 * (j+1); i++) { yearWeek[j] += week[i]; }
		yearWeek[j] = yearWeek[j] / 52;
		for (int i = 52 * j; i < 52 * (j+1); i++) { VaryearWeek[j] += pow((week[i] - yearWeek[j]), 2); }
		VaryearWeek[j] = sqrt(VaryearWeek[j] / 51);
	}

	double weekAve = 0;
	cout << "[";
	for (int i = 0; i < 260; i++) { cout << week[i] << " "; weekAve += week[i]; }
	cout << "]\n";

	cout << "[";
	for (int i = 0; i < 260; i++) { cout << i << " "; }
	cout << "]\n";

	for (int i = 0; i < 260; i++) {
		for (int j = 0; j < 259; j++) {
			if (week[j] > week[j + 1]) {
				int temp = week[j + 1];
				week[j + 1] = week[j];
				week[j] = temp;
			}
		}
	}


	weekAve = weekAve / 260;
	double weekVar = 0;
	for (int i = 0; i < 260; i++) { weekVar += pow((num[i] - weekAve), 2); }
	weekVar = sqrt(weekVar / 259);
	int year[5] = { 0,0,0,0,0 };
	for (int i = 0; i < TOTALDAY; i++) {
		if (i < 365 * 3)year[i / 365] += num[i];
		else if (i < 365 * 4 + 1)year[3] += num[i];
		else year[4] += num[i];
	}

	return 0;
}