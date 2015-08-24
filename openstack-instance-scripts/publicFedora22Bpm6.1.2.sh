#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-fedora22-bpm-6.1.2-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image 9bfd21c1-b882-408d-9ddc-5e9fdddeb1f4 --key-name jholmes --security-groups bpms-group,default $INSTANCE_ID
