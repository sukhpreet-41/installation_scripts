#!/bin/bash

# Check if the script is executed with the port number as an argument
if [ $# -ne 1 ]; then
  echo "Usage: $0 <port>"
  exit 1
fi

# Get the port number from the command line argument
port=$1

# Check if the specified port is in use
process_id=$(lsof -t -i :$port)
if [ -z "$process_id" ]; then
  echo "Port $port is not in use."
  exit 0
fi

# Terminate the process using the specified port
echo "Terminating the process using port $port (PID: $process_id)..."
kill $process_id

echo "Port $port has been released."
