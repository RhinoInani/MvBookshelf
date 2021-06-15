import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:mv_bookshelf/components/twoSideRoundedButton.dart';
import 'package:mv_bookshelf/constants.dart';
import 'package:mv_bookshelf/firebaseReturn.dart';
import 'package:mv_bookshelf/screens/readScreen.dart';

//TODO: work on making chapters + section

class WeekReading extends StatelessWidget {
  final String week;
  final String weekBold;
  const WeekReading({
    Key key,
    @required this.size,
    @required this.week,
    this.weekBold,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(size.width * 0.03),
          child: RichText(
            text: TextSpan(
              style:
                  TextStyle(fontSize: size.height * 0.03, color: kBlackColor),
              children: [
                TextSpan(text: week),
                TextSpan(
                    text: "reading...",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
        ),
        Center(
          child: Container(
            height: size.height * 0.2,
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: Color.fromRGBO(229, 224, 215, 0.9),
              borderRadius: BorderRadius.circular(29),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 8),
                  blurRadius: 10,
                  color: Colors.grey[400],
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  left: size.width * 0.1,
                  top: (size.height * 0.02) / 2,
                  height: size.height * 0.18,
                  child: Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 8),
                        blurRadius: 10,
                        color: Colors.grey[400],
                      ),
                    ]),
                    child: ClipRRect(
                        child: Image.network(
                          week == "This weeks " ? twrImageUrl : lwrImageUrl,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                    left: size.width * 0.4,
                    top: size.height * 0.02,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: AutoSizeText(
                            week == "This weeks " ? twrTitle : lwrTitle,
                            softWrap: true,
                            wrapWords: true,
                            style: TextStyle(
                                fontSize: size.height * 0.027,
                                color: kBlackColor),
                          ),
                        ),
                        Container(
                          width: size.width * 0.38,
                          child: AutoSizeText(
                            "By: ${week == "This weeks " ? twrAuthor : lwrAuthor}",
                            softWrap: true,
                            wrapWords: true,
                            style: TextStyle(
                                fontSize: size.height * 0.017,
                                color: kLightBlackColor),
                          ),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: 0,
                  right: 0,
                  height: size.height * 0.05,
                  width: (size.width * 0.8) / 2,
                  child: TwoSideRoundedButton(
                    text: "Start Reading",
                    press: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return PDFReader(
                          pdfUrl: week == "This weeks " ? twrPdfUrl : lwrPdfUrl,
                        );
                      }));
                    },
                    radius: 29,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
