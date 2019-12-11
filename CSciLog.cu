/**********************************/

#include "CSciLog.h"


int printHello()
{
cout<<"hello"<<endl;
}

CSciLog::CSciLog(string s)
{
 //m_timeStart = clock();
 timeval temp;
 gettimeofday(pm_timeStart, NULL);
 //m_timeStart = temp;
 m_dir = s + ".log";
 m_file.open(m_dir.data(),std::fstream::in | std::fstream::out | std::fstream::app);
 m_file.close();
}

void CSciLog::open()
{
  m_file.open(m_dir.data(),std::fstream::in | std::fstream::out | std::fstream::app);
}	

void CSciLog::close()
{
  m_file.close();
}

void CSciLog::record(string s, bool nextLine)
{
  open();
  m_file<<s;
  if(nextLine == true)
  {
        m_file<<endl;
  }
  else
  {
  	m_file<<"\t";
  }
  close();
  return ;
}

void CSciLog::recordTime(string s, bool nextLine)
{
  open();
  clock_t time = clock();
  double dTime = (double)time/CLOCKS_PER_SEC;
  m_file<<dTime;
  if(s.size()!=0)
  {
    m_file<<"\t";
    m_file<<s;
  }
  if(nextLine == true)
  {
	m_file<<endl;
  }
  else
  {
  	m_file<<"\t";
  }
  close();
  return ;
}

void CSciLog::recordTimeReadable(string s, bool nextLine)
{
  open();
  clock_t time = clock();
  double dTime = (double)time/CLOCKS_PER_SEC;
  m_file<<"Time "<<dTime<<": ";
  m_file<<s;
  if(nextLine == true)
  {
	m_file<<endl;
  }
  else
  {
  	m_file<<"\t";
  }
  close();
  return ;
}

void CSciLog::recordTimeFast(string s, bool nextLine, bool readable)
{
  //open();
  //clock_t time = clock();
  //double dTime = (double)time/CLOCKS_PER_SEC;
  string temp;
  if(readable == false){
	temp = getTimePassedString();
  }
  else{
	  temp = "Time "+getTimePassedString()+": ";
	  temp+=s;
	  temp+=";";
  }
  if(nextLine == true)
  {
	temp += "\n";
  }
  else
  {
  	temp += "\t";
  }
  m_cache.push_back(temp);
  return ;
}

void CSciLog::recordTimeReadableFast(string s, bool nextLine)
{
  
  /*clock_t timeSS = clock();
  double dTime = (double)timeSS/(double)CLOCKS_PER_SEC;
  char timeS[50];
  //time_t tTest;
  //time(&tTest);
  //double time_taken = double(timeSS)/double(CLOCKS_PER_SEC);
  //cout<<dTime<<setprecision(5)<<" ";
  timeval curTime;
  gettimeofday(&curTime, NULL);
  timeval resTime;
  timersub(&curTime,pm_timeStart,&resTime);
  char currentTime[84] = "";
  int sec = resTime.tv_sec;
  int usec = resTime.tv_usec;
  sprintf(currentTime, "%d\.%d", sec,usec);
  //printf("current time: %s \n", currentTime);
  //sprintf(timeS,"%f", dTime); */
  
  string temp = "Time "+getTimePassedString()+": ";
  temp+=s;
  temp+=";";
  if(nextLine == true)
  {
	temp += "\n";
  }
  else
  {
  	temp += "\t";
  }
  m_cache.push_back(temp);
  return ;
}


void CSciLog::save()
{
	open();
	for (int i=0;i<m_cache.size();i++)
	{
		m_file<<m_cache[i];
	}
	m_cache.clear();
	close();	
}


string CSciLog::getTimePassedString()
{
  timeval curTime;
  gettimeofday(&curTime, NULL);
  timeval resTime;
  timersub(&curTime,pm_timeStart,&resTime);
  char currentTime[84] = "";
  int sec = resTime.tv_sec;
  int usec = resTime.tv_usec;
  double finalAns = double(sec) + (1.0*usec)/double(1000000);
  //if(usec==99999)
  //{
//	  printf("%.6f %.6f %.6f\n",double(sec),(1.0*usec)/double(1000000),finalAns);
 // }
  sprintf(currentTime, "%.6f", finalAns);
  return std::string(currentTime);
}
/*
int main()
{
  fstream a;
  //a.open(".//testLog1.txt", std::fstream::in | std::fstream::out | std::fstream::app);
  CSciLog oLog(".//testLog.log");
  oLog.recordTime();
}*/
 
