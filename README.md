### dragonfly-merge

dragonfly-merge the container of the dragonfly application (IBM Data Merge Utility).  Go [here](http://www.ssgpp.com/dragonflyhome) for more information on the [dragonfly project](http://www.ssgpp.com/dragonflyhome).

### Preperation
Before running the container, you'll need to have the following directories predefined on the container host:
```sh
idmu
```

The idmu directory will hold all the persistant data that dragonfly-merge needs.  I used:
```sh
/data/idmu
```

for the instructions below.  Just make sure you create it prior to starting the container.

### To start the container (without the test database container):
```sh
docker run -d -p 8080:8080 -v /data/idmu:/opt/ibm/idmu bcleonard/dragonfly-merge
```

### To start the container (with the test database container):
```sh
docker run -d -p 8080:8080 -v /data/idmu:/opt/ibm/idmu --name dragonfly-merge --link dragonfly-db bcleonard/dragonfly-merge
```

### Initial Run ###
The first time you run the container, you'll need to load the template packages.  This is not necessary for subsequent runs unless you remove the persistant data directory.

After the container is started, go to the following webpage:
```sh
http://<container_host>:8080/#Packages
```

Click on the "System Templates".  You should see a popup dialog box which indicated that package json file was loaded.

The "Testing Templates" and "Training Templates" are not required.

### Status of dragonfly:
To check the status of dragonfly, go to the following webpage:
```sh
http://<container_host>:8080/idmu/status/
```

If a page shows up, then you loaded the templates correctly and everything is working.

### To test the container (with the test database container):
```sh
http://<container_host>:8080/idmu/Merge/?DragonFlyFullName=jdbc.report.
```

you should see a web page with a whole bunch of output.  It starts with:

>"Begin Customers for {corpUrl} Contacts for: General Motors Postal Mail Address for James: 5791 Pleasant Prairie End, Dysart, PA 16188-0761 Name: Daniel SMS-Phone# (878) 555-2221"

