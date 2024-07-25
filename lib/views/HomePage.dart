import 'package:advjokeapp/model/api_jokesmodel.dart';
import 'package:advjokeapp/provider/Favouriteprovider.dart';
import 'package:advjokeapp/utils/helper/helper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Jokes>?> getJokes;
  bool isFavourite = false;

  @override
  void initState() {
    super.initState();
    getJokes = ApiHelpers.apiHelper.getjokes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Jokes App",
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('favouritePage');
            },
            icon: Icon(Icons.favorite),
            color: Colors.red,
          ),
        ],
      ),
      body: FutureBuilder(
        future: getJokes,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("ERROR: ${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            List<Jokes>? data = snapshot.data;
            return (data == null || data.isEmpty)
                ? Center(
                    child: Text("No any data"),
                  )
                : ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, i) {
                      return Card(
                        child: Container(
                          height: 175,
                          margin: EdgeInsets.only(left: 10, top: 5, right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    data[i].type,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 21,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      // Navigator.of(context).pushNamed(
                                      //     'favouritePage',
                                      //     arguments: data[i]);
                                      isFavourite = !isFavourite;

                                      Provider.of<FavoriteProvider>(context,
                                              listen: false)
                                          .addJokes(
                                        data[i],
                                      );
                                    },
                                    icon:
                                        (Provider.of<FavoriteProvider>(context)
                                                .isFavourite)
                                            ? Icon(Icons.favorite_outlined)
                                            : Icon(Icons.favorite_border),
                                  ),
                                ],
                              ),
                              Text(
                                data[i].setup,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 17,
                                ),
                              ),
                              Text(
                                data[i].punchline,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
