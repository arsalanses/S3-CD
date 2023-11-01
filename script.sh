#!/bin/bash

BUCKET_NAME="gitlab"

OBJECTS=$(s3cmd --config=./s3cfg ls s3://$BUCKET_NAME/* | awk '{print $4}')

for OBJECT in $OBJECTS; do
    s3cmd --config=./s3cfg setacl --acl-public $OBJECT 
done
