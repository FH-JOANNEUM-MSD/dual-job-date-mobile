# Dual Job Dating CI/CD Pipeline

A CI/CD Pipeline for the Section App of the Dual Job Dating project. The goal of this Pipeline is the automatic building/testing and deployment of Flutter Apps to Google Playstore and Apple App Store. 

## CI/CD Pipeline Documentation

This YAML file defines a Continuous Integration/Continuous Deployment (CI/CD) pipeline for a Flutter project using GitHub Actions. The pipeline is triggered on push or pull request events to the main branch, and on release creation.

### Jobs

The pipeline consists of two jobs: `build` and `deploy`.

#### Build Job

The `build` job performs the following steps:

1. **Checkout code**: This step checks out the repository code using the `actions/checkout@v2` action.

2. **Set up Flutter**: This step sets up Flutter on the runner using the `subosito/flutter-action@v2` action. The Flutter version used is '3.19.2',

3. **Cache Flutter dependencies**: This step caches the Flutter dependencies to speed up future runs using the `actions/cache@v2` action. The cache key is based on the runner OS and the hash of the `pubspec.yaml` and `pubspec.lock` files.

4. **Install dependencies**: This step installs the Flutter dependencies using the `flutter pub get` command.

5. **Run tests**: This step runs the Flutter tests using the `flutter test` command.

#### Deploy Job

The `deploy` job runs only if the event is a release and the branch is 'main'. It also depends on the `build` job. It performs the following steps:

1. **Checkout code**: This step checks out the repository code using the `actions/checkout@v2` action.

2. **Setup Java to compile Android project**: This step sets up Java on the runner using the `actions/setup-java@v1` action. 

3. **Set up Flutter**: This step sets up Flutter on the runner using the `subosito/flutter-action@v2` action. The Flutter version used is '3.19.2'.

4. **Cache Flutter dependencies**: This step caches the Flutter dependencies to speed up future runs using the `actions/cache@v2` action. The cache key is based on the runner OS and the hash of the `pubspec.yaml` and `pubspec.lock` files.

5. **Install dependencies**: This step installs the Flutter dependencies using the `flutter pub get` command.

6. **Create the Keystore**: This step creates the Keystore for signing the Android app bundle. The Keystore is created from a base64-encoded secret stored in the repository secrets.

7. **Build Android app**: This step builds the Android app bundle using the `flutter build appbundle --release` command.NOTE: the buildtypes release signing config in build.gradle has to be set to NULL to allow later signing from secrets.

8. **Sign Android App Bundle**: This step signs the Android app bundle using the `jarsigner` command. The Keystore, store password, and key password are retrieved from the repository secrets.

9. **Archive Android app**: This step archives the signed Android app bundle using the `actions/upload-artifact@v2` action. The artifact is named 'release-aab-signed' and is stored at the specified path.