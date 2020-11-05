#!/bin/sh

rm ~/.local/share/calcurse/apts ~/.local/share/calcurse/calendar.ics
wget https://outlook.live.com/owa/calendar/00000000-0000-0000-0000-000000000000/cc074791-7026-421e-acbd-1aa8a3926886/cid-C98ADDBC195CCACF/calendar.ics -P ~/.local/share/calcurse/ 
calcurse -i ~/.local/share/calcurse/calendar.ics

rm ~/.local/share/calcurse/england
wget https://www.officeholidays.com/ics-clean/united-kingdom/england -P ~/.local/share/calcurse/
calcurse -i ~/.local/share/calcurse/england

rm ~/.local/share/calcurse/calendar.ics
wget https://outlook.office365.com/owa/calendar/a0d1a02b136a421090da41fe3e9d46bb@ou.ac.uk/619ccd26df884da6b51249624ed9ab0e6825917681823995434/calendar.ics -P ~/.local/share/calcurse/ 
calcurse -i ~/.local/share/calcurse/calendar.ics

notify-send "Calcure has been updated!"
date >> ~/.local/share/calcurse/update.txt
