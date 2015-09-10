<strong>Starting up an Interactive Session</strong>
<p>To run Gaussian, you will need to start up an interactive session via SLURM</p>
> srun --pty -N 1 --exclusive -p defq /bin/bash

<strong>Load the Gaussian Module for c3ddb</strong>
<p>You will need to add the gaussian module each time you login to c3ddb</p>
> module add c3ddb/gaussian

<strong>Setting up working directories for Gaussian with c3ddb</strong>

<p>First you will need to create and move to a working directory for your gaussian files.</p>

>mkdir /home/$USER/workingdirectoryname &&  cd  /home/$USER/workingdirectoryname 

<p>You will then need to create another directory inside of your working directory called amd64</p>
>mkdir amd64

<p>Create a link to the com folder in the c3ddb gaussian directory </p>
>ln -s $g09root/g09/tests/com .


<strong>Running a test job with gaussian</strong>


<p>It is strongly reccomended to make a new directory before running tests </p>

<p>The variable PGI_TERM needs to be unset or else it will cause script errors</p>
>unset PGI_TERM

<p>If you want to run the default set of Gaussian provided test jobs then you can simply use submit.csh to run the number of tests desired, where X is the first test and Y is the last one. The tests will run sequentially and deposit the .log files into your amd64 directory.</p>
>$g09root/g09/tests/submit.csh X Y

<strong>Testing .com files</strong>
<p>The examples in this guide will use the hexclethane.com file, you can copy and paste the code below into a file and save it as hexclethane.com to run the examples if desired.</p>

<strong>hexclethane.com</strong>
    
<pre><code> 
# HF/MP2 6-31g opt

Ethane

0   1                        
C1                      
C2   C1   RCC
Cl3   C1   RCH   C2   ACCH
Cl4   C1   RCH   C2   ACCH   Cl3   T1
Cl5   C1   RCH   C2   ACCH   Cl3   T2
Cl6   C2   RCH   C1   ACCH   Cl3   T3
Cl7   C2   RCH   C1   ACCH   Cl6   T4
Cl8   C2   RCH   C1   ACCH   Cl6   T5

RCH = 1.6
RCC = 1.2
ACCH = 115.2
T1 = 125.0
T2 = -125.0
T3 = 185.0
T4 = 125.0
T5 = -125.0

</code></pre>


<p>If you would rather run your own .com test then you will need to copy the .com file of your choice into your working directory, for this example we use the hexclethane.com file.</p>

>cp /pathto.comfile/hexclethane.com /home/$USER/workingdirectoryname




<p>Run your .com job file and create a log file in the amd64 directory</p>
>g09 < hexclethane.com > /home/$USER/workingdirectory/amd64/hexclethane.log

<p>Copy the log folder from your amd64 folder into your working directory</p>

>cp /home/$USER/nameofyourworkingdirectory/amd64/hexclethane.log /home/$USER/workingdirectoryname

<p>The d1 command will diff the files from X to Y and filter out the insignificant differences from the output files.</p>
>$g09root/g09/tests/d1 X Y
