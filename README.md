# material_you_dynamic_theme

A Flutter package that dynamically changes the app's theme based on the dominant colors extracted from the device's wallpaper. This package leverages Android's Dynamic Colors feature (API level 31 and above) for a seamless and visually appealing user experience.

**Note:** This package currently focuses on Android.



## How to use it?
**1.  Add the package to pubspec.yaml dependency:**

```yaml
dependencies:
  material_you_dynamic_theme: ^0.1.2
```

**2. Import package:**

```dart
import 'package:material_you_dynamic_theme/material_you_dynamic_theme.dart';
```

**3. Initialize and use the package:**

```dart
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runAppDynamic(
    home: MyHomePage(),
  );
}
```

![Screen Record](https://raw.githubusercontent.com/AKB0N/material_you_dynamic_theme/refs/heads/main/screenshots/screen.gif)

## Using the Dynamic Color Scheme

The `material_you_dynamic_theme` package generates a theme with a `ColorScheme` reflecting the dominant colors of the device's wallpaper.  This `ColorScheme` provides a consistent and accessible way to access various colors within your application's UI.  To use it, access the `Theme.of(context).colorScheme.` property within your widgets.

**Accessing Color Scheme Properties:**

The `ColorScheme` object offers a variety of properties representing different color roles, ensuring accessibility and consistency.  Here are some key properties:

* **`primary`:** The main color of your application.  Used for primary buttons, toolbars, and other prominent UI elements.
* **`onPrimary`:** The color used for text and icons on the `primary` background.  Should provide sufficient contrast.
* **`secondary`:**  A secondary color, often used for less prominent UI elements.
* **`onSecondary`:** The color used for text and icons on the `secondary` background.
* **`background`:** The color used for the main background of your app.
* **`onBackground`:** The color used for text and icons on the `background`.
* **`surface`:**  The color for surfaces like cards and dialogs.
* **`onSurface`:** The color for text and icons on surfaces.
* **`error`:** The color used for error messages and indicators.
* **`onError`:** The color for text and icons displayed within error messages.
* **`brightness`:** Indicates whether the `ColorScheme` is light or dark.

**Example Usage:**

```dart
class test extends StatelessWidget {
  const test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Theme.of(context).colorScheme.background,

      body: Column(
        children: [

          ElevatedButton(
            onPressed: () {/* Your button action */},
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            child: Text(
              'Primary Button',
              style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            ),
          ),


          Text(
            'Background Text',
            style: TextStyle(color: Theme.of(context).colorScheme.onBackground),
          ),


          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Surface Text',
                style:
                TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
```

This example demonstrates how to use the `colorScheme` to style an `ElevatedButton`, a Text widget on the background, and a container showing surface color. Remember to adapt these examples to your specific UI elements and design preferences.

## Custom Widget
The package provides custom widgets for convenient theme management:
A simple switch to toggle between light dark & system themes.

**Using ChangeThemeSwitchWidget:**

![Theme Switch Widget](https://raw.githubusercontent.com/AKB0N/material_you_dynamic_theme/refs/heads/main/screenshots/ThemeSwitchWidget.gif)

```dart
class test extends StatelessWidget {
  const test({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListTile(
          title: Text('Dark Mode'),
          trailing: ChangeThemeSwitchWidget(),
        ),
      ),
    );
  }
}
```

**Using ChangeThemeChoiceListTileWidget:**

![Screen Record](https://raw.githubusercontent.com/AKB0N/material_you_dynamic_theme/refs/heads/main/screenshots/ThemeChoiceListTileWidget.gif)

```dart
class test extends StatelessWidget {
  const test({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ChangeThemeChoiceListTileWidget(),
      ),
    );
  }
}
```

### Important Considerations:
Contrast: Always ensure sufficient contrast between text and background colors for accessibility.
Theme Data: The generated theme may not always provide perfectly contrasting colors. Consider adding logic to handle edge cases or fallback to default colors if necessary.
Accessibility: Prioritize accessible color combinations, especially for users with visual impairments. Refer to accessibility guidelines for suitable color contrast ratios.
This detailed documentation section clarifies how to leverage the dynamically generated `ColorScheme` effectively within your application, improving readability and usability for developers integrating your package.  Remember to update the example with actual widget usages relevant to your package.

## Important Considerations:
Android API Level: This package requires Android API level 31 or higher to fully utilize the `Dynamic Colors API`. For older versions, a fallback theme will be used.

### Contributing:
Contributions are welcome! Please open issues for bug reports and feature requests.

## Developer
By [Ibrahim Fathelbab](https://www.akbon.dev/ "Ibrahim Fathelbab")

&copy; All rights reserved.




















Okay, here's a comprehensive README.md file tailored for a pub.dev package, designed to be informative, user-friendly, and attractive to potential users of your staggered grid view.

# Flutter Staggered Grid View

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


