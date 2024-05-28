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

[Developer](#developer)
- [Branches](#branches)
- [Bloc](#bloc)

## User

### Login

For the login, the user just has to fill in the data thats required in the boxes.

![Login Image](/images/Login.png)



### Forgot Password

In the forgot password screen, the user has to put the required email, linked to the account of the application and a reset for the password will be sent to this email.

### First Login

At the first login the user has to change the generated password to a new password that the user either has to generate or think up by himself/herself.

## Developer

### Branches

[Link to Repo](https://github.com/FH-JOANNEUM-MSD/dual-job-date-mobile)

#### main

The main branch is the branch that will be pushed to the productiv system (App Store and Google Play Store).

#### development

The development branch is used as a main branch for the developers. Everytime a developer wants to make new feature or work on a bug, the developer creates a new branch from the current developer branch and when the workload is finished the pull request will be created for the developer branch and tested on the developer branch. Afterwards the developer branch will be merged into the main branch, so it will be assured, that the main branch always has a working product ready for release.

### Bloc

[Link to the library](https://bloclibrary.dev/)

We used the Bloc library in our project to seperate the presentation from business logic, be able to code fast and most importantly, make the code reusable.

Bloc was created so the developer

- knows what the state of the application is at any point
- can easily test every case to make sure the app is responding appropriatly
- record every single user interaction in the application so data-driven decisions can be made
- can work as efficiently as possible and reuse components both within the application and across other applications
- can have many developers working seamlessly within a single code base following the same patterns and conventions
- develop fast and reactive apps

In all places, where a connection to the Rest API is required, Bloc is used.