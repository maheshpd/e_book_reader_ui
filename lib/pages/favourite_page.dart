import 'package:badges/badges.dart';
import 'package:e_book_reader_ui/json/favourite_json.dart';
import 'package:e_book_reader_ui/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

import 'book_detail_page.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          getSearchAndCart(),
          const SizedBox(
            height: 10,
          ),
          getFavouriteList()
        ],
      ),
    ));
  }

  Widget getSearchAndCart() {
    var size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
              color: grey.withOpacity(0.25),
              borderRadius: BorderRadius.circular(12)),
          child: const Padding(
            padding: EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Search..."),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Badge(
            badgeColor: primary,
            badgeContent: const Text(
              "3",
              style: TextStyle(color: white),
            ),
            child: const Icon(
              LineIcons.shoppingBag,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget getFavouriteList() {
    var size = MediaQuery.of(context).size;
    return Wrap(
      spacing: 15,
      runSpacing: 20,
      children: List.generate(favouriteBooksJson.length, (index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => BookDetailPage(
                        img: favouriteBooksJson[index]['img'],
                        title: favouriteBooksJson[index]['title'],
                        subTitle: favouriteBooksJson[index]['sub_title'],
                        price: favouriteBooksJson[index]['price'],
                        page: favouriteBooksJson[index]['page'],
                        authorName: favouriteBooksJson[index]['author_name'],
                        rate: favouriteBooksJson[index]['rate'].toString())));
          },
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    width: (size.width - 55) / 2,
                    height: (size.width + 40) / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                            image:
                                NetworkImage(favouriteBooksJson[index]['img']),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                          color: white, shape: BoxShape.circle),
                      child: const Center(
                        child: Icon(
                          LineIcons.heartAlt,
                          color: danger,
                          size: 22,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Text(
                  favouriteBooksJson[index]['title'],
                  maxLines: 1,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Text(
                  favouriteBooksJson[index]['sub_title'],
                  maxLines: 1,
                  style: TextStyle(fontSize: 14, color: black.withOpacity(0.4)),
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                width: (size.width - 55) / 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RatingBar.builder(
                      ignoreGestures: true,
                      initialRating: favouriteBooksJson[index]['rate'],
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 14,
                      itemPadding: const EdgeInsets.only(right: 2),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: danger,
                      ),
                      onRatingUpdate: (rating) {},
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Text(
                      "(${favouriteBooksJson[index]['rate'].toString()})",
                      style: const TextStyle(
                          fontSize: 13,
                          color: danger,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
