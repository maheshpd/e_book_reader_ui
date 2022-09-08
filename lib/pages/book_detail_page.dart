import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book_reader_ui/pages/play_now_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../json/home_json.dart';
import '../theme/colors.dart';

class BookDetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String authorName;
  final String rate;

  const BookDetailPage(
      {Key? key,
      required this.img,
      required this.title,
      required this.subTitle,
      required this.price,
      required this.page,
      required this.authorName,
      required this.rate})
      : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(130),
        child: getAppBar(context),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          getFirstSection(),
          const SizedBox(
            height: 30,
          ),
          getSecondSection(),
          const SizedBox(
            height: 30,
          ),
          getThirdSection(),
          const SizedBox(
            height: 30,
          ),
          getFourthSection()
        ],
      ),
    );
  }

  Widget getAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(color: black.withOpacity(0.2)),
          ),
          Container(
            width: double.infinity,
            height: 180,
            child: Stack(
              children: [
                BlurryContainer(child: Container()),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios,
                                size: 22,
                                color: white,
                              )),
                          Row(
                            children: [
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.bookmark,
                                    color: white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PlayNowPage(
                                          img: widget.img,
                                          title: widget.title,
                                          subTitle: widget.subTitle,
                                        ),
                                      ),
                                    );
                                  },
                                  icon: const Icon(
                                    Icons.headphones,
                                    color: white,
                                  )),
                              IconButton(
                                  onPressed: () {
                                    getBottomSheetSetting();
                                  },
                                  icon: const Icon(
                                    Icons.settings,
                                    color: white,
                                  ))
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: white),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              widget.subTitle,
                              style:
                                  const TextStyle(fontSize: 16, color: white),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(
              "\$ ${widget.price}",
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Price",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.page,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Pages",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        ),
        Column(
          children: [
            Text(
              widget.rate,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              "Rating",
              style: TextStyle(fontSize: 14, color: black.withOpacity(0.5)),
            ),
          ],
        )
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "About",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        RichText(
          textAlign: TextAlign.left,
          text: const TextSpan(
              text:
                  "It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages",
              style: TextStyle(
                  color: black,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  height: 1.5),
              children: [
                TextSpan(
                    text: " more",
                    style: TextStyle(
                        color: primary,
                        fontSize: 15,
                        fontWeight: FontWeight.w500))
              ]),
        ),
        const SizedBox(
          height: 15,
        ),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: storeTags[index]['color'],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  child: Text(
                    storeTags[index]['label'],
                    style: const TextStyle(fontSize: 12, color: white),
                  ),
                ),
              ),
            );
          }),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://covers.openlibrary.org/b/id/8743774-L.jpg"),
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.authorName,
                      style: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text(
                      "1896-1900",
                      style: TextStyle(
                          fontSize: 13, color: black.withOpacity(0.5)),
                    )
                  ],
                )
              ],
            ),
            Row(
              children: [
                Text(
                  "32 Books",
                  style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
                ),
                const SizedBox(
                  width: 3,
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        )
      ],
    );
  }

  Widget getThirdSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Reviews",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 15,
        ),
        Column(
          children: List.generate(reviewsPeople.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                          reviewsPeople[index]['img'],
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            reviewsPeople[index]['name'],
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          RatingBar.builder(
                            ignoreGestures: true,
                            initialRating: specialForYouJson[index]['rate'],
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
                        ],
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    textAlign: TextAlign.left,
                    text: TextSpan(
                        text: reviewsPeople[index]['text'],
                        style: const TextStyle(
                            color: black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            height: 1.5),
                        children: const [
                          TextSpan(
                              text: " more",
                              style: TextStyle(
                                  color: primary,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500))
                        ]),
                  ),
                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getFourthSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Similar book",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              children: const [
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(similarBooksJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookDetailPage(
                              img: similarBooksJson[index]['img'],
                              title: similarBooksJson[index]['title'],
                              subTitle: similarBooksJson[index]['sub_title'],
                              price: similarBooksJson[index]['price'],
                              page: similarBooksJson[index]['page'],
                              authorName: similarBooksJson[index]
                                  ['author_name'],
                              rate:
                                  similarBooksJson[index]['rate'].toString())));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        specialForYouJson[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: black.withOpacity(0.2)),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: const BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                specialForYouJson[index]['favourite']
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              width: 65,
                              height: 25,
                              decoration: const BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(12),
                                      topRight: Radius.circular(12))),
                              child: Center(
                                child: Text(
                                  "\$ ${specialForYouJson[index]['price']}",
                                  style: const TextStyle(
                                      fontSize: 14,
                                      color: white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]['title'],
                          maxLines: 1,
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w600),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: 120,
                        child: Text(
                          specialForYouJson[index]['sub_title'],
                          maxLines: 1,
                          style: TextStyle(
                              fontSize: 13, color: black.withOpacity(0.4)),
                        ),
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 120,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: specialForYouJson[index]['rate'],
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
                            Text(
                              "(${specialForYouJson[index]['rate'].toString()})",
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
                ),
              );
            }),
          ),
        )
      ],
    );
  }

  getBottomSheetSetting() {
    List themes = [
      const Color(0xFFFFFFFF),
      const Color(0xFF000000),
      const Color(0xFFF0CEA0)
    ];

    showMaterialModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Container(
                width: double.infinity,
                height: 250,
                decoration: BoxDecoration(color: primary.withOpacity(0.15)),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(themes.length, (index) {
                              if (index == 0) {
                                return Padding(
                                  padding: const EdgeInsets.only(right: 12),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: themes[index],
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: black.withOpacity(0.7),
                                            width: 0.5)),
                                  ),
                                );
                              }
                              return Padding(
                                padding: const EdgeInsets.only(right: 12),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: themes[index],
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              );
                            }),
                          ),
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: const BoxDecoration(
                                    color: primary, shape: BoxShape.circle),
                                child: const Center(
                                  child: Text(
                                    "TT",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: primary,
                                    ),
                                    shape: BoxShape.circle),
                                child: const Center(
                                  child: Text(
                                    "Tt",
                                    style: TextStyle(
                                        fontSize: 17,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              width: double.infinity,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              width: 150,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 145),
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: primary),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Aa",
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.8)),
                          ),
                          Text(
                            "AA",
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.8)),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              width: double.infinity,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: black.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Container(
                              width: 150,
                              height: 4,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.circular(5)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 145),
                            child: Container(
                              width: 12,
                              height: 12,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: primary),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.light_mode,
                            color: black.withOpacity(0.6),
                            size: 18,
                          ),
                          Icon(
                            Icons.light_mode,
                            color: black.withOpacity(0.6),
                            size: 28,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
