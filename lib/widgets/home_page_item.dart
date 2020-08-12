import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:video_moves_app/models/user_data.dart';
import 'package:video_moves_app/models/users.dart';
import 'package:video_player/video_player.dart';

class HomePageItem extends StatefulWidget {
  final bool forYou;
  HomePageItem(this.forYou);
  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem>
    with SingleTickerProviderStateMixin {
  bool play = true;
  PageController foryouController = new PageController();
  AnimationController animationController;
  VideoPlayerController _controller;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 0.8);

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 5));
    animationController.repeat();
    _controller = VideoPlayerController.network(
      "https://www.pinkvilla.com/feed/video-test/1GzPt1E-wXaMF_rAmm_E18XdTqqwVocde.mp4",
    )..initialize().then((value) {
        _controller.play();
        _controller.setLooping(true);
        _controller.setVolume(1);
        setState(() {});
      });
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.forYou
          ? PageView.builder(
              controller: foryouController,
              onPageChanged: (index) {
                setState(
                  () {
                    _controller.seekTo(Duration.zero);
                    _controller.play();
                  },
                );
              },
              scrollDirection: Axis.vertical,
              itemCount: users.length,
              itemBuilder: (context, index) {
                UserData userData = users[index];
                UserInfo usersInfo = userinfo[index];
                return Stack(
                  children: <Widget>[
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      onPressed: () {
                        setState(
                          () {
                            if (play) {
                              _controller.pause();
                              play = !play;
                            } else {
                              _controller.play();
                              play = !play;
                            }
                          },
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: VideoPlayer(_controller),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 70),
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Container(
                          width: MediaQuery.of(context).size.width - 100,
                          height: 150,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text(
                                  usersInfo.name,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 10, bottom: 10),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: userData.title,
                                      ),
                                      TextSpan(
                                          text: '#foot\n',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                          text: 'Dummy Data',
                                          style: TextStyle(fontSize: 12))
                                    ],
                                  ),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 10,),
                                child: Row(
                                  children: <Widget>[
                                    Icon(Icons.music_note,
                                        size: 16, color: Colors.white),
                                    const Text(
                                      'N11 - Music',
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 65, right: 10),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          width: 70,
                          height: 400,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(bottom: 23),
                                width: 40,
                                height: 50,
                                child: Stack(
                                  children: <Widget>[
                                    CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                        radius: 19,
                                        backgroundColor: Colors.black,
                                        backgroundImage: NetworkImage(
                                          usersInfo.headshot,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: CircleAvatar(
                                        radius: 10,
                                        backgroundColor:
                                            Color(0xfd2c58).withOpacity(1),
                                        child: Center(
                                            child: Icon(Icons.add,
                                                size: 15, color: Colors.white)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.favorite,
                                        size: 35, color: Colors.white),
                                    Text(userData.likeCount,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(math.pi),
                                        child: Icon(Icons.sms,
                                            size: 35, color: Colors.white)),
                                    Text(userData.commentCount,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(bottom: 50),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Transform(
                                        alignment: Alignment.center,
                                        transform: Matrix4.rotationY(math.pi),
                                        child: Icon(Icons.reply,
                                            size: 35, color: Colors.white)),
                                    Text(userData.shareCount,
                                        style: TextStyle(color: Colors.white))
                                  ],
                                ),
                              ),
                              AnimatedBuilder(
                                animation: animationController,
                                child: CircleAvatar(
                                  radius: 22,
                                  backgroundColor:
                                      Color(0x222222).withOpacity(1),
                                  child: CircleAvatar(
                                    radius: 12,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                builder: (context, _widget) {
                                  return Transform.rotate(
                                      angle: animationController.value * 6.3,
                                      child: _widget);
                                },
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                );
              },
            )
          //_controller.play();
          // return
          : Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                          padding: EdgeInsets.only(bottom: 14),
                          child: const Text(
                            'Trendsetter',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Center(
                        child: Container(
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: Text(
                                    'Subscribe to an account to discover',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8))),
                              ),
                              Center(
                                child: Text('latest videos here.',
                                    style: TextStyle(
                                        color: Colors.white.withOpacity(0.8))),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
    );
  }
}
