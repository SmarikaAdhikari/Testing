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
              height: 300,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 250.0,
                        // width: MediaQuery.of(context).size.width - 150.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image:
                                  NetworkImage("https://picsum.photos/200/300"),
                              fit: BoxFit.fill),
                          gradient: LinearGradient(
                              begin: FractionalOffset.topLeft,
                              end: FractionalOffset.bottomRight,
                              colors: [
                                Color.fromARGB(255, 255, 255, 255)
                                    .withOpacity(0.8),
                                Color.fromARGB(255, 235, 235, 235)
                                    .withOpacity(0.8),
                                Color.fromARGB(255, 141, 141, 141)
                                    .withOpacity(0.8),
                                Color.fromARGB(255, 63, 63, 63)
                                    .withOpacity(0.8),
                                Color.fromARGB(255, 49, 49, 49)
                                    .withOpacity(0.8),
                              ],
                              stops: [
                                0.0,
                                0.25,
                                0.5,
                                0.75,
                                1.0
                              ]),

                          // gradient: LinearGradient(
                          //   begin: Alignment.topRight,
                          //   end: Alignment.bottomLeft,
                          //   colors: [
                          //     Colors.white,
                          //     Colors.black,
                          //   ],
                          // ),
                        ),
                        child: const Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 180,
                              ),
                              Text("Hello World!",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                              Text("Description",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 250.0,
                        // width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              colorFilter: new ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.softLight),
                              image:
                                  NetworkImage("https://picsum.photos/200/300"),
                              fit: BoxFit.fill),
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [
                              Colors.white,
                              Colors.black,
                            ],
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 180,
                              ),
                              Text("Hello World!",
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white)),
                              Text("Description",
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
