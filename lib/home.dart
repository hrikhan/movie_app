import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movienation/fatchapi.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:carousel_slider/carousel_controller.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  final fatchapi api = fatchapi();
  late Future<List<dynamic>> movies;
  late Future<List<dynamic>> movies2;
  @override
  void initState() {
    super.initState();
    movies = api.fatchdata();
    movies2 = api.fatchdata2();
    // movies2 = api.fatchdata2();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.home),
        backgroundColor: Colors.amber,
        centerTitle: true,
        title: Text(
          "MOVIE HALL",
          style: TextStyle(
              color: Color.fromARGB(255, 118, 2, 2),
              fontWeight: FontWeight.bold),
        ),
        actions: [Icon(Icons.search)],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: FutureBuilder(
                future: movies2,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return CarouselSlider.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index, realIndex) {
                          final popular = snapshot.data![index];
                          return Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${popular['poster_path']}'))),
                              ),
                              Positioned(
                                  bottom: 15,
                                  child: Text(popular['title'],
                                      style: TextStyle(
                                        fontSize: 15,
                                        backgroundColor: Colors.amber,
                                      )))
                            ],
                          );
                        },
                        options: CarouselOptions(
                          height: 200,
                          enlargeCenterPage: true,
                          autoPlay: true,
                        ));
                  }
                }),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Top rated",
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.red,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: FutureBuilder<List<dynamic>>(
                future: movies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(child: Text('No movies found.'));
                  } else {
                    return ListView.builder(
                      padding: EdgeInsets.all(8),
                      scrollDirection: Axis.horizontal,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final movie = snapshot.data![index];
                        return Stack(children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                    child: Image.network(
                                  'https://image.tmdb.org/t/p/w500${movie['poster_path']}',
                                  fit: BoxFit.cover,
                                )),
                              ],
                            ),
                          ),
                        ]);
                      },
                    );
                  }
                }),
          ),
        ],
      ),
    );
  }
}
