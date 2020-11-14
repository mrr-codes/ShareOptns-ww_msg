import 'dart:io';

import 'package:flutter/material.dart';
//import 'package:http/http.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';


//void main() => runApp(MyShareApp());

class MyShareApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyShareApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;

    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    String userFullName = "Robin Sharma";
    String taskName = "PRACTISE MINDFULLNESS AND YOGA";
    String displayMessage = "\nGreetings!!!\nYour dear $userFullName has chosen you to be his motivator as he takes up the task of $taskName\n"
        " We will share his progress for you to keep track of. \nYou are the Task Master and upto you to ensure he succeeds in accomplishing the task"
    "\n Do check out our app. Its good stuff...";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Tasker app'),
        ),
        body: Screenshot(
          controller: screenshotController,
          child: Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Running on: $_platformVersion\n',
                  textAlign: TextAlign.center,
                ),
//                RaisedButton(
//                  onPressed: () async {
//                    File file = await ImagePicker.pickImage(
//                        source: ImageSource.gallery);
//                    SocialShare.shareInstagramStory(file.path, "#ffffff",
//                        "#000000", "https://deep-link-url")
//                        .then((data) {
//                      print(data);
//                    });
//                  },
//                  child: Text("Share On Instagram Story"),
//                ),
                RaisedButton(
                  onPressed: () async {
                    await screenshotController.capture().then((image) async {
                      SocialShare.shareInstagramStorywithBackground(image.path,
                          "#ffffff", "#000000", "https://deep-link-url",
                          backgroundImagePath: image.path)
                          .then((data) {
                        print(data);
                      });
                    });
                  },
                  child: Text("Share On Instagram Story with background"),
                ),
                RaisedButton(
                  onPressed: () async {
                    await screenshotController.capture().then((image) async {
                      //facebook appId is mandatory for andorid or else share won't work
                      Platform.isAndroid
                          ? SocialShare.shareFacebookStory(image.path,
                          "#ffffff", "#000000", "https://google.com",
                          appId: "xxxxxxxxxxxxx")
                          .then((data) {
                        print(data);
                      })
                          : SocialShare.shareFacebookStory(image.path,
                          "#ffffff", "#000000", "https://google.com")
                          .then((data) {
                        print(data);
                      });
                    });
                  },
                  child: Text("Share On Facebook Story"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.copyToClipboard(
                      "This is Social Share plugin",
                    ).then((data) {
                      print(data);
                    });
                  },
                  child: Text("Copy to clipboard"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareTwitter(
                        "This is Social Share twitter example",
                        hashtags: ["hello", "world", "foo", "bar"],
                        url: "https://google.com/#/hello",
                        trailingText: "\nhello")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on twitter"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareSms(
                        "$displayMessage",

                        trailingText: displayMessage,
                      //url: "\nhttps://tasker.com/",
                    )
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Sms"),
                ),
                RaisedButton(
                  onPressed: () async {
                    await screenshotController.capture().then((image) async {
                      SocialShare.shareOptions(displayMessage).then((data) {
                        print(data);
                      });
                    });
                  },
                  child: Text("Share Options"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareWhatsapp(
                        "$displayMessage \n https://google.com")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Whatsapp"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.shareTelegram(
                        " $displayMessage \n https://google.com")
                        .then((data) {
                      print(data);
                    });
                  },
                  child: Text("Share on Telegram"),
                ),
                RaisedButton(
                  onPressed: () async {
                    SocialShare.checkInstalledAppsForShare().then((data) {
                      print(data.toString());
                    });
                  },
                  child: Text("Get all Apps"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}