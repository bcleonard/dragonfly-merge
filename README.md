# dragonfly-merge

dragonfly-merge the container of the dragonfly application (IBM Data Merge Utility).  Go [here](http://www.ssgpp.com/Dragonfly) for more information on the [dragonfly project](http://www.ssgpp.com/Dragonfly).

### To start the container:
```sh
docker run -d -p 8080:8080 dragonfly-merge
```
### To test the container:
```sh
http://<container_host>:8080/idmu/Merge/
```
you should see the following message:

>"This is the Default Template"

