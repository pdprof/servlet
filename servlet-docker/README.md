# PDPro Application

## Requirements

- [Docker](https://www.docker.com/)

## Test on Docker

### Build docker image

```
setup-docker.sh
```

### Start docker 
```
docker run -d --name servlet -p 9080-9444:9080-9444 servlet
```

Now you can access to http://localhost:9080/hello


## Test on OpenShift

After you setup CRC described at [icp4a-helloworld](https://github.com/pdprof/icp4a-helloworld)

You can use following script. 
```
setup-openshift.sh
```

Now you can access to http://servlet-route-default.apps-crc.testing/servlet

Other test steps are same with docker.
