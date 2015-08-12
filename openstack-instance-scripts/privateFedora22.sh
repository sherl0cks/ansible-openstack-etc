#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-fedora22-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image 0fe0dca2-2fb6-4260-a220-ff409de4b054 --key-name jholmes --security-groups bpms-group $INSTANCE_ID
