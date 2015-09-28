#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-container-host-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image 2350979b-74ef-4f35-90e2-e97f54703830 --key-name jholmes --security-groups bpms-group $INSTANCE_ID
