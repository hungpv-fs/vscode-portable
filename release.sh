#!/bin/bash

# VS Code Portable Release Script
# This script helps manually trigger a release by updating version and creating a tag

set -e

echo "🚀 VS Code Portable Release Helper"
echo "=================================="

# Get current version
CURRENT_VERSION=$(grep "^app.version" build.properties | cut -d'=' -f2 | tr -d ' ')
CURRENT_RELEASE=$(grep "^app.release" build.properties | cut -d'=' -f2 | tr -d ' ')

echo "Current version: $CURRENT_VERSION"
echo "Current release: $CURRENT_RELEASE"

# Ask for new version
echo ""
read -p "Enter new VS Code version (e.g., 1.103.0): " NEW_VERSION
read -p "Enter new release number (e.g., $((CURRENT_RELEASE + 1))): " NEW_RELEASE

# Validate inputs
if [[ ! $NEW_VERSION =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "❌ Invalid version format. Use X.Y.Z format."
    exit 1
fi

if [[ ! $NEW_RELEASE =~ ^[0-9]+$ ]]; then
    echo "❌ Invalid release number. Use numbers only."
    exit 1
fi

echo ""
echo "Updating to VS Code $NEW_VERSION (release $NEW_RELEASE)..."

# Update build.properties
sed -i "s/^app.version = .*/app.version = $NEW_VERSION/" build.properties
sed -i "s/^app.release = .*/app.release = $NEW_RELEASE/" build.properties

# Update CHANGELOG.md
CURRENT_DATE=$(date +%Y/%m/%d)
NEW_ENTRY="## $NEW_VERSION-$NEW_RELEASE ($CURRENT_DATE)\n\n* Visual Studio Code $NEW_VERSION\n* Portapps 3.16.0\n\n"

# Add new entry after the first line (# Changelog)
sed -i "1a\\$NEW_ENTRY" CHANGELOG.md

echo "✅ Files updated successfully!"
echo ""
echo "Next steps:"
echo "1. Review the changes: git diff"
echo "2. Commit the changes: git add . && git commit -m 'Update VS Code to version $NEW_VERSION'"
echo "3. Create and push tag: git tag '$NEW_VERSION-$NEW_RELEASE' && git push origin '$NEW_VERSION-$NEW_RELEASE'"
echo "4. The build workflow will trigger automatically and create the release"
echo ""
echo "🎉 Release preparation complete!"