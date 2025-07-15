---
name: Release Template
about: Template for creating new releases
title: 'VS Code Portable [VERSION]'
labels: release
assignees: ''

---

## Release Information

**Version**: [VERSION]
**Release Number**: [RELEASE]
**VS Code Version**: [VSCODE_VERSION]

## Release Checklist

- [ ] Version updated in `build.properties`
- [ ] Release number incremented in `build.properties`
- [ ] CHANGELOG.md updated with new version
- [ ] Build artifacts generated successfully
- [ ] Download URLs tested and verified
- [ ] GitHub Pages updated with new release
- [ ] Release notes created with proper format

## Download Links

- **GitHub Release**: https://github.com/hungpv-fs/vscode-portable/releases/tag/[VERSION]-[RELEASE]
- **GitHub Pages**: https://hungpv-fs.github.io/vscode-portable/

## Release Notes Template

```markdown
## VS Code Portable [VERSION]

Automatically updated to Visual Studio Code [VSCODE_VERSION]

### Changes
* Updated to Visual Studio Code [VSCODE_VERSION]
* Latest bug fixes and security updates from Microsoft
* Portapps 3.16.0 framework

### Download
Download the portable application from the assets below:
- **vscode-portable-[VERSION]-[RELEASE]-win64.zip** - Main portable application
- **vscode-portable-[VERSION]-[RELEASE]-win64.exe** - Installer version

### Installation
1. Download the ZIP file
2. Extract to your desired location
3. Run vscode-portable.exe to start Visual Studio Code

### Notes
- This is a portable version that stores all settings and extensions in the application folder
- No installation required - just extract and run
- Fully compatible with official VS Code extensions and settings
```

## Testing Checklist

- [ ] Portable application starts correctly
- [ ] Settings are preserved in portable directory
- [ ] Extensions can be installed and work properly
- [ ] All VS Code features function as expected
- [ ] No registry modifications detected
- [ ] Clean uninstall (just delete folder)