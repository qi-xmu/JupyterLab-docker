FROM python

WORKDIR /root/
# 安装jupyterlab环境
RUN pip install jupyterlab -i https://pypi.tuna.tsinghua.edu.cn/simple/
RUN pip install jupyterlab-language-pack-zh-CN -i https://pypi.tuna.tsinghua.edu.cn/simple/

COPY sources.list /etc/apt/

RUN apt-get update && \
    curl -fsSL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs

# 配置环境参数
Run jupyter lab --generate-config && \
    mkdir /opt/jupyter && cd /opt/jupyter

COPY jupyter_lab_config.py /root/.jupyter/

EXPOSE 8888

CMD jupyter lab --allow-root

