#!/bin/bash

echo "=========================================="
echo "  Railway VPS - Web Terminal"
echo "=========================================="
echo ""
echo "  Truy cap Railway Public URL tren browser"
echo "  de su dung terminal"
echo ""
echo "  Password: root"
echo ""
echo "=========================================="

/usr/sbin/sshd &

sleep 1

ttyd -p 8080 -c root:root bash &
