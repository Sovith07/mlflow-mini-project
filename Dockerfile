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

# these commands should also be run in ec2 before when you are using ci/cd

#without ci/cd pull and deployment
# Pull the latest image
#sudo docker pull sovith07/emotion1:v1

# Run the container
#sudo docker run -p 80:5000 -e DAGSHUB_PAT=personal-token sovith07/emotion1:v1 



#sudo usermod -aG docker ubuntu        which help us to execute command in ec2 without writing sudo

# while deploying on ec2 always set port mapping to 80 beacuse http request is allowed on 80 only
# also while delpoying on ec2 with ci/cd we have to provide key-pair value to github secret and variables and also the host link






# to push in ecr from local
# aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
# docker build -t ecremotion .
# docker tag ecremotion:latest public.ecr.aws/s5l4a4t7/ecremotion:latest
# docker push public.ecr.aws/s5l4a4t7/ecremotion:latest

# to pull from ecr
#aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws
# docker pull public.ecr.aws/s5l4a4t7/ecremotion:latest 

# to run in local
#docker run -d -p 8888:5000 --name emotion-app -e DAGSHUB_PAT=personal-token public.ecr.aws/s5l4a4t7/ecremotion:latest   







# to connect ecr with e2 
# Update packages
#sudo apt-get update

# Install Docker
#sudo apt-get install -y docker.io

# Start and enable Docker
#sudo systemctl start docker
#sudo systemctl enable docker

# Install AWS CLI v2
#sudo apt-get update
#sudo apt-get install -y unzip curl

#curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

#unzip awscliv2.zip

#sudo ./aws/install

# Allow the ubuntu user to run Docker without sudo
#sudo usermod -aG docker ubuntu

# exit 

# these commands should also be run in ec2 before when you are using ci/cd

# Configure AWS CLI
#aws configure  for connecting ecr with ec2

# Login to Amazon ECR (Public)
#aws ecr-public get-login-password --region us-east-1 | docker login --username AWS --password-stdin public.ecr.aws

# Pull the Docker image
#docker pull public.ecr.aws/s5l4a4t7/ecremotion:latest 

# Run the container
#docker run -p 80:5000 --name emotion-app -e DAGSHUB_PAT=personal-token public.ecr.aws/s5l4a4t7/ecremotion:latest   