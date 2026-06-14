# Swatches
An iOS app for previewing various SwiftUI views

## Contributing
All contributions are welcome. Please open a pull request and give a clear description of your changes.

In order to add a new swatch, add a new `Swatch` instance to the `swatches` array in `Swatches.swift`. Then, add a new file to `Views/Swatches/` with your view for the swatch. 

### Building
In order to keep the .xcodeproj of the demo app clean, please run the setup.sh script before building the app, as it configures local signing settings required for the demo app to build. It will create a file called DeveloperSettings.xcconfig which will not be committed to GitHub.

You may need to run chmod +x setup.sh to make the script executable.
