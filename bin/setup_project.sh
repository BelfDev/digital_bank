#!/bin/sh

echo "\n=============================="
echo "👋 Welcome to the Setup Script"
echo "==============================\n"
echo "Before we begin, we need to make sure that Flutter and Dart are installed on your machine.\n"

## Dependency check

# $1 => Dependency name
# $2 => Installation function
suggestInstallation() {
  echo "⚠️ Something is wrong with $1.\n"
  while true; do
      read -p "Do you wish to install $1?" yn
      case $yn in
          [Yy]* ) $2; break;;
          [Nn]* ) exit;;
          * ) echo "Please answer yes or no. [Y/N]\n";;
      esac
  done
}

showFlutterErrorFeedback() {
  echo "⚠️ Something is wrong with Flutter.\n"
  echo "Please visit https://flutter.dev/docs/get-started/install and make sure Flutter 3.7.1 is installed on your machine."
  exit
}

flutter --version || showFlutterErrorFeedback
echo "⭐ All good with Flutter.\n\n"

echo "🚀 Now we're about to install some helper tooling...\n\n"

echo "Setting up Melos..."
flutter pub global activate melos 1>/dev/null
echo "\n✅ Nice, you can work with a multi-package project\n\n"


echo "Installing all dependencies and localizations..."
flutter pub global run melos bootstrap 1>/dev/null


echo "\n========================================"
echo "✅ You are now ready to run the project!"
echo "========================================\n"
