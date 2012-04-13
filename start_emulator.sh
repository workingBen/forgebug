#!/bin/bash

if [ `ps -ax | grep froyo | grep emulator-arm` ] 
then
  return false
else
  emulator -avd froyo -scale 0.7 &
fi;
