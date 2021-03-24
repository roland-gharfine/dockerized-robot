FROM python:3.7.8-buster
MAINTAINER Roland Gharfine

RUN mkdir /robot_project/
COPY ./test-requirements.txt /robot_project/

RUN apt-get update -y
RUN apt-get install -y wget xvfb unzip

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list

RUN apt-get update -y
RUN apt-get install -y google-chrome-stable

ENV CHROMEDRIVER_VERSION 89.0.4389.23

RUN wget --continue -P Drivers "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip Drivers/chromedriver* -d Drivers

ENV PATH /Drivers:$PATH
ENV DISPLAY :99


RUN pip install --upgrade pip
RUN pip install -e .
RUN pip3 install -r /robot_project/test-requirements.txt

WORKDIR /robot_project/
COPY ./run-tests.sh /robot_project/

RUN useradd -m runtest
RUN chown -R runtest:runtest /robot_project

RUN chmod +x *.sh
USER runtest
#CMD ["robot", "-d", "Results", "Tests"]
CMD ["sh", "-c", "/robot_project/run-tests.sh"]
ENV PYTHONDONTWRITEBYTECODE=true
