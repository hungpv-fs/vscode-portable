# VS Code Portable - Development Guide

## Overview

This repository creates a portable version of Microsoft Visual Studio Code using the [Portapps](https://portapps.io) framework. The portable version runs without installation and stores all settings and extensions within the application folder.

## Development Workflow

### Automated Process

The repository includes an automated update system that:

1. **Checks for Updates** (twice weekly - Sunday and Wednesday at midnight UTC)
2. **Updates Configuration** (build.properties and CHANGELOG.md)
3. **Creates Tags** (triggers build process)
4. **Builds Artifacts** (portable application and installer)
5. **Creates Releases** (GitHub releases with artifacts)
6. **Updates Pages** (GitHub Pages with download links)

### Manual Process

For manual updates or development:

1. **Update Version**
   ```bash
   # Edit build.properties
   app.version = 1.XXX.X
   app.release = XX
   ```

2. **Update Changelog**
   ```bash
   # Add entry to CHANGELOG.md
   ## 1.XXX.X-XX (YYYY/MM/DD)
   
   * Visual Studio Code 1.XXX.X
   * Portapps 3.16.0
   ```

3. **Create Tag**
   ```bash
   git tag 1.XXX.X-XX
   git push origin 1.XXX.X-XX
   ```

4. **Build Process** (automatic via GitHub Actions)

## File Structure

```
vscode-portable/
├── .github/
│   ├── workflows/
│   │   ├── auto-update.yml    # Automated version checking
│   │   ├── build.yml          # Build and release process
│   │   ├── pages.yml          # GitHub Pages deployment
│   │   └── validate.yml       # Validation and linting
│   ├── ISSUE_TEMPLATE/
│   │   └── release.md         # Release template
│   └── PULL_REQUEST_TEMPLATE.md
├── res/                       # Resources (icons, scripts)
├── build.properties          # Application configuration
├── build.xml                 # Ant build script
├── CHANGELOG.md              # Version history
├── main.go                   # Go launcher application
├── go.mod                    # Go module dependencies
└── README.md                 # Documentation
```

## Configuration

### build.properties

Key configuration properties:

- `app.version`: VS Code version (e.g., 1.101.2)
- `app.release`: Release number (incremental)
- `atf.win64.url`: Download URL for VS Code archive

### Go Application

The `main.go` file creates a portable launcher that:
- Sets up portable data directories
- Configures VS Code environment variables
- Launches VS Code with proper settings

## Workflows

### auto-update.yml
- **Trigger**: Schedule (2x weekly) + manual
- **Purpose**: Check for new VS Code versions
- **Actions**: Update configuration, create tags

### build.yml
- **Trigger**: Tag creation
- **Purpose**: Build portable application
- **Actions**: Build artifacts, create GitHub release

### pages.yml
- **Trigger**: Release published
- **Purpose**: Update GitHub Pages
- **Actions**: Deploy download page

### validate.yml
- **Trigger**: Push/PR + manual
- **Purpose**: Validate code and configuration
- **Actions**: Lint code, validate formats

## Release Process

### Automated Release Flow

1. **Version Detection**: Auto-update checks Microsoft's VS Code repository
2. **Configuration Update**: Updates build.properties and CHANGELOG.md
3. **Tag Creation**: Creates version tag (e.g., 1.101.2-50)
4. **Build Trigger**: Tag creation triggers build workflow
5. **Artifact Creation**: Portapps framework builds portable application
6. **Release Creation**: GitHub release with artifacts and release notes
7. **Pages Update**: GitHub Pages updates with new download links

### Manual Release Flow

1. **Update Configuration**: Manually edit build.properties and CHANGELOG.md
2. **Create Tag**: `git tag VERSION-RELEASE && git push origin VERSION-RELEASE`
3. **Monitor Build**: Watch GitHub Actions for build completion
4. **Verify Release**: Check GitHub releases and Pages for artifacts

## Download Distribution

### GitHub Releases
- **URL**: https://github.com/hungpv-fs/vscode-portable/releases
- **Format**: Standard GitHub release with assets
- **Target**: Developers and advanced users

### GitHub Pages
- **URL**: https://hungpv-fs.github.io/vscode-portable/
- **Format**: User-friendly download page
- **Target**: End users and general public

## Testing

### Automated Testing
- **Validation**: Configuration format validation
- **Linting**: Go code formatting and linting
- **Build**: Artifact creation testing

### Manual Testing
- **Functionality**: Portable application launches correctly
- **Settings**: Configuration persistence in portable directory
- **Extensions**: Extension installation and functionality
- **Cleanup**: No registry or system modifications

## Contributing

1. **Fork Repository**: Create your own fork
2. **Create Branch**: Feature or fix branch
3. **Make Changes**: Follow coding standards
4. **Test Changes**: Validate configuration and code
5. **Submit PR**: Use provided PR template
6. **Review Process**: Automated and manual review

## Troubleshooting

### Common Issues

1. **Build Failures**: Check VS Code version availability
2. **URL Errors**: Verify download URL format
3. **Version Conflicts**: Ensure version/release number consistency
4. **Workflow Errors**: Check GitHub Actions logs

### Debug Steps

1. **Check Logs**: GitHub Actions workflow logs
2. **Validate Config**: Run validation workflow
3. **Test Locally**: Use Go toolchain for local testing
4. **Verify URLs**: Check VS Code download availability

## License

MIT License - See LICENSE file for details.

## Disclaimer

This project is not affiliated with Microsoft Corporation. Visual Studio Code is a trademark of Microsoft Corporation.