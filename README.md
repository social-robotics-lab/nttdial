
# Install

## NVIDIA Driver for Cuda on WSL
Download and install: https://developer.nvidia.com/cuda/wsl/download

## Docker build anr run
```
docker build -t nttdial .
docker run -it --name nttdial --mount type=bind,source="$(pwd)"/src,target=/tmp --rm --gpus all nttdial /bin/bash

```
