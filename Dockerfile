FROM python:3.12-slim

WORKDIR /app

COPY flask_app/ /app/

COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN pip install -r dev-requirements.txt

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["python", "app.py"]


# docker build -t sovith07/emotion1:v1 .
# docker run -p 8888:5000 -e DAGSHUB_PAT=personal-token sovith07/emotion1:v1