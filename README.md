# Wiktor's sample app

A sample Flutter application.

## Getting Started

For help getting started with Flutter, view online
[documentation](https://flutter.io/).

**To open and build APK file in Ubuntu 20.04:**

(Assumption is made that Android Studio is already installed in your system).

1. Install Flutter: 

```
sudo snap flutter --classic
```

2. Initialize Flutter:

flutter doctor

3. Install Dart:

```
sudo apt install apt-transport-https
sudo sh -c 'wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'
sudo sh -c 'wget -qO- https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'
sudo apt update
sudo apt install dart
```

4. Set up the path do Android SDK:

```
export ANDROID_HOME="$HOME/.android-sdk"
```

5. Configure Android Studio path in Flutter:

```
flutter config --android-studio-dir=/home/wiktor/.programy/AndroidStudio
```

6. Accept Android licenses:

```
flutter doctor --android-licenses
```

7. Check the current setup of flutter:

```
flutter doctor
```

It should show output similar to the following:

```
[✓] Flutter (Channel stable, 1.20.3, on Linux, locale en_US.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK version 30.0.2)
[!] Android Studio
    ✗ Flutter plugin not installed; this adds Flutter specific functionality.
    ✗ Dart plugin not installed; this adds Dart specific functionality.
[!] Connected device
    ! No devices available

! Doctor found issues in 2 categories.
```

You can ignore the message saying that Android Studio doesn't have Flutter and Dart plugins installed. Even when the plugins are installed in Android Studio, flutter doctor may still report them missing.

8. Check out the project:

```
git clone https://github.com/syrop/Flutter-Demo.git
```

9. Install Dart plugin in Android Studio.

```
Go to File->Settings->Plugins and install Dart from marketplace.
```

10. Installation instructions of Flutter plugin are different depending on the Android Studio version:

10.a. Android Studio 4.0: Go to File->Settings->Plugins and install Dart from marketplace.

10.b. Android Studio 4.2 Canary 9: Due to a bug in Flutter Plugin 49.0.4 I suggest installing version 48.1.4 downloaded from:

https://plugins.jetbrains.com/plugin/9212-flutter/

In Android Studio go to File->Settings->Plugins, click on the cog button and select "Install Plugin From disk...". Install the Zip file.

You can view the story of the bug in the following ticket:

https://github.com/flutter/flutter-intellij/issues/4806

11. Set Dart SDK path. Go to File->Settings->Languages & Frameworks->Schemas and DTDs->Dart. Check "Enable Dart support for the project 'Flutter-Demo'. In the section "Enable Dart Support for the following modules:" check both modules). Then enter the path:

```
/home/wiktor/snap/flutter/common/flutter/bin/cache/dart-sdk
```

12. Set Flutter SDK path. Go to File->Settings->Languages & Frameworks->Schemas and DTDs->Dart. Enter the path:

```
/home/wiktor/snap/flutter/common/flutter
```

13. Get and upgrade the dependencies:

```
flutter pub get
flutter pub upgrade
```

14. Build the APK file:

```
flutter build apk
```
