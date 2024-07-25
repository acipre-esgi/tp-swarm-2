#!/bin/bash

docker stack rm monitoring && docker stack deploy -c monitoring.yml monitoring
