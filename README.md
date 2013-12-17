GDELT-Daily-Update
==================

Code for automated GDLET updating and report generation.

This is a hacked together system for automated daily GDELT report generation built on Unix, Python, SQL, R, and LaTeX. It's highly customized to my GDELT setup but the basic flow of it should transfer to almost any system.

Once the program is up and running, it will do five things:
1. Wake up the computer.

2. Download today’s GDELT data from the webpage.

3. Load it into a database.

4. Run the report script

5. Create the complete document

Setup
----------------
1. Create a folder in your home directory called "GDELT" with a folder inside called "files". 
Inside the GDELT folder put Sweave.sty, gdelt-daily-report.sh, crontab.txt, and r-test.R.
2. Schedule a daily wakeup for your computer. Go to System Preferences > Schedule (lower right). I set mine for 6 am and affixed a sticky to it reminding me to leave the computer open at night.
3. Schedule a shell script to run after your computer wakes up. This shell script will hold all of the other commands for the report generation. 

You can schedule your report using Mac OS X's built-in job scheduler, called `crontab`. Download and modify the `crontab.txt` file to include your email address. The two numbers and 3 asterisks at the beginning are to set the time your job runs. The file says that at 5 minutes after 6 am, every day, run the script called `gdelt-daily-report.sh` and mail the log to the given address.

To schedule the job, go to the command line and type:
```
crontab ~/GDELT/crontab.txt 
```






If you ever want to turn off your daily updates, go to the command line and type `crontab -r ` to clear all scheduled jobs.
