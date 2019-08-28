#!/usr/bin/env bash

jupyter notebook --generate-config

jupyter notebook password

jupyter notebook --ip=0.0.0.0 --notebook-dir=/home/user --allow-root
