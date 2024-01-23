<h1 style="color: orange;">🍊Project: Orange App </h1>

Orange is a powerful and free Restaurant Management tool designed to streamline and enhance your restaurant operations. With user-friendly features and a robust set of tools, Orange empowers restaurant owners and staff to efficiently manage orders, inventory, and overall business processes

## Project Folder Structure

```C++
 📁 Lib(Main)
  📁 Src
   📁 auth(App Authentication Handle)
   📁 constants(Global helper functions/widgets/utils)
   📁 features(Holds each features of the total app)
   📁 routes (Routing Configure)
```

## Routing

All the routing configuration is happening in the file:

```dart
go_router_config.dart
//and
go_router_constants.dart
```

To add a new route

1. Create a Named route in the file:

```js
go_router_constants.dart;
```

Example :

```js
  static const EXAMPLE_PAGE = '/examplePage';
```

Note: Make sure to Make the variable name all capital letters. Add the route to the file: `go_router_config.dart` inside the router

Example:

```js
   GoRoute(
      name: NamedRoute.EXAMPLE,
      path: '/examplePage',
      builder: (context, state) => const Example(),
    ),
```

## Tests

Change the global variable `isTesting` to true in the file: `main.dart` which will run the test version of the application.

`Function_test_screen.dart`: Is to test the response of functions

## log

To log any message to the console, use the factory functions of `Klog` class in `show_error.dart`

## Creating a new Feature with Mason

- install Mason cli

```js
  dart pub global activate mason_cli
```

- install Mason

```js
  dart pub global activate mason
```

[More info](https://pub.dev/packages/mason_cli)

- Creating new feature

```js
mason make feature
```

**NOTE**

This will create the basic folder structure of the feature inside the features folder.
