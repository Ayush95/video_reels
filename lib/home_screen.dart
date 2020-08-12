import 'package:flutter/material.dart';
import 'package:video_moves_app/widgets/home_page_item.dart';

import 'widgets/footer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool following = false;
  bool foryou = true;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);
  ScrollController scrollController = ScrollController(initialScrollOffset: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            HomePageItem(foryou),
            Footer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FlatButton(
                  onPressed: () {
                    setState(() {
                      following = true;
                      foryou = false;
                    });
                  },
                  child: Text(
                    'Following',
                    style: following
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                  ),
                ),
                Text(
                  '|',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    setState(() {
                      following = false;
                      foryou = true;
                    });
                  },
                  child: Text(
                    'For You',
                    style: following
                        ? TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          )
                        : TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
