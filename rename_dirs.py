from __future__ import print_function
import os, sys, codecs, csv

with open('../0/Dictionary_py.csv', mode='r') as infile:
    reader = csv.reader(infile)
    for rows in reader:
        k = rows[0]
        v = rows[1]
        mydict = {k:v for k, v in reader}
        print(mydict)

with open('../0/year', 'r') as f:
    v = f.read()

x1=''
with open('../0/msg_'+str(v).rstrip()+'.txt'):
    for line in f:
        try:
            a=str(line).rstrip()
            x=a[:a.find("/")]
            if x!=x1:
                print('Remaining' + x + ' with ' + str(mydict[str(x)]))
                os.rename(str(x),str(mydict[str(x)]))
            x1=str(x)
            else:
                pass
            except:
                pass