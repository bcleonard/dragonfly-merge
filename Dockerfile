FROM centos:7.1.1503
MAINTAINER Bradley Leonard <bradley@stygianresearch.com> 

# install java, mysql-connector-java, tomcat, unzip, wget
RUN yum -y update\
 && yum -y install java-1.8.0-openjdk mysql-connector-java tomcat tomcat-webapps unzip wget\
 && yum clean all

EXPOSE 8080

#
# download and unzip the dragonfly code
#
ENV DRAGONFLY_VER=V3.b1g
ENV URL https://github.com/FlatBallFlyer/IBM-Data-Merge-Utility/releases/download/$DRAGONFLY_VER/idmu.war

RUN cd /usr/share/tomcat/webapps &&\
  wget $URL

ADD run.sh /tmp/run.sh
RUN chmod 755 /tmp/run.sh

CMD ["/tmp/run.sh"]
