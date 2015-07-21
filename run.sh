#!/bin/sh -x

CONTEXTXML="/etc/tomcat/context.xml"
CP=/usr/bin/cp
SED=/usr/bin/sed

###################################################################
# Add the Test DB to tomcat context.xml
###################################################################
#<Resource auth="Container" driverClassName="com.mysql.jdbc.Driver"
# 	maxActive="900" maxIdle="30" maxWait="10" name="jdbc/testgenDB"
# 	password="drawssap" type="javax.sql.DataSource" factory="org.apache.commons.dbcp.BasicDataSourceFactory"
#       url="jdbc:mysql://localhost:3306/testgen"
# 	username="root" />
###################################################################
if [ ! -z ${DRAGONFLY_DB_PORT_3306_TCP_ADDR+x} ]
then
  /usr/bin/grep ${DRAGONFLY_DB_PORT_3306_TCP_ADDR} ${CONTEXTXML} 2>&1 /dev/null
  RC=$?
  if [ ${RC} -eq 1 ]
  then
    ${CP} ${CONTEXTXML} ${CONTEXTXML}.backup
    ${SED} -e "s/<\/Context>/<Resource auth=\"Container\" driverClassName=\"com.mysql.jdbc.Driver\" maxActive=\"900\" maxIdle=\"30\" maxWait=\"10\" name=\"jdbc\/testgenDB\" password=\"drawssap\" type=\"javax.sql.DataSource\" factory=\"org.apache.commons.dbcp.BasicDataSourceFactory\" url=\"jdbc:mysql:\/\/${DRAGONFLY_DB_PORT_3306_TCP_ADDR}:3306\/testgen\" username=\"root\"\/><\/Context>/g" ${CONTEXTXML} > ${CONTEXTXML}.new
    ${CP} ${CONTEXTXML}.new ${CONTEXTXML}
  fi
fi

# start tomcat
/usr/libexec/tomcat/server start 

