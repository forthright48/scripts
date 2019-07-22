#!/bin/bash

# A script to kill any process that is using a certain port number

if [ $# -eq 0 ]; then
  echo "Must enter a port number"
  exit
fi

port=$1;

job=$(lsof -t -i :$port);

if [ "$job" != "" ]; then
	kill $job;	
	echo "$port was busy by $job. It was killed";
else
	echo "The port is already free";		
fi

