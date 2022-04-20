#!/bin/bash

# prereq : oc login is required to execuete this shell
#          trapit program and shell PATH environment variable to execute it.
#          kubeadmin
$HOME/kubeadmin

oc registry login
docker login `oc registry info`

# pull openliberty docker repository
docker build -t servlet .

docker tag servlet:latest $(oc registry info)/$(oc project -q)/servlet:latest

docker push $(oc registry info)/$(oc project -q)/servlet:latest

sed -i s/image-registry.openshift-image-registry.svc:5000/default-route-openshift-image-registry.apps-crc.testing/g kubernetes.yaml
sed -i s/"\[project-name\]"/$(oc project -q)/g kubernetes.yaml

oc create secret generic docker-user-secret --from-file=.dockerconfigjson=$HOME/.docker/config.json --type=kubernetes.io/dockerconfigjson
oc apply -f kubernetes.yaml

