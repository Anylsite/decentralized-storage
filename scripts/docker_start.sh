#! /bin/bash
repo="$IPFS_PATH"

if [ -e "$repo/config" ]; then
  echo "Found IPFS repo at $repo"
else
  ipfs init

  ipfs config Addresses.Gateway /ip4/0.0.0.0/tcp/8080
  ipfs config Addresses.API /ip4/0.0.0.0/tcp/5001
  
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Origin '["*"]'
  ipfs config --json API.HTTPHeaders.Access-Control-Allow-Methods '["PUT", "GET", "POST"]'
fi

ipfs daemon
