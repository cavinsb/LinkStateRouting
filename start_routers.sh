#!/bin/bash

echo starting A...
./routed_LS A A-log.txt initialization.txt &
sleep 1
echo starting B...
./routed_LS B B-log.txt initialization.txt &
sleep 1
echo starting C...
./routed_LS C C-log.txt initialization.txt &
sleep 1
echo starting D...
./routed_LS D D-log.txt initialization.txt &
sleep 1
echo starting E...
./routed_LS E E-log.txt initialization.txt &
sleep 1
echo starting F...
./routed_LS F F-log.txt initialization.txt &