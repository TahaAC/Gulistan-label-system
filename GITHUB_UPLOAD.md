# GitHub Upload Instructions

## Upload to GitHub as "Gulistan Label System"

### Step 1: Create GitHub Repository

1. Go to [GitHub](https://github.com)
2. Click the "+" icon in top right → "New repository"
3. Fill in the details:
   - **Repository name**: `Gulistan-Label-System`
   - **Description**: `Professional barcode label printing system with camera scanning and Firebase cloud sync`
   - **Visibility**: Choose Public or Private
   - **DO NOT** check "Initialize with README" (we already have one)
4. Click "Create repository"

### Step 2: Connect Local Repository to GitHub

Copy the commands from GitHub's "…or push an existing repository from the command line" section, or use these:

```bash
cd "c:\Users\tahaa\OneDrive\Desktop\Project Gulistan\gulistan-price-tags"

# Add GitHub remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/Gulistan-Label-System.git

# Rename branch to main (if needed)
git branch -M main

# Push to GitHub
git push -u origin main
```

### Step 3: Verify Upload

1. Refresh your GitHub repository page
2. You should see all files uploaded
3. README.md will display automatically on the repository page

## Quick Command Sequence

```powershell
cd "c:\Users\tahaa\OneDrive\Desktop\Project Gulistan\gulistan-price-tags"

# Replace YOUR_USERNAME with your actual GitHub username
git remote add origin https://github.com/YOUR_USERNAME/Gulistan-Label-System.git
git branch -M main
git push -u origin main
```

## Important Notes

✅ **What's Included:**
- All source code
- Product database
- Installation scripts
- Documentation
- Logo and assets

❌ **What's Excluded (via .gitignore):**
- node_modules/
- .venv/
- Build outputs
- Launch/uninstall scripts (generated locally)

## Future Updates

After initial upload, to push changes:

```bash
cd "c:\Users\tahaa\OneDrive\Desktop\Project Gulistan\gulistan-price-tags"
git add .
git commit -m "Description of your changes"
git push
```

## Troubleshooting

### Authentication Required
If prompted for credentials:
- Use your GitHub username
- For password, use a **Personal Access Token** (not your GitHub password)
- Generate token at: GitHub → Settings → Developer settings → Personal access tokens

### Permission Denied
Make sure:
- Repository exists on GitHub
- You have write access to the repository
- Remote URL is correct (`git remote -v` to check)

---

**Repository will be live at:** `https://github.com/YOUR_USERNAME/Gulistan-Label-System`
