FROM --platform=linux/amd64 python:3.9-rc-slim-buster

COPY Pipfile .
COPY Pipfile.lock .

RUN apt-get update && apt-get install curl -y

RUN pip install pipenv \
 && PIPENV_VENV_IN_PROJECT=1 PIPENV_SITE_PACKAGES=1 pipenv install --deploy --dev --system

WORKDIR /app

RUN mkdir /app/allure-results





