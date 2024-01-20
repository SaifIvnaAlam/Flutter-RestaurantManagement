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

Note: Make sure to Make the variable name all capital letters

2.Add the route to the file: `go_router_config.dart` inside the router

Example:

```js
   GoRoute(
      name: NamedRoute.EXAMPLE,
      path: '/examplePage',
      builder: (context, state) => const Example(),
    ),
```
