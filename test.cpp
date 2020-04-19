#include <bits/stdc++.h>

using namespace std;

int main()
{
	ofstream out("inin.txt");
	out << "10000 10000\n";
	for(int i=1;i<=10000;i++)
		out << i << " ";
	out.close();

	return 0;
}
