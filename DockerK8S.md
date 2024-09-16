## Step 1: Build docker image & push to hpc-harbord
```
$ cd /rsrch5/home/plm/idso_fa1_pathology/codes/pchen6/llama3
$ docker build --platform linux/x86_64 -t llama3:pchen6 .
$ docker login hpcharbor.mdanderson.edu 
$ docker tag llama3:pchen6 hpcharbor.mdanderson.edu/pchen6/llama3:pchen6
$ docker push hpcharbor.mdanderson.edu/pchen6/llama3:pchen6
```

## Step 2: Start a K8S Cluster [JupyterHub](http://hpcexhaproxy.mdanderson.edu/jupyter) instance 
- Toggle **Custom Environment**
    * CPUs - 128
    * Cuda Version - H100
    * GPUs - 2
    * Enter image manually (hpcharbor.mdanderson.edu/pchen6/llama3:pchen6)

## Step 3: From JupyterHub Launcher
- Open Other/Terminal
```
$ cd /rsrch5/home/plm/idso_fa1_pathology/codes/pchen6/llama3
```