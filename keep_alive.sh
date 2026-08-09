#!/bin/bash

echo "=========================================="
echo "  Railway VPS - SSH Information"
echo "=========================================="
echo ""
echo "  Password: root"
echo ""
echo "  Vao Railway Dashboard lay Public Domain:"
echo "  Railway App -> Settings -> Networking"
echo ""
echo "  SSH Command (thay PUBLIC_DOMAIN):"
echo "  ssh root@PUBLIC_DOMAIN -p 22"
echo ""
echo "=========================================="

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
