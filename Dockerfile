FROM python:3.10.4-alpine
RUN mkdir /data
WORKDIR /data
COPY requirements.txt requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt
COPY . /data
CMD [ "gunicorn", "--workers",  "3" , "--bind", "0.0.0.0:8080", "-m", "007", "run:app" ]
EXPOSE 8080