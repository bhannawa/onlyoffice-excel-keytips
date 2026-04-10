# Excel-Style Keytips for OnlyOffice

This fork adds Excel-compatible Alt keytip (keyboard shortcut hint) support to the OnlyOffice spreadsheet editor.

## What it does

OnlyOffice has its own keytip assignments when you press Alt. If you're used to Excel's Alt keytips (Alt+H for Home, Alt+H+I for Insert Cells, etc.), the different mappings can be frustrating. This fork:

- **Adds dropdown menu keytip support** to the HintManager, so keytip hints appear inside dropdown menus (e.g., Alt+H+I shows keytips for "Entire Row" and "Entire Column")
- **Remaps keytips** on the spreadsheet editor toolbar to match Excel conventions
- Allows explicit `dataHintTitle` on menu items that previously had no keytip support

## Changed files

- `apps/common/main/lib/controller/HintManager.js` - Dropdown menu keytip support
- `apps/spreadsheeteditor/main/app/view/Toolbar.js` - Keytip remapping
- `apps/spreadsheeteditor/main/app/view/DataTab.js` - Sort button keytip remapping

## Building and installing

### Prerequisites

- OnlyOffice Desktop Editors installed at `/opt/onlyoffice/desktopeditors/`
- Node.js and npm

### Quick install

```bash
git clone https://github.com/bhannawa/web-apps.git
cd web-apps
git checkout excel-keytips
./build-and-install.sh
```

The script will:
1. Install build dependencies (first run only)
2. Build the spreadsheet editor
3. Back up the original `app.js` with a timestamp
4. Copy the new build into the OnlyOffice installation (requires sudo)

Restart OnlyOffice after installing.

### Manual build

```bash
cd build
npm install
npx grunt deploy-spreadsheeteditor
sudo cp ../deploy/web-apps/apps/spreadsheeteditor/main/app.js \
    /opt/onlyoffice/desktopeditors/editors/web-apps/apps/spreadsheeteditor/main/app.js
```

### Restoring the original

Backup files are saved as `app.js.bak.<timestamp>` in the install directory:

```bash
sudo cp /opt/onlyoffice/desktopeditors/editors/web-apps/apps/spreadsheeteditor/main/app.js.bak.<timestamp> \
    /opt/onlyoffice/desktopeditors/editors/web-apps/apps/spreadsheeteditor/main/app.js
```

## Contributing

This fork focuses on the keytips I personally use most. I'll add more as I have time, but coverage won't be exhaustive. If there's a keytip mapping you care about, contributions are welcome — open a PR against the `excel-keytips` branch.

## Keeping up to date with upstream

```bash
git fetch upstream
git checkout excel-keytips
git rebase upstream/master
./build-and-install.sh
```
