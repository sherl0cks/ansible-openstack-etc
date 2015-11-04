#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-fedora22-eap.6.4.2-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image 75010899-0e80-44c8-8ea3-d073709bb316 --key-name ba-enablement --security-groups bpms-group,default $INSTANCE_ID
