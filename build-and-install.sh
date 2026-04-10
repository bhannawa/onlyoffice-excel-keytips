#!/bin/bash
set -e

INSTALL_DIR="/opt/onlyoffice/desktopeditors/editors/web-apps/apps/spreadsheeteditor/main"
BUILD_DIR="$(dirname "$0")/build"
DEPLOY_APP="$(dirname "$0")/deploy/web-apps/apps/spreadsheeteditor/main/app.js"

# Install build dependencies if needed
if [ ! -d "$BUILD_DIR/node_modules" ]; then
    echo "Installing build dependencies..."
    npm --prefix "$BUILD_DIR" install
fi

# Build
echo "Building spreadsheet editor..."
npx --prefix "$BUILD_DIR" grunt --gruntfile "$BUILD_DIR/Gruntfile.js" deploy-spreadsheeteditor

# Backup and install
if [ -f "$INSTALL_DIR/app.js" ]; then
    BACKUP="$INSTALL_DIR/app.js.bak.$(date +%Y%m%d%H%M%S)"
    echo "Backing up original to $BACKUP"
    sudo cp "$INSTALL_DIR/app.js" "$BACKUP"
fi

echo "Installing new app.js..."
sudo cp "$DEPLOY_APP" "$INSTALL_DIR/app.js"

echo "Done. Restart OnlyOffice to see changes."
