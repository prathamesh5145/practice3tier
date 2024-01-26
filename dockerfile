FROM centos:7
RUN yum install java-11-openjdk -y
WORKDIR /opt/
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz /opt/
RUN tar -xzf apache-tomcat-8.5.98.tar.gz -C /opt/
RUN rm -rf apache-tomcat-8.5.98.tar.gz
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/student.war /opt/apache-tomcat-8.5.98/webapps/
ADD https://s3-us-west-2.amazonaws.com/studentapi-cit/mysql-connector.jar /opt/apache-tomcat-8.5.98/lib/
COPY context.xml /opt/apache-tomcat-8.5.98/conf/context.xml
WORKDIR /opt/apache-tomcat-8.5.98/
EXPOSE 8080
CMD ["./bin/catalina.sh", "run"]