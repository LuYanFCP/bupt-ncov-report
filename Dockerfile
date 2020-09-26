FROM python:3.7-slim-stretch

WORKDIR /workshop
COPY . /workshop

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple && \
    pip install -r requirements.txt

RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && echo 'Asia/Shanghai' >/etc/timezone  # 时间区更换为8区

CMD python main.py