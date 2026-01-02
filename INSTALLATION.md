# Gulistan Price Tags - Installation Guide

## 📦 Desktop Installation Package

### Quick Install (Recommended)

#### Option 1: Simple Installer
1. **Double-click** `install.bat`
2. Wait for installation to complete
3. Click on the desktop shortcut "Gulistan Price Tags"

#### Option 2: PowerShell Installer
1. **Right-click** `install.ps1`
2. Select **"Run with PowerShell"**
3. If prompted, allow script execution
4. Launch from Start Menu or Desktop

---

## 🖥️ What Gets Installed

The installer creates:

### ✅ Desktop Shortcut
- **Name**: Gulistan Price Tags
- **Type**: Chrome App Mode (no browser UI)
- **Size**: Opens in 1400x900 window

### ✅ Start Menu Entry
- **Location**: Start Menu > Gulistan > Gulistan Price Tags
- **Searchable**: Type "Gulistan" in Windows search

### ✅ Launch Script
- **File**: `launch.bat`
- **Function**: Opens app in Chrome app mode
- **Window**: Dedicated window without browser tabs/address bar

### ✅ Uninstaller
- **File**: `uninstall.bat`
- **Function**: Removes all shortcuts and launcher

---

## 🚀 Usage After Installation

### Launch Options:
1. **Desktop**: Double-click "Gulistan Price Tags" icon
2. **Start Menu**: Start > Gulistan > Gulistan Price Tags
3. **Search**: Press Windows key, type "Gulistan"
4. **Direct**: Double-click `launch.bat` in the app folder

### App Features:
- ✅ Runs in dedicated window (no browser UI)
- ✅ Full screen barcode scanning with camera
- ✅ Offline access to 3000+ products
- ✅ Print labels directly
- ✅ Export to Excel/PDF

---

## 🗑️ Uninstall

To remove the application:
1. Double-click `uninstall.bat` in the app folder
2. All shortcuts will be removed
3. App files remain in the folder (delete manually if needed)

**Or manually:**
- Delete desktop shortcut
- Delete Start Menu folder: `%APPDATA%\Microsoft\Windows\Start Menu\Programs\Gulistan`

---

## ⚙️ System Requirements

### Minimum:
- **OS**: Windows 10 or later
- **Browser**: Google Chrome (installed)
- **RAM**: 2GB
- **Storage**: 50MB

### Recommended:
- **OS**: Windows 11
- **Browser**: Latest Chrome/Edge
- **RAM**: 4GB+
- **Camera**: For barcode scanning

---

## 🎥 Camera Permissions

For barcode scanning to work:

### First Launch:
1. App will request camera permission
2. Click **"Allow"**
3. Camera preview appears when you click "Start Camera"

### If Camera Blocked:
1. Click the 🔒 lock icon in Chrome address bar
2. Find "Camera" setting
3. Change to **"Allow"**
4. Refresh the page

---

## 🔧 Troubleshooting

### App Won't Launch?
- **Solution**: Make sure Chrome is installed
- **Alternative**: Open `standalone.html` directly in any browser

### Camera Not Working?
- **Check**: Camera permissions in browser
- **Check**: No other app is using the camera
- **Try**: Use HTTPS or localhost (see below)

### Need HTTPS?
For advanced camera features, serve via HTTPS:
```cmd
cd path\to\app
python -m http.server 8000
```
Then open: http://localhost:8000/standalone.html

### Shortcuts Not Created?
- **Run**: Right-click `install.bat` > Run as Administrator
- **Manual**: Create shortcut to `launch.bat` yourself

---

## 📋 File Structure

```
gulistan-price-tags/
├── standalone.html          # Main application file
├── productData-inline.js    # Product database (3000+ items)
├── manifest.json           # PWA configuration
├── service-worker.js       # Offline support
├── install.bat             # Windows installer
├── install.ps1             # PowerShell installer
├── launch.bat              # App launcher (created by installer)
├── uninstall.bat           # Uninstaller (created by installer)
└── INSTALLATION.md         # This file
```

---

## 🆘 Support

### Common Issues:

**"Chrome is not recognized"**
- Chrome not installed or not in PATH
- Solution: Install Google Chrome from google.com/chrome

**"Access Denied"**
- Run installer as Administrator
- Right-click > Run as administrator

**App opens in regular browser**
- Normal behavior if Chrome not found
- Still fully functional, just has browser UI

---

## 💡 Tips

### For Best Experience:
1. ✅ Keep app folder in a permanent location (not Desktop)
2. ✅ Move to: `C:\Program Files\Gulistan` or `C:\Apps\Gulistan`
3. ✅ Re-run installer after moving
4. ✅ Bookmark frequently used features

### Chrome App Mode:
- No address bar
- No tabs
- No bookmarks bar
- Clean, app-like interface
- Press F11 for fullscreen

---

## 🔄 Updates

To update the app:
1. Replace `standalone.html` with new version
2. Replace `productData-inline.js` with new data
3. No need to reinstall shortcuts
4. Reload app (Ctrl+R)

---

**Enjoy your desktop Gulistan Price Tags application!** 🎉
