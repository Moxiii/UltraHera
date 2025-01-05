#!/bin/bash
set -e
if [[ "$1" == "scrap" ]]; then
  echo "Keeping the scrap container alive"
  tail -f /dev/null
fi
if [[ "$1" == "frontend" ]]; then
  echo "Installing annoying dep"
  npm install -g @angular-devkit/build-angular
  npm install -g @angular/cli@latest
  npm install -g @rollup/rollup-linux-x64-gnu
  echo "Launch angular"
  ng serve --host 0.0.0.0 --port 8082
fi
if [[ "$1" == "backend" ]]; then
  echo "Start mvn back"
  mvn spring-boot:run
fi
echo "Invalid argument. Use 'scrap', 'frontend', or 'backend'."
exit 1