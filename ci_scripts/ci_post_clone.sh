#!/bin/zsh

cat <<file > Swatches/Swatches/Resources/DeveloperSettings.xcconfig
DEVELOPMENT_TEAM = Q4JH4MFFKH
PRODUCT_BUNDLE_IDENTIFIER[config=Debug] = com.ziplyne.swatchestool.debug
PRODUCT_BUNDLE_IDENTIFIER[config=Release] = com.ziplyne.swatchestool
file
