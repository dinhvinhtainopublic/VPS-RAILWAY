#!/bin/bash

/usr/sbin/sshd &

sleep 1

exec ttyd -p 8080 bash
