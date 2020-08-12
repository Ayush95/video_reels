import 'package:flutter/material.dart';

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Divider(color: Colors.white.withOpacity(0.5)),
        Padding(
            padding: const EdgeInsets.only(bottom: 7, left: 5, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.home, color: Colors.white, size: 30),
                      const Text('Home',
                          style: TextStyle(color: Colors.white, fontSize: 10))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 11),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.search,
                          color: Colors.white.withOpacity(0.8), size: 30),
                      Text('Search',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 10))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 20, right: 3),
                    child: buttonplus()),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(Icons.inbox,
                          color: Colors.white.withOpacity(0.8), size: 30),
                      Text('MailBox',
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 10))
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 9, right: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.person,
                            color: Colors.white.withOpacity(0.8), size: 30),
                        Text('Me',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.8),
                                fontSize: 10))
                      ],
                    )),
              ],
            ))
      ],
    );
  }

  buttonplus() {
    return Container(
      width: 56,
      height: 30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.transparent),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0x2dd3e7).withOpacity(1)),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Color(0xed316a).withOpacity(1)),
            ),
          ),
          Center(
            child: Container(
              width: 38,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.white),
              child: Center(child: Icon(Icons.add, color: Colors.black)),
            ),
          )
        ],
      ),
    );
  }
}
