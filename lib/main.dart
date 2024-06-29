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
      home: MovieInfoScreen(),
    );
  }
}

class MovieInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.cyan,
          child: AppBar(
            title: Text(
              'Card Widget <Odenfis>',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.cyan,
            elevation: 0,
          ),
        ),
      ),
      body: MovieCardWidget(
        title: 'Información de películas',
        description: 'Esta es una descripción del título principal para mostrar',
        images: [
          'https://i.pinimg.com/564x/78/a7/79/78a779ef83ecdd8c8bb1f2951b8d4da9.jpg',
          'https://i.pinimg.com/564x/af/32/30/af323019960557e7c4f809dda9589032.jpg',
          'https://i.pinimg.com/564x/51/24/ae/5124ae729881878bdcb35e5a8b2ba3aa.jpg',
          'https://i.pinimg.com/564x/6a/64/5b/6a645bf3468e0159c26680be88cb9e2e.jpg'
        ],
      ),
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;

  MovieCardWidget({required this.title, required this.description, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_movies, color: Colors.blue, size: 40.0),
                    SizedBox(width: 8.0),
                    Text(
                      title,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(description),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Aceptar')),
                    TextButton(onPressed: () {}, child: Text('Cancelar')),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(images[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
