# Use Image of CUDA11.3
FROM nvcr.io/nvidia/pytorch:21.05-py3

RUN sed -i 's@archive.ubuntu.com@ftp.jaist.ac.jp/pub/Linux@g' /etc/apt/sources.list

WORKDIR /workspace

RUN git clone https://github.com/pytorch/fairseq \
    && cd fairseq \
    && pip install --editable ./

RUN pip install sentencepiece


RUN useradd -m -d /home/sota -s /bin/bash sota
USER sota
WORKDIR /tmp