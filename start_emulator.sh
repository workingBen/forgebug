#!/bin/bash

if [[ `ps -ax | grep froyo | grep emulator-arm` == "" ]]; then 
  emulator -avd froyo -scale 0.7 &
else
  false
fi;
