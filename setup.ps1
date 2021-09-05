docker build -t jupyterlab .
docker run -itd --name JupyterLab -v jupyter:/opt/jupyter -p 8888:8888 jupyterlab