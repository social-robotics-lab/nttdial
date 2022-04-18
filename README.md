
# Install

## NVIDIA Driver for Cuda on WSL
Download and install: https://developer.nvidia.com/cuda/wsl/download

## Download code
```
git clone https://github.com/social-robotics-lab/yolo_deepsort.git
```

## Download models (if necessary)
```
wget -P japanese-dialog-transformers/checkpoints https://www.dropbox.com/s/e5ib6rhsbldup3v/japanese-dialog-transformer-1.6B-persona50k.pt?dl=0
wget -P japanese-dialog-transformers/checkpoints https://www.dropbox.com/s/laqz0jcgxvpxiy0/japanese-dialog-transformer-1.6B-empdial50k.pt?dl=0
```

## Docker build anr run
```
docker build -t nttdial .
docker run -it --name nttdial --mount type=bind,source="$(pwd)"/japanese-dialog-transformers,target=/tmp --rm --gpus all nttdial /bin/bash
python scripts/dialog.py data/sample/bin/ \
 --path checkpoints/dials5_1e-4_1li20zh5_tw5.143_step85.pt \
 --beam 80 \
 --min-len 10 \
 --source-lang src \
 --target-lang dst \
 --tokenizer space \
 --bpe sentencepiece \
 --sentencepiece-model data/dicts/sp_oall_32k.model \
 --no-repeat-ngram-size 3 \
 --nbest 80 \
 --sampling \
 --sampling-topp 0.9 \
 --temperature 1.0 \
 --show-nbest 5
```
