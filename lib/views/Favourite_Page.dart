import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourite Page"),
      ),
      //body:
      // Card(
      //   child: Container(
      //     height: 170,
      //     margin: EdgeInsets.only(left: 10, top: 10, right: 10),
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Row(
      //           mainAxisAlignment:
      //           MainAxisAlignment.spaceBetween,
      //           children: [
      //             Text(
      //               data[i].type,
      //               style: TextStyle(
      //                 fontWeight: FontWeight.w700,
      //                 fontSize: 21,
      //               ),
      //             ),
      //             IconButton(
      //               onPressed: () {
      //                 Provider.of<FavoriteProvider>(context,
      //                     listen: false)
      //                     .addJokes(data[i]);
      //               },
      //               icon: Icon(Icons.favorite_border),
      //             ),
      //           ],
      //         ),
      //         Text(
      //           data[i].setup,
      //           style: TextStyle(
      //             fontWeight: FontWeight.w500,
      //             fontSize: 17,
      //           ),
      //         ),
      //         Text(
      //           data[i].punchline,
      //           style: TextStyle(
      //             fontWeight: FontWeight.w400,
      //             fontSize: 16,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
