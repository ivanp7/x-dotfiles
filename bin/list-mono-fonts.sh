#!/bin/bash

fc-list --format="%{family[0]}\n" :mono | sort | uniq

