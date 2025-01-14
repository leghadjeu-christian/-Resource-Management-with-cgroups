#!/bin/bash
count=1
  while [ count -ne 7 ]; do
        docker stats --no-stream  | cat  >> stats.log 
((count ++))   
    sleep 1
    done
