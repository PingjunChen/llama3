FROM nvidia/cuda:12.1.0-devel-ubuntu22.04

# set environment variables
ENV DEBIAN_FRONTEND noninteractive
ENV HDF5_USE_FILE_LOCKING FALSE
ENV NUMBA_CACHE_DIR /tmp

# set web proxy
ENV http_proxy http://1mcwebproxy01.mdanderson.edu:3128
ENV https_proxy http://1mcwebproxy01.mdanderson.edu:3128
ENV HTTP_PROXY http://1mcwebproxy01.mdanderson.edu:3128
ENV HTTPS_PROXY http://1mcwebproxy01.mdanderson.edu:3128

# install libraries
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential curl wget htop git vim ca-certificates python3-pip python3-dev \
  && rm -rf /var/lib/apt/lists/*

# install python packages
RUN pip install gpustat==0.6.0 setuptools==61.2.0 pytz==2023.3 joblib==1.4.2 tqdm==4.66.1 docopt==0.6.2
RUN pip install ipython==8.10.0 jupyterlab==3.6.1 notebook==6.4.11 traitlets==5.9.0 chardet==5.0.0 nbconvert==7.8.0
RUN pip install pandas==2.1.2 matplotlib==3.7.2 seaborn==0.13.0 pycm==3.5 deepdish==0.3.7 openpyxl==3.1.2 XlsxWriter==3.2.0
RUN pip install scikit-learn==1.3.2 xgboost==2.0.3 statsmodels==0.13.5
RUN pip install huggingface-hub==0.24.7 transformers==4.44.2 
RUN pip install torch==2.4.0 torchinfo==1.8.0 torchmetrics==1.4.2
RUN pip install llama-toolchain==0.0.16 fairscale==0.4.13 fire==0.6.0 blobfile==3.0.0 tiktoken==0.4.0


# configure folder permission
WORKDIR /.local
RUN chmod -R 777 /.local
WORKDIR /.cache
RUN chmod -R 777 /.cache

# set working directory 
WORKDIR /App
CMD ["/bin/bash"]
# CMD["/usr/bin/python3", "python_script.py"]