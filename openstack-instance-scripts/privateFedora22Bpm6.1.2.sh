#! /bin/bash

timestamp() {
  date +"%T"
}

INSTANCE_ID="jholmes-fedora22-bpm-6.1.2-"$(date +%Y-%m-%d-%T)

echo "creating instance id: " $INSTANCE_ID

# public OS1
nova boot --flavor m1.medium --image 82cb0cb0-0c94-4396-888b-40873edca22e --key-name jholmes --security-groups bpms-group $INSTANCE_ID
