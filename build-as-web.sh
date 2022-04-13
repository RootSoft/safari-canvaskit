flutter build web --web-renderer canvaskit --release
cd build/web
http-server --ssl --cert ~/.localhost-ssl/localhost.crt --key ~/.localhost-ssl/localhost.key
cd ../..
