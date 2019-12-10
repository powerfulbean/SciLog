#include <iostream>
#include <sys/time.h>
#include <time.h>
#include<fstream>
#include<vector>
#include<string>

using namespace std;
int printHello();


class CSciLog
{
public:
/* member variable */
	string m_dir;
	fstream m_file;
	vector<string> m_cache;
	//clock_t m_timeStart;
	timeval* pm_timeStart = new timeval;



/* meber function */
	CSciLog(string s);
	void open();
	void save();
	void close();
	void record(string s, bool nextLine = true);
	void recordTime(string s = "", bool nextLine = true);
	void recordTimeReadable(string s = "", bool nextLine = true);
	void recordTimeFast(string s = "", bool nextLine = true,bool readable = false);
	void recordTimeReadableFast(string s = "", bool nextLine = true);
	string getTimePassedString();
};	
