KAVG stands for the average value of the core. These are statistics used in the esxtop team, which gives an idea of the system performance in real time. KAVG measures the average time in milliseconds that a command spends in the kernel from the moment it is issued to the moment of completion.
High KAVG values may indicate a problem. For example, if KAVG is constantly high, it may mean that there are a lot of I/O operations in the queue waiting for the kernel, which may slow down your system. This can be caused by a number of reasons, such as a loaded system, a slow storage device, or an incorrectly configured system.

Procedure of actions:

1. Run the script find.sh to get the output of the available parameters (Physical Disk SCSI Device is installed by default). However, you can change this, in the file output.txt the remaining parameters will be found

2. Create a .env file and add the necessary ESXI_NAME and LUNE_ID parameters there

3. Run the script convert.sh to get KAVG
