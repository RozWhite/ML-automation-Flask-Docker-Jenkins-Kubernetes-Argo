FROM python:3.9.10-slim-buster
WORKDIR /app
COPY app.py app.py 
COPY iris.py iris.py
COPY requirements.txt requirements.txt
COPY lg.pkl lg.pkl

RUN pip3 install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]
