#!/bin/sh

command -v nvidia-smi > /dev/null && nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits

