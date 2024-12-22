# staggered_grid_view

A flexible and performant Flutter package for creating staggered grid layouts, offering various configuration options for both fixed and dynamic content.

[![pub package](https://img.shields.io/pub/v/staggered_grid_view.svg)](https://pub.dev/packages/staggered_grid_view)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## Features

-   **Staggered Layout:** Create visually appealing layouts with variable-sized items spanning multiple rows and columns.
-   **Fixed and Dynamic Extents:** Support for both fixed-size grids and grids that adapt to the size of the content.
-   **Customizable Delegates:** Configure the layout with various delegates for cross-axis count, max-extent, and custom tile sizes.
-   **Lazy Loading:** Efficiently handle large datasets with lazy child creation and caching.
-   **Automatic Keep-Alives:** Option to keep widgets alive for smoother transitions during scrolling.
-   **Simple Usage:** Easy-to-use API similar to Flutter's built-in `GridView`.

## Getting Started

### Installation

Add the package to your `pubspec.yaml` file:

```yaml
dependencies:
  staggered_grid_view: ^0.0.1
  
 ```

Use code with caution.
Markdown

Then, run flutter pub get.

## Usage
Here are a few basic examples to get you started.

Basic Staggered Grid with Fixed Cross-Axis Count
```dart
import 'package:flutter/material.dart';
import '<your_package_name>/<your_package_name>.dart'; // Replace with the actual import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Staggered Grid View')),
        body: StaggeredGridView.count(
          crossAxisCount: 4,
          staggeredTiles: const [
            StaggeredTile.count(2, 2),
            StaggeredTile.count(1, 2),
            StaggeredTile.count(1, 1),
            StaggeredTile.count(1, 2),
            StaggeredTile.count(2, 1),
            StaggeredTile.count(1, 1),
          ],
          children: List.generate(6, (index) => Card(
            color: Colors.blue.shade100,
            child: Center(child: Text('Item $index')),
          )),
        ),
      ),
    );
  }
}
```
Use code with caution.
Dart
Staggered Grid with Max Cross-Axis Extent and Dynamic Children


```dart
import 'package:flutter/material.dart';
import '<your_package_name>/<your_package_name>.dart'; // Replace with the actual import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Staggered Grid View')),
        body: StaggeredGridView.extentBuilder(
          maxCrossAxisExtent: 200,
           itemCount: 20,
           staggeredTileBuilder: (index) => StaggeredTile.count(
                (index % 3) + 1, (index % 5) + 1),
          itemBuilder: (context, index) => Card(
              color: Colors.green.shade100,
              child: Center(child: Text('Item $index'))
            ),
        ),
      ),
    );
  }
}
```


Use code with caution.
Dart
Staggered Grid with Builder for Infinite Items

```dart
import 'package:flutter/material.dart';
import '<your_package_name>/<your_package_name>.dart'; // Replace with the actual import

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Staggered Grid View')),
        body: StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          itemCount: 100,
          staggeredTileBuilder: (index) => StaggeredTile.count(1, 1 + (index % 3)),
          itemBuilder: (context, index) => Card(
              color: Colors.orange.shade100,
              child: Center(child: Text('Item $index'))
            ),
        ),
      ),
    );
  }
}
```

## Key Classes
StaggeredGridView: The main widget for rendering the staggered grid.

StaggeredTile: A class to define the size of individual grid items in cross and main axes.

SliverStaggeredGridDelegate: Abstract class for creating custom layout delegates.

SliverStaggeredGridDelegateWithFixedCrossAxisCount: A concrete delegate for defining grid layouts with a fixed cross-axis count.

SliverStaggeredGridDelegateWithMaxCrossAxisExtent: A concrete delegate for defining grid layouts with a max cross-axis extent.

## API Overview
Explore the API documentation for more details on available options. This package mirrors the common API of GridView, offering familiar parameters like:

* scrollDirection
* reverse
* controller
* primary
* physics
* shrinkWrap
* padding
* addAutomaticKeepAlives

And custom parameters for building your Staggered Grid:

* crossAxisCount: Number of columns. Use with StaggeredGridView.count and StaggeredGridView.countBuilder

* maxCrossAxisExtent: Max width of an item on the cross axis. Use with StaggeredGridView.extent and StaggeredGridView.extentBuilder

* staggeredTiles: List of StaggeredTile. Use with StaggeredGridView.count and StaggeredGridView.extent.

* staggeredTileBuilder: Function to build StaggeredTile. Use with StaggeredGridView.countBuilder and StaggeredGridView.extentBuilder.

## Example App
For a more comprehensive example, see the example folder in this repository.

## Contributing
Contributions are welcome! Please feel free to submit bug reports, feature requests, and pull requests on GitHub.

## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Issues
If you encounter any issues or have suggestions, please open an issue on [GitHub](<your_github_repo_url>/issues).

## Sponsors
I want to thank [Tommy][first_sponsor] for sponsoring this package. Thanks to him, I took the time to investigate in the previous performance issues and refactor this library to make it how is it today.

<table>
  <tr>
    <td align="center"><a href="https://github.com/Tom3652"><img src="https://avatars.githubusercontent.com/u/32631467?v=4" width="100px;" alt=""/><br /><sub><b>Tom3652</b></sub></a><br /></td>
  </tr>
</table>
## Developer
By [Ibrahim Fathelbab](https://www.akbon.dev/ "Ibrahim Fathelbab")

&copy; All rights reserved.

Support the Package
If you like this package, please consider giving it a star on GitHub.


