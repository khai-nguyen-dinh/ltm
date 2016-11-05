#!/bin/bash
cd /home/glassfish4/bin
./asadmin start-domain domain1
./asadmin deploy /home/note/note/target/note.war
PATH=$PATH:/opt/play-1.3.4/
export PATH
cd /home/note/a/
play run
