flutter clean
flutter build web
cd build/web/
comparejson -e ./assets/i18n/*.json
# node-minify --compressor jsonminify --input 'assets/assets/i18n/en.json' --output 'assets/assets/i18n/en.json'
# node-minify --compressor jsonminify --input 'assets/assets/i18n/es.json' --output 'assets/assets/i18n/es.json'
# node-minify --compressor jsonminify --input 'assets/assets/i18n/pt.json' --output 'assets/assets/i18n/pt.json'
# node-minify --compressor jsonminify --input 'style.css' --output 'style.css'
firebase serve --host 192.168.1.65