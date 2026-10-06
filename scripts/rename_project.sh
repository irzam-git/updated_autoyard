#!/bin/bash

# ==============================================================================
# Project Renaming Utility for Flutter Boilerplate
# Usage: ./scripts/rename_project.sh <new_package_name> <new_bundle_id>
# Example: ./scripts/rename_project.sh my_new_app com.example.mynewapp
# ==============================================================================

set -e

NEW_NAME=$1
NEW_BUNDLE_ID=$2

if [ -z "$NEW_NAME" ]; then
  echo "❌ Error: Please provide the new app name (snake_case)."
  echo "Usage: ./scripts/rename_project.sh <new_package_name> [new_bundle_id]"
  exit 1
fi

OLD_NAME="start"

echo "🚀 Renaming project from '$OLD_NAME' to '$NEW_NAME'..."

# Update pubspec.yaml
sed -i '' "s/name: $OLD_NAME/name: $NEW_NAME/g" pubspec.yaml

# Update Dart imports across lib and test
find lib test -type f -name "*.dart" -exec sed -i '' "s/package:$OLD_NAME\//package:$NEW_NAME\//g" {} +

# Clean build and rerun code generation
flutter pub get
dart run build_runner build --delete-conflicting-outputs

echo "🎉 Project successfully renamed to $NEW_NAME!"
if [ -n "$NEW_BUNDLE_ID" ]; then
  echo "ℹ️ To rename Android package / iOS bundle ID, you can use: flutter pub run change_app_package_name:main $NEW_BUNDLE_ID"
fi
