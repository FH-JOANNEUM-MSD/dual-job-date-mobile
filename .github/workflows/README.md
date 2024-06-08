# Dual Job Dating CI/CD Pipeline

A CI/CD Pipeline for the Section App of the Dual Job Dating project. The goal of this Pipeline is the automatic building/testing and deployment of Flutter Apps to Google Playstore and Apple App Store, although currently only the deployment to Playstore is fully implemented, the preparations for the App Store can be found in the branch feature/cicd, the necessary credentials to put into the secrets have yet to be provided. 

## CI/CD Pipeline Documentation

This YAML file defines a Continuous Integration/Continuous Deployment (CI/CD) pipeline for a Flutter project using GitHub Actions. The pipeline is triggered on push or pull request events to the main branch, and on release creation.

### Jobs
The pipeline consists of multiple jobs: `test`, `build-android`, `release-android`, `notify_failure`, and `notify_success`.

#### Test Job

The `test` job performs the following steps:

1. **Checkout code**: This step checks out the repository code using the `actions/checkout@v2` action.
2. **Set up Flutter**: This step sets up Flutter on the runner using the `subosito/flutter-action@v2` action. The Flutter version used is '3.19.2'.
3. **Cache Flutter dependencies**: This step caches the Flutter dependencies to speed up future runs using the `actions/cache@v2` action. The cache key is based on the runner OS and the hash of the `pubspec.yaml` and `pubspec.lock` files.
4. **Install dependencies**: This step installs the Flutter dependencies using the `flutter pub get` command.
5. **Run tests**: This step runs the Flutter tests using the `flutter test` command.

#### Build-Android Job

The `build-android` job runs only if the event is a release and the branch is 'main'. It depends on the `test` job and performs the following steps:

1. **Checkout code**: This step checks out the repository code using the `actions/checkout@v2` action.
2. **Setup Java to compile Android project**: This step sets up Java on the runner using the `actions/setup-java@v1` action.
3. **Set up Flutter**: This step sets up Flutter on the runner using the `subosito/flutter-action@v2` action. The Flutter version used is '3.19.2'.
4. **Cache Flutter dependencies**: This step caches the Flutter dependencies to speed up future runs using the `actions/cache@v2` action. The cache key is based on the runner OS and the hash of the `pubspec.yaml` and `pubspec.lock` files.
5. **Install dependencies**: This step installs the Flutter dependencies using the `flutter pub get` command.
6. **Create the Android Keystore**: This step creates the Keystore for signing the Android app bundle. The Keystore is created from a base64-encoded secret stored in the repository secrets.
7. **Build Android app**: This step builds the Android app bundle using the `flutter build appbundle --release` command. Note: The build types release signing config in `build.gradle` has to be set to NULL to allow later signing from secrets.
8. **Sign Android App Bundle**: This step signs the Android app bundle using the `jarsigner` command. The Keystore, store password, and key password are retrieved from the repository secrets.
9. **Archive Android app**: This step archives the signed Android app bundle using the `actions/upload-artifact@v2` action. The artifact is named 'release-aab-signed' and is stored at the specified path.

#### Release-Android Job

The `release-android` job releases the Android app to the internal track on Google Play. It depends on the `build-android` job and performs the following steps:

1. **Checkout code**: This step checks out the repository code using the `actions/checkout@v1` action.
2. **Get app bundle from artifacts**: This step retrieves the signed app bundle from the artifacts using the `actions/download-artifact@v2` action.
3. **Release app to internal track**: This step releases the app to the internal track on Google Play using the `r0adkll/upload-google-play@v1` action.

#### Notify Failure Job

The `notify_failure` job runs if any of the jobs `test`, `build-android`, or `release-android` fail. It performs the following steps:

1. **Get Committer Username**: This step retrieves the committer's username using a Git command.
2. **Send Discord Notification on Failure**: This step sends a notification to a Discord channel using the provided webhook URL.

#### Notify Success Job

The `notify_success` job runs if all jobs `test`, `build-android`, and `release-android` succeed. It performs the following steps:

1. **Get Committer Username**: This step retrieves the committer's username using a Git command.
2. **Check if Build and Deploy are Successful**: This step checks the success status of the build and deploy jobs.
3. **Send Discord Notification on Success**: This step sends a notification to a Discord channel using the provided webhook URL.
