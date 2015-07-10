# dragonfly-merge
This is the docker file and associated scripts for building the dragonfly merge container

To start the container:

  docker run -d -p 8080:8080 dragonfly-merge

To test the container:

  http://<server-running-container>:8080/idmu/Merge/

  you should see the following message:

  "This is the Default Template"

