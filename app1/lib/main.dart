import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:audioplayers/audioplayers.dart';
//import 'package:app1/onlineaudio.dart';
//import 'package:app1/onlinevideo.dart';
//import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  build(BuildContext context) {
    return videoApp();
  }
}

videoApp() {
  FlutterStatusbarcolor.setStatusBarColor(Colors.black);
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: VideoPlayerScreen(),
  );
}

int count1 = 0;
int count2 = 0;
int count3 = 0;
toast1() => Fluttertoast.showToast(
      msg: "Playing from Assets",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15.0,
    );

toast2() => Fluttertoast.showToast(
      msg: "Playing Using Network",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 15.0,
    );

class VideoPlayerScreen extends StatefulWidget {
  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  //For Video Player
  VideoPlayerController _controller, _controllerSecond, _controllerThird;
  Future<void> _initializeVideoPlayerFuture,
      _initializeVideoPlayerFutureSecond,
      _initializeVideoPlayerFutureThird;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.

    //For Video Player
    _controller = VideoPlayerController.asset(
      'assets/HW.mp4',
    );
    _controllerSecond = VideoPlayerController.network(
      'https://assets.mixkit.co/videos/preview/mixkit-sunlight-crossing-the-branches-of-trees-1709-large.mp4',
    );
    _controllerThird = VideoPlayerController.network(
      'https://ak.picdn.net/shutterstock/videos/1036107755/preview/stock-footage-talented-innovative-female-artist-draws-with-her-hands-on-the-large-canvas-using-fingers-she.webm',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();
    _initializeVideoPlayerFutureSecond = _controllerSecond.initialize();
    _initializeVideoPlayerFutureThird = _controllerThird.initialize();
    setState(() {});

    // Use the controller to loop the video.
    _controller.setLooping(true);
    _controllerSecond.setLooping(true);
    _controllerThird.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();
    _controllerSecond.dispose();
    _controllerThird.dispose();

    super.dispose();
  }

  //For Audio Player
  var cache1 = AudioCache();
  var cache2 = AudioCache();
  final cache3 = AudioCache();
  AudioPlayer player1, player2, player3;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.pink[400],
        drawer: new Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Center(
                  child: Image.asset("assets/im11.jpg"),
                ),
                decoration: BoxDecoration(
                  color: Colors.black,
                ),
              ),
              new ListTile(
                title: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.music_note), onPressed: null),
                    Text('ONLINE MUSIC')
                  ],
                ),
                //onTap: () {
                //Navigator.push(context,
                //new MaterialPageRoute(builder: (context) => new MyApp()));
                //},
              ),
              new ListTile(
                title: Row(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.music_video), onPressed: null),
                    Text('ONLINE VIDEO')
                  ],
                ),
                //onTap: () {
                //Navigator.push(
                //context,
                //new MaterialPageRoute(
                //builder: (context) => new OnlineVideo()));
                //},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          title: Text(
            "Harry's App",
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
          ),
          leading: Image.asset('assets/im11.jpg'),
          bottom: PreferredSize(
            child: TabBar(
              labelPadding: EdgeInsets.only(bottom: 5),
              //isScrollable: true,
              indicatorColor: Colors.white,
              tabs: [
                Text('Video'),
                Text('Audio'),
              ],
            ),
            preferredSize: Size(double.infinity, 28),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            // Video Tab
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      //color: Colors.grey[700],
                      elevation: 6,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Card(
                              shadowColor: Colors.pink,
                              elevation: 10,
                              child: Center(
                                child: FutureBuilder(
                                  future: _initializeVideoPlayerFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // If the VideoPlayerController has finished initialization, use
                                      // the data it provides to limit the aspect ratio of the video.
                                      return AspectRatio(
                                        aspectRatio:
                                            _controller.value.aspectRatio,
                                        // Use the VideoPlayer widget to display the video.
                                        child: VideoPlayer(_controller),
                                      );
                                    } else {
                                      // If the VideoPlayerController is still initializing, show a
                                      // loading spinner.
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            //color: Colors.black,
                            margin: EdgeInsets.only(bottom: 20),
                            child: FloatingActionButton.extended(
                              label: _controller.value.isPlaying
                                  ? Icon(Icons.pause_circle_filled,
                                      color: Colors.amber)
                                  : Icon(Icons.play_circle_outline,
                                      color: Colors.black),
                              isExtended: true,
                              backgroundColor: Colors.white,
                              onPressed: () {
                                count1++;
                                if (count1 == 1) {
                                  toast1();
                                }
                                // Wrap the play or pause in a call to `setState`. This ensures the
                                // correct icon is shown.
                                setState(
                                  () {
                                    // If the video is playing, pause it.
                                    if (_controller.value.isPlaying) {
                                      _controller.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controller.play();
                                    }
                                  },
                                );
                              },
                              // Display the correct icon depending on the state of the player.
                            ),
                          ),
                          // Container(
                          //   color: Colors.black12,
                          //   height: 2,
                          // ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Card(
                              color: Colors.grey[700],
                              shadowColor: Colors.pink,
                              elevation: 10,
                              child: Center(
                                child: FutureBuilder(
                                  future: _initializeVideoPlayerFutureSecond,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // If the VideoPlayerController has finished initialization, use
                                      // the data it provides to limit the aspect ratio of the video.
                                      return AspectRatio(
                                        aspectRatio:
                                            _controllerSecond.value.aspectRatio,
                                        // Use the VideoPlayer widget to display the video.
                                        child: VideoPlayer(_controllerSecond),
                                      );
                                    } else {
                                      // If the VideoPlayerController is still initializing, show a
                                      // loading spinner.
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: FloatingActionButton.extended(
                              label: _controllerSecond.value.isPlaying
                                  ? Icon(Icons.pause_circle_filled,
                                      color: Colors.amber)
                                  : Icon(Icons.play_circle_outline,
                                      color: Colors.black),
                              isExtended: true,
                              backgroundColor: Colors.white,
                              onPressed: () {
                                count2++;
                                if (count2 == 1) {
                                  toast2();
                                }
                                // Wrap the play or pause in a call to `setState`. This ensures the
                                // correct icon is shown.
                                setState(
                                  () {
                                    // If the video is playing, pause it.
                                    if (_controllerSecond.value.isPlaying) {
                                      _controllerSecond.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controllerSecond.play();
                                    }
                                  },
                                );
                              },
                              // Display the correct icon depending on the state of the player.
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      elevation: 3,
                      child: Column(
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(20),
                            child: Card(
                              color: Colors.grey[700],
                              shadowColor: Colors.pink,
                              elevation: 10,
                              child: Center(
                                child: FutureBuilder(
                                  future: _initializeVideoPlayerFutureThird,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      // If the VideoPlayerController has finished initialization, use
                                      // the data it provides to limit the aspect ratio of the video.
                                      return AspectRatio(
                                        aspectRatio:
                                            _controllerThird.value.aspectRatio,
                                        // Use the VideoPlayer widget to display the video.
                                        child: VideoPlayer(_controllerThird),
                                      );
                                    } else {
                                      // If the VideoPlayerController is still initializing, show a
                                      // loading spinner.
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 20),
                            child: FloatingActionButton.extended(
                              label: _controllerThird.value.isPlaying
                                  ? Icon(Icons.pause_circle_filled,
                                      color: Colors.amber)
                                  : Icon(Icons.play_circle_outline,
                                      color: Colors.black),
                              isExtended: true,
                              backgroundColor: Colors.white,
                              onPressed: () {
                                count3++;
                                if (count3 == 1) {
                                  toast2();
                                }
                                // Wrap the play or pause in a call to `setState`. This ensures the
                                // correct icon is shown.
                                setState(
                                  () {
                                    // If the video is playing, pause it.
                                    if (_controllerThird.value.isPlaying) {
                                      _controllerThird.pause();
                                    } else {
                                      // If the video is paused, play it.
                                      _controllerThird.play();
                                    }
                                  },
                                );
                              },
                              // Display the correct icon depending on the state of the player.
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Audio Tab
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/im1.jpg"),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.red[900],
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage('assets/im1.jpg'),
                                    fit: BoxFit.cover)),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child:
                                Text('Song 1', style: TextStyle(fontSize: 28)),
                          ),
                          InkWell(
                            onTap: () async {
                              player1 = await cache1.play('a1.mp3');
                            },
                            child: Card(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player1.pause(),
                            child: Card(
                              child: Icon(
                                Icons.pause,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player1.resume(),
                            child: Card(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.yellow,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/im2.jpg"),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.red[900],
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child:
                                Text('Song 2', style: TextStyle(fontSize: 28)),
                          ),
                          InkWell(
                            onTap: () async {
                              player2 = await cache2.play('a2.mp3');
                            },
                            child: Card(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.blue,
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player2.pause(),
                            child: Card(
                              child: Icon(
                                Icons.pause,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player2.resume(),
                            child: Card(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.yellow,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/im3.jpg"),
                        fit: BoxFit.fill,
                      ),
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(150),
                      border: Border.all(
                        color: Colors.white,
                        width: 3,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.black,
                    margin: EdgeInsets.all(20),
                    child: Card(
                      shadowColor: Colors.red[900],
                      elevation: 5,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 30),
                            child:
                                Text('Song 3', style: TextStyle(fontSize: 28)),
                          ),
                          InkWell(
                            onTap: () async {
                              player3 = await cache3.play('a3.mp3');
                            },
                            child: Card(
                              child: Icon(
                                Icons.play_circle_outline,
                                color: Colors.blue[700],
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player3.pause(),
                            child: Card(
                              child: Icon(
                                Icons.pause,
                                color: Colors.red,
                                size: 40,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () => player3.resume(),
                            child: Card(
                              child: Icon(
                                Icons.play_arrow,
                                color: Colors.yellow,
                                size: 40,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
