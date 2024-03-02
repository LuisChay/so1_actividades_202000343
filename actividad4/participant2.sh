#!/bin/bash

while true; do
    read message
    echo "Participant 2: $message" > participant2_to_participant1
done
