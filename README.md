# dragonfly-merge

dragonfly-merge the container of the dragonfly application (IBM Data Merge Utility).  Go [here](http://www.ssgpp.com/dragonflyhome) for more information on the [dragonfly project](http://www.ssgpp.com/dragonflyhome).

### To start the container (without the test database container):
```sh
docker run -d -p 8080:8080 bcleonard/dragonfly-merge
```

### To start the container (with the test database container):
```sh
docker run -d -p 8080:8080 --name dragonfly-merge --link dragonfly-db bcleonard/dragonfly-merge
```

### To test the container:
```sh
http://<container_host>:8080/idmu/Merge/
```
you should see the following message:

>"This is the Default Template"

### To test the container (with the test database container):
```sh
http://<container_host>:8080/idmu/Merge/?DragonFlyFullName=jdbc.report.
```
you should see a web page with a whole bunch of output.  It starts with:

>"Begin Customers for {corpUrl} Contacts for: General Motors Postal Mail Address for James: 5791 Pleasant Prairie End, Dysart, PA 16188-0761 Name: Daniel SMS-Phone# (878) 555-2221"

