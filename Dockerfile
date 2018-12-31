FROM python
LABEL version=v1
MAINTAINER Saloni
RUN apt-get update
RUN pip install cherrypy
WORKDIR /var
COPY index.html /var
COPY code.py /var
RUN chmod 777 /var/code.py
HEALTHCHECK CMD curl --fail http://localhost:8080||exit 1
CMD ["python", "/var/code.py"]
EXPOSE 8080

