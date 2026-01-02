# 🏷️ Gulistan Label System

A professional barcode label printing system with camera scanning, Firebase cloud sync, and desktop installation support.

## ✨ Features

- 📷 **Camera Barcode Scanning** - Scan barcodes directly using your device camera with QuaggaJS
- 🔍 **Smart Search** - Autocomplete search for products by name, barcode, or price
- ☁️ **Firebase Cloud Sync** - Automatic cloud backup and sync across devices
- 🖨️ **Print Optimization** - A4 format with 21 labels per sheet (60mm × 40mm)
- 💾 **Export Options** - Save as PDF or export to Excel
- 📱 **Progressive Web App** - Install as desktop app on Windows, Mac, or Linux
- 🔄 **Real-time Updates** - Live product database with instant search
- 📊 **1095 Products** - Pre-loaded product database ready to use

## 🚀 Quick Start

### Option 1: Use Directly (No Installation)
1. Open `standalone.html` in Chrome or Edge
2. Products load automatically from inline database
3. Use camera scan or manual entry to add products to print queue
4. Click "Print Selected" to print labels

### Option 2: Install as Desktop App

**Windows:**
```bash
# Run the installer
install.bat
```

**PowerShell:**
```powershell
# Run the PowerShell installer
powershell -ExecutionPolicy Bypass -File install.ps1
```

The installer creates:
- Desktop shortcut
- Start Menu entry
- Launch script
- Uninstaller

## 📋 Usage

### Scanning Barcodes
1. Click "Start Camera" button
2. Point camera at barcode
3. Product automatically added to print queue

### Manual Entry
1. Enter barcode, product name, and price
2. Click "Add to Queue"
3. Product saved to local database and Firebase

### Printing Labels
1. Select products from print queue
2. Click "Preview Selected" to see layout
3. Click "Print Selected" to print

### Cloud Sync
- Click "☁️ Sync to Cloud" to upload all products to Firebase
- Click "⬇️ Load from Cloud" to download products from Firebase
- Changes sync automatically when adding/deleting products

## 🔧 Configuration

### Firebase Setup
Firebase is pre-configured with:
- Project: barcode-printing-system
- Database: Firestore collection "products"
- Auto-sync enabled

### Label Format
- Size: 60mm × 40mm
- Layout: 3 columns × 7 rows per A4 sheet
- Barcode: CODE128 format
- Price: 20pt font size (configurable)

## 📁 Project Structure

```
gulistan-label-system/
├── standalone.html          # Main application (single-file)
├── productData-inline.js    # Product database (1095 items)
├── logo.png                # Company logo
├── manifest.json           # PWA configuration
├── service-worker.js       # Offline support
├── install.bat             # Windows installer
├── install.ps1             # PowerShell installer
├── INSTALLATION.md         # Installation guide
└── README.md              # This file
```

## 🛠️ Technologies

- **Frontend**: Vanilla JavaScript (no framework required)
- **Barcode Generation**: JsBarcode 3.11.6
- **Camera Scanning**: QuaggaJS 0.12.1
- **Backend**: Firebase Firestore
- **PWA**: Service Worker for offline support
- **Print**: Native browser print API

## 📱 Browser Support

- ✅ Chrome 90+ (recommended)
- ✅ Edge 90+
- ✅ Firefox 88+
- ✅ Safari 14+ (limited camera support)

## 🔒 Security & Privacy

- All product data stored locally in browser
- Firebase synced only when user clicks sync
- No tracking or analytics
- Camera access requires user permission
- Works fully offline after first load

## 📄 License

MIT License - Free for commercial and personal use

## 🤝 Contributing

This is a private business tool. For issues or feature requests, contact the development team.

## 📞 Support

For technical support or questions:
- Open an issue on GitHub
- Contact: Gulistan Store Management

---

**Built with ❤️ for Gulistan Store**
