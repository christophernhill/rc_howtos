#!/usr/bin/env python
import datetime
import time
import socket 

test_time = open('test.time', 'w')
test_time.write('today is\n')
test_time.close()
number = 0
for i in range(900):
   test_time = open('test.time', 'a')
   today = time.strftime("%c")
   number += 1
   time.sleep(1)
   hostname = socket.gethostname()
#today = datetime.date.today()
#print today, type(today)  # 2008-03-09 <type 'datetime.date'>
   print today, hostname   # 2008-03-09 <type 'datetime.date'>
# convert <type 'datetime.date'> to a string first
# since write() expects a string
   test_time.flush()
   test_time.write(str(today))
   test_time.write('\t')
   test_time.write(str(number))
   test_time.write('\t')
   test_time.write(str(hostname))
   test_time.write('\n')
   test_time.close()
# test the file's contents
for line in file('test.time'):
     print line,
