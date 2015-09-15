#Getting Started 

The following guides were created based on the tutorial found here:
>www.uio.no/english/services/it/research/hpc/abel/help/software/Gaussian.html


It is strongly reccomended to make a new directory before running tests 

>mkdir /home/$USER/gaussianwork && cd  /home/$USER/gaussianwork

The examples in this guide will use the hexclethane.com file. You can either:

* Right click the 'hexclethane.com' link below and click 'Save Link As'

* Copy and paste the information into a blank file and name it hexclethane.com

[click here to download hexclethane.com](Using-Gaussian/hexclethane.com)


    
<pre>
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

</pre>


#

#Running Gaussian in an interactive session 

To run Gaussian, you will need to start up an interactive session via SLURM
> srun --pty -N 1 --exclusive -p defq /bin/bash


Load the Gaussian Module for c3ddb
You will need to add the gaussian module each time you login to c3ddb
> module add c3ddb/gaussian

The variable PGI_TERM needs to be unset or else it will cause script errors
>unset PGI_TERM


The example in this guide will use the hexclethane.com file shown above.

Run your .com job file and produce a log file


>g09 < hexclethane.com | tee /home/$USER/gaussianwork/hexclethane.log

#Running Gaussian from a batch script

<p>If you would rather run your own .com test then you will need to copy the .com file of your choice into your working directory, for this example we use the hexclethane.com file.</p>

<p> To automate this process you can use a simple script like the one shown below by either:</p>
* Downloading the script by right clicking the 'gaussiantest.sh' link and clicking 'Save Link As'
* Creating your own script by copying the script below and adjusting the relevant data.


[click here to download gaussiantest.sh](Using-Gaussian/gaussiantest.sh)
<pre>

#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --job-name=myHexclethane
#SBATCH --time=0:50:0
#SBATCH --mem-per-cpu=1G
#SBATCH --partition defq


module add c3ddb/gaussian
unset PGI_TERM
g09 &lt; hexclethane.com | tee /home/$USER/gaussianwork/hexclethane.log

</pre>

<p> This simple script when filled out with the appropriate user data will run your com file and place a copy of the log file into a directory of your choice simply by using the sbatch command followed by your scripts name. </p>
>sbatch gaussiantest.sh






##Here is a good reference for running Gaussian tests:
>http://www.gaussian.com/g_tech/g_ur/m_testjobs.htm