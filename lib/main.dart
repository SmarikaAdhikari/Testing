import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> images = [
    "https://picsum.photos/200/300",
    "https://picsum.photos/200",
    "https://picsum.photos/id/237/200/300",
    "https://picsum.photos/200/300.webp",
    "https://picsum.photos/200/300.webp",
  ];

  List<double> imageHeights = [200.0, 200.0, 200.0, 200.0, 200.0, 250.0];

  dynamic CachedNetworkImage({required String imageUrl, required BoxFit fit}) {}

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Container(
        color: Colors.red,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Name *',
                          hintText: "search",
                          prefix: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Icon(Icons.notifications_on)
                ],
              ),
              const Text("smarikaaaaaa"),
              const Text("adhikariii"),
            ],
          ),
        ),
      ),
      Flexible(
        child: SizedBox(
            height: 650,
            child: StaggeredGridView.countBuilder(
              crossAxisCount: 2,
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: imageHeights[index],
                  child: Image.network(images[index]),
                );
              },
              staggeredTileBuilder: (int index) {
                return StaggeredTile.count(1, imageHeights[index] / 150);
              },
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            )),
      )
    ])));
  }
}
 // child: StaggeredGridView.countBuilder(
          //   crossAxisCount: 6,
          //   itemCount: 10,
          //   itemBuilder: (BuildContext context, int index) => Container(
          //     color: Colors.green,
          //     child: Center(
          //       child: Text(
          //         'Item $index',
          //         style: TextStyle(fontSize: 20.0, color: Colors.white),
          //       ),
          //     ),
          //   ),
          //   staggeredTileBuilder: (int index) =>
          //       StaggeredTile.count(2, index.isEven ? 2 : 3),
          //   mainAxisSpacing: 2.0,
          //   crossAxisSpacing: 2.0,
          // ),
             