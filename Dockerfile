#using the official python runtime as base image
FROM python:3.10
#set the working directory inside the container
WORKDIR /opt/app
#copy the application files into the container's working directory
COPY . /opt/app
#installing the pythion dependencies mentioned in the requirements.txt
RUN pip install -r requirements.txt
#exposing the application port, inside the container.
EXPOSE 3000
#command for running the application
CMD ["python3", "app.py"]