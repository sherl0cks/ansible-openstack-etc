#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-fedora22-eap.6.4.2-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image a975b4b7-6f57-443e-a123-7274b9a44520 --key-name ba-enablement --security-groups bpms-group $INSTANCE_ID
