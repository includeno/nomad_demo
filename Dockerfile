# For more information, please refer to https://aka.ms/vscode-docker-python
#docker pull python:3.8.12-slim-buster
#版本查询 https://hub.docker.com/_/python?tab=tags
FROM python:3.8.12-slim-buster

EXPOSE 3000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

WORKDIR /app
ADD . /app

ENV KEYI="value"

# Switching to a non-root user, please refer to https://aka.ms/vscode-docker-python-user-rights
RUN /bin/sh -c 'python -m pip install -r /app/requirements.txt'

CMD python /app/flaskmain.py KEYI