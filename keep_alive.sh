#!/bin/bash

echo "=========================================="
echo "  Railway VPS - SSH Information"
echo "=========================================="
echo ""
echo "  Dang khoi tunnel..."
echo ""

/usr/sbin/sshd &

sleep 2

bore local 22 --to bore.pub 2>&1 | while read line; do
    if echo "$line" | grep -q "listening"; then
        echo "=========================================="
        echo "  SSH Ready!"
        echo "=========================================="
        echo ""
        echo "  Copy va paste lenh SSH:"
        echo ""
        echo "  $line"
        echo ""
        echo "  Password: root"
        echo ""
        echo "=========================================="
    fi
done &

python3 -c "
from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.end_headers()
        self.wfile.write(b'OK')
    def log_message(self, format, *args):
        pass

HTTPServer(('0.0.0.0', 8080), Handler).serve_forever()
" &

while true; do
    curl -s http://localhost:8080 > /dev/null 2>&1
    sleep 30
done
