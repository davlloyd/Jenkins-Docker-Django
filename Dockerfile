FROM jenkins

USER root
RUN apt-get update -qq && apt-get install -qqy python3 python3-pip chromedriver
RUN pip3 install -q pymongo coverage jinja2 django
RUN pip3 install --upgrade selenium

USER jenkins
COPY plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt

USER root
RUN pip3 install django-jenkins
RUN pip3 install pylint

USER jenkins
