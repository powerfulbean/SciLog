/**********************************/

#include<iostream>
#include "CSciLog.h"


using namespace std;

int printHello()
{
cout<<"hello"<<endl;
}

CSciLog::CSciLog(string s)
{
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

/*
int main()
{
  fstream a;
  //a.open(".//testLog1.txt", std::fstream::in | std::fstream::out | std::fstream::app);
  CSciLog oLog(".//testLog.log");
  oLog.recordTime();
}*/
 
