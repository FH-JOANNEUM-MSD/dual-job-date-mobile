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
The password must be at least 8 characters long
The password must contain at least 1 upper case and 1 lowercase character
The password must contain at least 1 number
The password must contain at least 1 special character from the following set of characters @$!%*?&_

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
5. Login Screen Implementation: Represents how the screen is made in flutter.

#### Authentication BLoC

The ```AuthenticationBloc``` listens for ```AuthenticationEvent``` and emits different ```AuthenticationState``` based on the login process.


```
class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationStateInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthenticationStateChanged(AuthenticationStatus.PENDING));
      var loginResponse = await LoginService.login(event.email, event.password);
      if (loginResponse.statusCode == 200) {
        if (loginResponse.isNew) {
          emit(AuthenticationStateChanged(AuthenticationStatus.FIRSTLOGIN));
        } else {
          emit(AuthenticationStateChanged(AuthenticationStatus.AUTHENTICATED));
        }
      } else {
        emit(AuthenticationStateChanged(AuthenticationStatus.UNAUTHENTICATED));
      }
    });

    on<RefreshBearerEvent>((event, emit) async {
      var isAuthenticated = await LoginService.isAuthenticated();
      emit(isAuthenticated ? AuthenticationStatus.AUTHENTICATED : AuthenticationStatus.UNAUTHENTICATED);
    });

    on<LogoutEvent>((event, emit) async {
      await LoginService.flushStorage();
      emit(AuthenticationStatus.UNAUTHENTICATED);
    });
  }
}
``` 

#### Authentication Events

The ```AuthenticationEvent``` class defines the events for the authentication process.

```
abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final String email;
  final String password;
  LoginEvent(this.email, this.password);
}

class RefreshBearerEvent extends AuthenticationEvent {}

class LogoutEvent extends AuthenticationEvent {}
```

#### Authentication States

The ```AuthenticationState``` class represents the different states of the authentication process.

```
enum AuthenticationStatus {
  UNKNOWN,
  PENDING,
  FIRSTLOGIN,
  AUTHENTICATED,
  UNAUTHENTICATED
}

abstract class AuthenticationState {
  late AuthenticationStatus status;
}

class AuthenticationStateInitial extends AuthenticationState {
  @override
  AuthenticationStatus get status => AuthenticationStatus.UNKNOWN;
}

class AuthenticationStateChanged extends AuthenticationState {
  final AuthenticationStatus status;
  AuthenticationStateChanged(this.status);
}
```

#### Login Service

The ```LoginService``` manages the login process and token management.

```
class LoginService {
  static Future<LoginResponse> login(String email, String password) async {
    var body = {'email': email, 'password': password};
    final response = await HTTPHelper.post('User/Login', body);
    if (response.statusCode == 200) {
      return LoginResponse.fromJson(jsonDecode(response.body));
    } else {
      return LoginResponse.error(response.statusCode);
    }
  }

  static Future<bool> isAuthenticated() async {
    // Implementation for checking authentication status
  }

  static Future<void> flushStorage() async {
    await const FlutterSecureStorage().deleteAll();
  }
}
```

#### Login Screen Implementation

The ```Login``` screen utilizes the ```AuthenticationBloc``` to handle user login actions and state changes.

```
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            if (state.status == AuthenticationStatus.FIRSTLOGIN) {
              Navigator.pushNamed(context, '/set_new_password');
            } else if (state.status == AuthenticationStatus.AUTHENTICATED) {
              Navigator.pushReplacementNamed(context, '/home');
            } else if (state.status == AuthenticationStatus.UNAUTHENTICATED) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Invalid credentials')),
              );
            }
          },
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                ),
                BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    return state.status == AuthenticationStatus.PENDING
                        ? CircularProgressIndicator()
                        : ElevatedButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                BlocProvider.of<AuthenticationBloc>(context).add(
                                  LoginEvent(_emailController.text, _passwordController.text),
                                );
                              }
                            },
                            child: Text('Login'),
                          );
                  },
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot_password');
                  },
                  child: Text('Forgot Password?'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
```

#### Summary

With this example, the BLoC pattern is used to manage the state of the login process. The ```AuthenticationBloc``` handles the business logic, the ```AuthenticationEvent``` and ```AuthenticationState``` define the possible events and states, and the ```LoginService``` manages communication with the backend. This setup makes the codebase more maintainable and testable.
