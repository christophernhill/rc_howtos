#include <stdio.h>

void main()

{
   freopen("output.txt","w",stdout);  
   long fib1 = 999999, fib2 = 1, fib3, limit, count = 0;
      limit = 999999992;
   printf("%d\n", fib1);
   count = 2;
   while (count < limit)
   {
 
      fib3 = fib1 + fib2;
      count++;
      printf("%d\n", fib3);
      fib1 = fib2;
      fib2 = fib3;
   }
}
