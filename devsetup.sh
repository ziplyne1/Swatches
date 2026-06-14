#!/bin/bash

echo ""
echo "Welcome to Swatches!"
echo "In order to build the app, you need to specify your Apple Development team."
echo "This script will make a DeveloperSettings.xcconfig file with your responses."
echo ""
echo "First, double-check that your working directory is the repo root."
read -p "Then, press enter to start…"

echo ""
echo "What is your Developer Team ID? You can find it at developer.apple.com."
read devTeamID
echo ""
echo "What is your Organization Identifier? (e.g. com.yourname)"
read orgID

cat <<file > Swatches/Swatches/Resources/DeveloperSettings.xcconfig
DEVELOPMENT_TEAM = $devTeamID
PRODUCT_BUNDLE_IDENTIFIER[config=Debug] = $orgID.swatchestool.debug
PRODUCT_BUNDLE_IDENTIFIER[config=Release] = $orgID.swatchestool
file

echo ""
echo "Done! You can now open Swatches.xcodeproj and build the app."
