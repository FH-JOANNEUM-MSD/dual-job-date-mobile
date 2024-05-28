# dual_job_date_mobile

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Notes
### json_serializable
See company.dart and corresponding company.g.dart
Generate file: `dart run build_runner build`
Important: .g File must have the same naming as the main File (e.g. company.dart and company.g.dart)

# Documentation

## Table of Contents

[User](#user)
- [Login](#login)
- [Forgot Passwort](#forgot-password)
- [First Login](#first-login)
- [Companies](#companies)
- [More Screen](#more-screen)

[Developer](#developer)
- [Branches](#branches)
- [BLoC](#bloc)
- [BLoC example](#bloc-example)

## User

### Login

For the login, the user just has to fill in the data thats required in the boxes.

<img src="/assets/images/documentation/Login.png" width="250" height="500">

### Forgot Password

In the forgot password screen, the user has to put the required email, linked to the account of the application and a reset for the password will be sent to this email.

<img src="/assets/images/documentation/ResetPassword.png" width="250" height="500">

### First Login

At the first login the user has to change the generated password to a new password that the user either has to generate or think up by himself/herself.

<img src="/assets/images/documentation/FirstLogin.png" width="250" height="500">

### Companies

On this screen the user can see all companies that are registered in the application of the dual job dating.

<img src="/assets/images/documentation/Companies.png" width="250" height="500">

### More Screen

On this screen there are two links to the imprint and the data privacy statement and the user can change the first and lastname.

<img src="/assets/images/documentation/MoreScreen.png" width="250" height="500">
<img src="/assets/images/documentation/MoreScreen2.png" width="250" height="500">

## Developer

### Branches

[Link to Repo](https://github.com/FH-JOANNEUM-MSD/dual-job-date-mobile)

#### main

The main branch is the branch that will be pushed to the productiv system (App Store and Google Play Store).

#### development

The development branch is used as a main branch for the developers. Everytime a developer wants to make new feature or work on a bug, the developer creates a new branch from the current developer branch and when the workload is finished the pull request will be created for the developer branch and tested on the developer branch. Afterwards the developer branch will be merged into the main branch, so it will be assured, that the main branch always has a working product ready for release.

### BLoC

[Link to the library](https://bloclibrary.dev/)

We used the BLoC library (Business Logic Component) in our project to seperate the presentation from business logic, be able to code fast and most importantly, make the code reusable.

BLoC was created so the developer

- knows what the state of the application is at any point
- can easily test every case to make sure the app is responding appropriatly
- record every single user interaction in the application so data-driven decisions can be made
- can work as efficiently as possible and reuse components both within the application and across other applications
- can have many developers working seamlessly within a single code base following the same patterns and conventions
- develop fast and reactive apps

In all places, where a connection to the Rest API is required, BLoC is used.

### BLoC Example

This section demonstrates the implementation of the BLoC pattern for managing the login functionality of a Flutter application.

The login functionality is divided into the following components:

1. Authentication BLoC: Handles the business logic and state management.
2. Authentication Events: Defines the events that can trigger state changes in the bloc.
3. Authentication States: Represents the different states the application can be in.
4. Login Service: Manages the actual authentication logic and communication with the backend.

#### Authentication BLoC
