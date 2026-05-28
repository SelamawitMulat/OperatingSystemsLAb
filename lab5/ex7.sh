#!/bin/bash
echo "CPU INFORMATION"
cpumodel=$(lscpu | grep "Model name")
cpucores=$(nproc)

echo "$cpumodel"
echo "Cores : $cpucores"
echo "BYE"
