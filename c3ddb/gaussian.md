The following guides were created based on the tutorial found here:
>www.uio.no/english/services/it/research/hpc/abel/help/software/Gaussian.htmlt



#Running Gaussian from a batch script

Load the Gaussian Module for c3ddb
You will need to add the gaussian module each time you login to c3ddb
> module add c3ddb/gaussian


It is strongly reccomended to make a new directory before running tests 

>mkdir /home/$USER/gaussianwork && cd  home/$USER/gaussianwork

The variable PGI_TERM needs to be unset or else it will cause script errors</p>
>unset PGI_TERM

The example in this guide will use the hexclethane.com file, you can copy and paste the code below into a file and save it as hexclethane.com to run the examples if desired.

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

<p> You can automate this process to an extent by creating a simple script similar to the one below.</p>

<pre><code>

#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --job-name=myHexclethane
#SBATCH --time=0:02:0
#SBATCH --mem-per-cpu=1G
#SBATCH --partition defq


g09 < hexclethane.com | tee /home/$USER/gaussianwork/hexclethane.log

</code></pre>

<p> This simple script when filled out with the appropriate user data will run your com file and place a copy of the log file into a directory of your choice. </p>




#Running Gaussian in an interactive session 
To run Gaussian, you will need to start up an interactive session via SLURM
> srun --pty -N 1 --exclusive -p defq /bin/bash


Load the Gaussian Module for c3ddb
You will need to add the gaussian module each time you login to c3ddb
> module add c3ddb/gaussian


It is strongly reccomended to make a new directory before running tests 

>mkdir /home/$USER/gaussianwork && cd  /home/$USER/gaussianwork

The variable PGI_TERM needs to be unset or else it will cause script errors
>unset PGI_TERM


The examples in this guide will use the hexclethane.com file, you can copy and paste the code below into a file and save it as hexclethane.com to run the examples if desired.</p>

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

Run your .com job file and produce a log file


>g09 < hexclethane.com | tee /home/$USER/gaussianwork/hexclethane.log
