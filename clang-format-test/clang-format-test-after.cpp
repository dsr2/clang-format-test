#include <vector>
#include <iostream>
using namespace std;

#define MY_PRINT_MACRO(x)  \
   cout << "macro";        \
   cout << "print: " << x; \
   cout << "macro end";

void function1(void)
{
   std::cout << "Hello\n";
}

class tcClass1
{
 public:
   tcClass1(int i){};
   tcClass1(int aaaaaaaaaaaaaa, int bbbbbbbbbbbbbb) :
      n(0)
   {
      m = i;
   };
   tcClass1(int aaaaaaaaaaaaaa, int bbbbbbbbbbbbbb, int ccccccccccccccc);
   ~tcClass1() = default;

 protected:
   void FuncWithAShortName(
      int aaaaaaaaaaaaaaaaaaaaaaa, int bbbbbbbbbbbbbbbbbbbbbb, int ccccccccc);
   void FuncWithALongName_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx(
      int aaaaaaaaaaaaaaaaaaaaaaa, int bbbbbbbbbbbbbbbbbbbbbb, int ccccccccc);

   int m;
   int n;
   int jjjjjjjjjjjjjjjjj = 0;
   int kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk = 0;
   int zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz = 1;
};

// TODO :
tcClass1::tcClass1(int aaaaaaaaaaaaaa, int bbbbbbbbbbbbbb) :
   m(0),
   n(0),
   jjjjjjjjjjjjjjjjj(1)
{
}

tcClass1::tcClass1(
   int aaaaaaaaaaaaaa, int bbbbbbbbbbbbbb, int ccccccccccccccc) :
   m(0),
   n(0),
   jjjjjjjjjjjjjjjjj(1),
   kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk(0),
   zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz(0)
{
}

void tcClass1::FuncWithAShortName(
   int aaaaaaaaaaaaaaaaaaaaaaa, int bbbbbbbbbbbbbbbbbbbbbb, int ccccccccc)
{
}

void tcClass1::
   FuncWithALongName_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx(
      int aaaaaaaaaaaaaaaaaaaaaaa, int bbbbbbbbbbbbbbbbbbbbbb, int ccccccccc)
{
}

template<typename T>
class tcTemplateClass
{
 public:
   template<typename U>
   tcTemplateClass(U u)
   {
   }
   ~tcTemplateClass() = default;
};

class tcDerived : public tcClass1, public tcTemplateClass<int>
{
};

class tcDerived2 :
   public tcClass1,
   public tcTemplateClass<int>,
   public tcTemplateClass<float>
{
};

int main(int argc, char** argv)
{
   function1();
   cout << "Hello world";

   float f = 1.000000000001 + 1.000000000001 + 1.000000000001 + 1.000000000001 +
      1.000000000001 + 1.000000000001 + 1.000000000001 + 1.000000000001;

   int i = 0;

   switch (i)
   {
   case 0:
      cout << "case 0\n";
      break;
   case 1:
   {
      cout << "case 1\n";
      break;
   }
   default:
      cout << "default\n";
      break;
   }

   if (i == 1)
   {
      cout << "i == 1\n";
   }

   struct tsStruct
   {
      int a;
      int b;
   };

   std::vector<tsStruct> lcVec;

   lcVec.sort(
      [](const tsStruct& arsLhs, const tsStruct& arsRhs) {
         return (arsLhs.a != arsRhs.a) ? arsLhs.a < arsRhs.a :
                                         arsLhs.b < arsRhs.b;
      });

   return 0;
}
