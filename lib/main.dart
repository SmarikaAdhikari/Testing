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
    "https://picsum.photos/200/300.webp",
    "https://picsum.photos/200",
    "https://picsum.photos/200",
  ];

  List<double> imageHeights = [
    200.0,
    200.0,
    200.0,
    200.0,
    200.0,
    200.0,
    200.0,
    200.0,
  ];

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
          child: Row(
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
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(3.0),
        child: Stack(
          children: [
            Container(
              height: 200,
              // color: Colors.blue[100],
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: NetworkImage("https://picsum.photos/200"),
                  fit: BoxFit.cover,
                ),
                border: Border.all(
                  color: const Color.fromRGBO(76, 175, 80, 1),
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  ),
                  // BoxShadow(
                  //   color: Colors.white,
                  //   offset: const Offset(0.0, 0.0),
                  //   blurRadius: 0.0,
                  //   spreadRadius: 0.0,
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.network(
                      "https://picsum.photos/200/300",
                      fit: BoxFit.cover,
                      height: 170,
                      width: 170,
                    ),
                  ),
                  SizedBox(width: 10),
                  Positioned(
                    top: 10,
                    left: 10,
                    child: Image.network(
                      "https://picsum.photos/200",
                      fit: BoxFit.cover,
                      height: 180,
                      width: 180,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Hello World!", style: TextStyle(fontSize: 30)),
                  Text("Description", style: TextStyle(fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      Flexible(
        child: SizedBox(
            height: 10000,
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
