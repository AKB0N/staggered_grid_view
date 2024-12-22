import 'package:flutter/material.dart';
import 'package:staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Staggered Grid View Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _scrollController = ScrollController();
  int currentIndex = 0;

  List<Widget> screens = [
    buildFixedCountGrid(),
    buildMaxExtentGrid(),
    buildInfiniteGrid(),
    buildDynamicGrid(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid View Examples')),
      body: PrimaryScrollController(
          controller: _scrollController, child: screens[currentIndex]),
      bottomNavigationBar: NavigationBar(
        // key: navigationKey,
        animationDuration: const Duration(milliseconds: 300),
        selectedIndex: currentIndex,
        backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
        indicatorColor: Theme.of(context).colorScheme.onInverseSurface,
        surfaceTintColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        overlayColor: WidgetStateColor.resolveWith(
          (states) => Theme.of(context).colorScheme.onInverseSurface,
        ),
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        destinations: <NavigationDestination>[
          NavigationDestination(
            selectedIcon: const Icon(Icons.grid_view_rounded),
            icon: const Icon(Icons.grid_view_outlined),
            label: 'FixedCountGrid',
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.grid_view_rounded),
            icon: const Icon(Icons.grid_view_outlined),
            label: 'MaxExtentGrid',
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.grid_view_rounded),
            icon: const Icon(Icons.grid_view_outlined),
            label: 'InfiniteGrid',
          ),
          NavigationDestination(
            selectedIcon: const Icon(Icons.grid_view_rounded),
            icon: const Icon(Icons.grid_view_outlined),
            label: 'DynamicGrid',
          ),
        ],
      ),
    );
  }
}

Widget buildFixedCountGrid() {
  return StaggeredGridView.count(
    crossAxisCount: 4,
    staggeredTiles: const [
      StaggeredTile.count(2, 2),
      StaggeredTile.count(1, 2),
      StaggeredTile.count(1, 1),
      StaggeredTile.count(1, 2),
      StaggeredTile.count(2, 1),
      StaggeredTile.count(1, 1),
    ],
    children: List.generate(
        6,
        (index) => Card(
              color: Colors.blue.shade100,
              child: Center(child: Text('Item $index')),
            )),
  );
}

Widget buildMaxExtentGrid() {
  return StaggeredGridView.extentBuilder(
    maxCrossAxisExtent: 200,
    itemCount: 20,
    staggeredTileBuilder: (index) =>
        StaggeredTile.count((index % 3) + 1, (index % 5) + 1),
    itemBuilder: (context, index) => Card(
        color: Colors.green.shade100,
        child: Center(child: Text('Item $index'))),
  );
}

Widget buildInfiniteGrid() {
  return StaggeredGridView.countBuilder(
    crossAxisCount: 3,
    itemCount: 100,
    staggeredTileBuilder: (index) => StaggeredTile.count(1, 1 + (index % 3)),
    itemBuilder: (context, index) => Card(
        color: Colors.orange.shade100,
        child: Center(child: Text('Item $index'))),
  );
}

Widget buildDynamicGrid() {
  return StaggeredGridView.custom(
    gridDelegate: SliverStaggeredGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        staggeredTileBuilder: (index) {
          if (index.isEven)
            return StaggeredTile.count(1, 1);
          else
            return StaggeredTile.count(2, 2);
        },
        mainAxisSpacing: 8,
        crossAxisSpacing: 8),
    childrenDelegate: SliverChildBuilderDelegate(
        (context, index) => Card(
            color: Colors.red.shade100,
            child: Center(child: Text('Item $index'))),
        childCount: 30),
  );
}
