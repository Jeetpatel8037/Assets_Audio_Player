import 'package:flutter/material.dart';

import 'gloabal.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool playing = false;
  IconData playBtn = Icons.play_arrow;

  @override
  Widget build(BuildContext context) {
    initAudio() async {
      await Global.playSong['player'].open(
        autoStart: false,
      );

      setState(() {
        Global.playSong['totalDuration'] =
            Global.playSong['player'].current.value!.audio.duration;
      });
    }

    @override
    void initState() {
      super.initState();
      initAudio();
    }

    @override
    void dispose() async {
      // TODO: implement dispose
      super.dispose();
      await Global.playSong["player"].pause();
    }

    bool isPlay = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 720,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ]),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 48),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Music Beats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Kesariya tera isshq hai pea...",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "data:image/jpeg;base64,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"
                                      "eJLoEyHbvVRPSSXFS4kkkoLH//Z"))),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Apple Music",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                          child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //  Slider(value: null,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.skip_previous),
                                  iconSize: 45,
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (!playing) {
                                      setState(() {
                                        playBtn = Icons.pause;
                                        playing = true;
                                      });
                                    } else {
                                      setState(() {
                                        playBtn = Icons.play_arrow;
                                        playing = false;
                                      });
                                    }
                                  },
                                  icon: Icon(playBtn),
                                  iconSize: 62,
                                  color: Colors.blue[800],
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.skip_next),
                                  iconSize: 45,
                                  color: Colors.blue,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 720,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.purple,
                    ]),
              ),
              child: Padding(
                padding: EdgeInsets.only(top: 48),
                child: Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Music Beats",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 38,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text(
                          "Rajhna vee..",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Center(
                        child: Container(
                          width: 300,
                          height: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQxWi_kRhrW7oTixdUZJtqZpQvJMoaB6VwFAA&usqp=CAU"))),
                        ),
                      ),
                      const Center(
                        child: Text(
                          "Apple Music",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 30),
                      Expanded(
                          child: Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //  Slider(value: null,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.skip_previous),
                                  iconSize: 45,
                                  color: Colors.blue,
                                ),
                                IconButton(
                                  // padding: EdgeInsets.all(10),
                                  iconSize: 55,
                                  icon: Icon(
                                    (isPlay) ? Icons.pause : Icons.play_arrow,
                                    color: Colors.blue,
                                  ),
                                  onPressed: () async {
                                    setState(() {
                                      isPlay = (isPlay) ? false : true;
                                    });
                                    (isPlay)
                                        ? await Global.playSong['player'].play()
                                        : await Global.playSong['player']
                                            .pause();
                                  },
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.skip_next),
                                  iconSize: 45,
                                  color: Colors.blue,
                                )
                              ],
                            )
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
