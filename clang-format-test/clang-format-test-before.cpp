#include <iostream>
using namespace std;

void function1(void) { std::cout << "Hello\n"; }

class tcClass1
{
  public:
  tcClass1(int i) {};
  ~tcClass1() = default;

protected:
	void Func(){};
};

int main(int argc, char **argv) {
  function1();
  cout << "Hello world";

		int i = 0;

	switch (i) {
	case 0:
		cout << "case 0\n";
	   break;
	default:
		cout << "default\n";
		break;
	}

  if (i == 1) {
    cout << "i == 1\n"; }

       return 0;
}
