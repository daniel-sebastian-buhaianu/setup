#include <fstream>
using namespace std;
int main()
{
  ifstream f("FILENAME.in");
  f.close();
  ofstream g("FILENAME.out");
  g.close();
  return 0;
}
