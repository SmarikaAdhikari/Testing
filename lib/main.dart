// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Assignment2',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Hey'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  // void _incrementCounter() {
  //   setState(() {
  //     _counter++;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
      // appBar: AppBar(),
        body: Column(
          children: [
            Container( 
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row( 
                      //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                        IconButton(onPressed: (){}, icon: const Icon(Icons.menu)),
                        Expanded(
                          // flex: 2,
                          child: TextFormField(
                            decoration:  InputDecoration(
                              labelText: 'Name *',
                              hintText: "search",
                              prefix: const Icon(Icons.search),
                              border: OutlineInputBorder(
                          
                                borderRadius: BorderRadius.circular(40),
                              )
                            ),
                          ),
                        ),
                       const  SizedBox(width: 20,),
                        const Icon(Icons.notifications_on)
                      ],
                    ),
                    const Text("smarikaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    const Text("adhikariiiiiiiiiiiiiiiiiiiiiiii"),
                  ],
                ),
              ),
              
            ),
              Expanded(
            child: ListView.builder(
            
              itemCount: 20,
              
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text("Hello $index"),
            
                );
              },
              
              ),
              ),
            
          
          ],
        ),
        drawer: const Drawer(),
      ),
    );
  }
}
