# Release Process Documentation

## Overview

This VS Code Portable repository has a comprehensive automated release system that builds and publishes portable VS Code applications to the front of the repository through multiple channels.

## 🚀 Release Channels

### 1. GitHub Releases (Primary)
- **URL**: https://github.com/hungpv-fs/vscode-portable/releases
- **Content**: Downloadable ZIP and EXE files
- **Visibility**: Prominently featured in README with download badges

### 2. GitHub Pages (User-Friendly)
- **URL**: https://hungpv-fs.github.io/vscode-portable/
- **Content**: Beautiful download page with release history
- **Auto-generated**: Updated automatically when releases are published

### 3. Repository Front Page
- **Location**: README.md top section
- **Features**: 
  - Quick Download section with direct links
  - GitHub release badges showing latest version
  - Download statistics
  - Build status indicators

## 🤖 Automated Workflows

### 1. Auto-Update (auto-update.yml)
- **Trigger**: Scheduled (twice weekly - Sunday & Wednesday at midnight UTC)
- **Function**: 
  - Checks Microsoft's VS Code repository for new releases
  - Updates build.properties and CHANGELOG.md
  - Creates and pushes version tags
  - Triggers build workflow automatically

### 2. Build & Release (build.yml)
- **Trigger**: When version tags are pushed (format: X.Y.Z-N)
- **Function**:
  - Uses Portapps framework to build portable application
  - Creates GitHub release with artifacts
  - Uploads ZIP and EXE files
  - Generates release notes

### 3. GitHub Pages (pages.yml)
- **Trigger**: When releases are published
- **Function**:
  - Generates beautiful download page
  - Lists recent releases with download links
  - Provides user-friendly interface
  - Updates automatically

### 4. Manual Release (manual-release.yml) - NEW
- **Trigger**: Manual workflow dispatch
- **Function**:
  - Allows manual version updates
  - Creates tags and triggers builds
  - Backup for when automation fails

## 📦 Manual Release Process

### Option 1: Using GitHub UI
1. Go to **Actions** tab in GitHub
2. Select **Manual Release** workflow
3. Click **Run workflow**
4. Enter version (e.g., 1.103.0) and release number
5. Workflow will update files, create tag, and trigger build

### Option 2: Using release.sh Script
```bash
# Run the interactive script
./release.sh

# Follow prompts to enter version and release number
# Script will update files and provide next steps
```

### Option 3: Manual Git Commands
```bash
# 1. Update build.properties
sed -i 's/app.version = .*/app.version = 1.103.0/' build.properties
sed -i 's/app.release = .*/app.release = 54/' build.properties

# 2. Update CHANGELOG.md (add new entry at top)
# Edit file manually or use sed

# 3. Commit changes
git add build.properties CHANGELOG.md
git commit -m "Update VS Code to version 1.103.0"

# 4. Create and push tag
git tag "1.103.0-54"
git push origin "1.103.0-54"

# 5. Build workflow triggers automatically
```

## 🎯 Artifact Availability

After a successful release, artifacts are available at:

1. **GitHub Releases**: https://github.com/hungpv-fs/vscode-portable/releases/latest
2. **GitHub Pages**: https://hungpv-fs.github.io/vscode-portable/
3. **README Badges**: Show latest version and provide direct links
4. **Release Assets**: 
   - `vscode-portable-X.Y.Z-N-win64.zip` (Main portable app)
   - `vscode-portable-X.Y.Z-N-win64.exe` (Installer version)

## 🔧 Troubleshooting

### Build Failures
- Check GitHub Actions logs for build errors
- Verify VS Code version exists at download URL
- Ensure build.properties format is correct

### Missing Releases
- Verify tag was created correctly (format: X.Y.Z-N)
- Check if build workflow completed successfully
- Look for authentication or permission issues

### GitHub Pages Not Updating
- Ensure Pages is enabled in repository settings
- Check pages.yml workflow execution
- Verify permissions for Pages deployment

## 📊 Current Status

- **Latest Version**: 1.102.3-53 (as of last update)
- **Automation Status**: ✅ Fully operational
- **Download Availability**: ✅ Prominently featured at repository front
- **GitHub Pages**: ✅ Configured and auto-updating
- **Manual Backup**: ✅ Available via workflows and scripts

## 🎉 Success Metrics

The repository successfully provides VS Code Portable artifacts "at the front of the repo" through:

1. ✅ **Prominent README section** with download buttons and version badges
2. ✅ **Automated release system** that publishes to GitHub Releases
3. ✅ **User-friendly GitHub Pages** with beautiful download interface
4. ✅ **Multiple backup methods** for manual releases when needed
5. ✅ **Comprehensive automation** that keeps everything up-to-date

Users can easily find and download the latest VS Code Portable from the repository front page through multiple prominent channels.