FROM python:3.12-slim

WORKDIR /app

COPY flask_app/ /app/

COPY models/vectorizer.pkl /app/models/vectorizer.pkl

RUN pip install -r dev-requirements.txt

RUN python -m nltk.downloader stopwords wordnet

EXPOSE 5000

CMD ["python", "app.py"]


# docker build -t sovith07/emotion1:v1 .
# docker run -p 8888:5000 -e DAGSHUB_PAT=personal-token sovith07/emotion1:v1  for local

#to run container in aws ec2 execute this

# Update the system
#sudo apt-get update 

# Install Docker
#sudo apt install -y docker.io

# Start and enable Docker
#sudo systemctl start docker
#sudo systemctl enable docker

# Pull the latest image
#docker pull sovith07/emotion1:v2

# Run the container
#docker run -p 80:5000 -e DAGSHUB_PAT=personal-token sovith07/emotion1:v1  



#while integrating ec2 depolyment with github actions we run a command in ec2 
#sudo usermod -aG docker ubuntu  
#which help us to execute command in ec2 without writing sudo
