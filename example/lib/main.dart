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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Staggered Grid View Examples')),
      body: PrimaryScrollController(
        controller: _scrollController,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: const EdgeInsets.fromLTRB(0, 0, 0, 120),
          addAutomaticKeepAlives: true,
          children: [
            _buildExampleCard(
              context,
              title: 'Staggered Grid with Fixed Cross-Axis Count',
              child: _buildFixedCountGrid(),
            ),
            _buildExampleCard(
              context,
              title: 'Staggered Grid with Max Cross-Axis Extent',
              child: _buildMaxExtentGrid(),
            ),
            _buildExampleCard(
              context,
              title: 'Staggered Grid with Builder for Infinite Items',
              child: _buildInfiniteGrid(),
            ),
            _buildExampleCard(
              context,
              title: 'Staggered Grid with different layouts',
              child: _buildDynamicGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildExampleCard(BuildContext context,
      {required String title, required Widget child}) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            SizedBox(
              height: 300,
              child: child,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFixedCountGrid() {
    return StaggeredGridView.count(
      physics: const NeverScrollableScrollPhysics(),
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

  Widget _buildMaxExtentGrid() {
    return StaggeredGridView.extentBuilder(
      maxCrossAxisExtent: 200,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 20,
      staggeredTileBuilder: (index) =>
          StaggeredTile.count((index % 3) + 1, (index % 5) + 1),
      itemBuilder: (context, index) => Card(
          color: Colors.green.shade100,
          child: Center(child: Text('Item $index'))),
    );
  }

  Widget _buildInfiniteGrid() {
    return StaggeredGridView.countBuilder(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      itemCount: 100,
      staggeredTileBuilder: (index) => StaggeredTile.count(1, 1 + (index % 3)),
      itemBuilder: (context, index) => Card(
          color: Colors.orange.shade100,
          child: Center(child: Text('Item $index'))),
    );
  }

  Widget _buildDynamicGrid() {
    return StaggeredGridView.custom(
      physics: const NeverScrollableScrollPhysics(),
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
}
