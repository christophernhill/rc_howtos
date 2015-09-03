<strong>Starting up an Interactive Session</strong>
<p>To run Gaussian, you will need to start up an interactive session via SLURM</p>
> srun --pty -N 1 --exclusive -p defq /bin/bash

<strong>Load the Gaussian Module for c3ddb</strong>
<p>You will need to add the gaussian module each time you login to c3ddb</p>
> module add c3ddb/gaussian

<strong>Setting up working directories for Gaussian with c3ddb</strong>

<p>First you will need to create and move to a working directory for your gaussian files.</p>

>mkdir /home/$USER/nameofyourdirectoryhere

>cd /home/$USER/nameofyourdirectoryhere

<p>You will then need to create another directory inside of your working directory called amd64</p>
>mkdir amd64

<p>Create a link to the com folder in the c3ddb  gaussian directory </p>
>ln -s $g09root/g09/tests/com .


<strong>Running a test job with gaussian</strong>


<p>It is strongly reccomended to make a new directory before running tests </p>

><p>The variable PGI_TERM needs to be unset or else it will cause script errors</p>
>>unset PGI_TERM

><p>If you want to run the default set of Gaussian provided test jobs then you can simply use submit.csh to run the number of tests desired, where X is the first test and Y is the last one. The tests will run sequentially and deposit the .log files into your amd64 directory.</p>
>>$g09root/g09/tests/submit.csh X Y

><p>If you would rather run your own .com test then you will need to copy the .com file of your choice into your working directory, for this example we use the hexclethane.com file.</p>


>>cp /pathtoyour.comfile/hexclethane.com /home/$USER/nameofyourworkingdirectory




><p>Run your .com job file and create a .log file in your amd64 folder</p>
>>g09 < hexclethane.com > /home/$USER/nameofyourworkingdirectory/amd64/hexclethane.log

><p>Copy the log folder from your amd64 folder into your working directory</p>

>>cp /home/$USER/nameofyourworkingdirectory/amd64/test0000.log /home/$USER/gaussian

><p>The d1 command will diff the files from X to Y and filter out the insignificant differences from the output files.</p>
>>$g09root/g09/tests/d1 X Y
