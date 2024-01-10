#!/usr/bin/env bash

docker build -t levg/ops-eng-container:latest .

docker login

docker tag levg/ops-eng-container:latest ministryofjustice/operations-engineering-devcontainer

docker push ministryofjustice/operations-engineering-devcontainer