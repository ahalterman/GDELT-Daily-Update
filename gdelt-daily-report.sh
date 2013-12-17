#!/bin/bash
cd ~/GDELT/files
# make sure yesterday’s csv’s are gone.
rm *.CSV
rm *.csv
cd ~/GDELT
echo Downloading today’s file.
python download_daily.py fetch -d ~/GDELT/files -U
cd ~/GDELT/files
echo Cleaning up…
rm *.zip
mv *.CSV today.csv
echo Importing today.csv into SQLite database…
sqlite3 gdelt.db < daily-import.sql
# rm ~/GDELT/files/today.csv

# This does some diagnostics that get mailed to me.
Rscript ~/GDELT/r-test.R

echo Beginning R script…
# “filtered-report.Rnw” is the Sweave document of my report.
R CMD Sweave filtered-report.Rnw  
echo First XeLaTeX run…
xelatex filtered-report.tex
echo second XeLaTeX run…
xelatex filtered-report.tex
echo Report complete.

uuencode filtered-report.pdf Daily_Report.pdf | mail -s GDELT_Daily_Report <your.recipient@domain.com> -F”<SenderName>” -f”<sender@domain.com”
