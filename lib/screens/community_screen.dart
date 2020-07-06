import 'package:flutter/material.dart';

import '../dummy_posts.dart';

class CommunityScreen extends StatefulWidget {
  static const String screenRoute = '/community';

  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<CommunityScreen> {
  List<Map<String, String>> namesAndShortNamesAndImages;

  @override
  void initState() {
    namesAndShortNamesAndImages = dummypost;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: ListView(
              children: namesAndShortNamesAndImages
                  .map((namesAndShortNamesAndImages) {
            return Cards(
                namesAndShortNamesAndImages['name'],
                namesAndShortNamesAndImages['avatar'],
                namesAndShortNamesAndImages['imageUrl'],
                namesAndShortNamesAndImages['text']);
          }).toList()),
        ),
        MessageTextBuild(),
      ],
    );
  }
}

class Cards extends StatelessWidget {
  final String name;
  final String avatar;
  final String imageUrl;
  final String text;
  Cards(
    this.name,
    this.avatar,
    this.imageUrl,
    this.text,
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(children: <Widget>[
          RowWithAvatar(name, avatar),
          CardImage(imageUrl),
          ContainerText(text),
          RowWithComments(),
        ]),
      ),
    );
  }
}

class MessageTextBuild extends StatelessWidget {
  final TextEditingController textEditingController = new TextEditingController();

  void addNewMessage() {
    print('send message');
  }

  void addPhoto() {
    print('send photo');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        height: 50.0,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextField(
                  controller: textEditingController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write your comment...',
                    hintStyle: TextStyle(
                      fontSize: 16.0,
                      color: Colors.green[700],
                    ),
                  ),
                  textInputAction: TextInputAction.send,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                  onSubmitted: (_) {
                    addNewMessage();
                  },
                ),
              ),
            ),
            Container(
              width: 70,
              child: Padding(
                padding: const EdgeInsets.only(right: 20),
                child: InkWell(
                  onTap: addNewMessage,
                  child: Row(
                    children: <Widget>[
                      Flexible(
                        child: IconButton(
                            onPressed: addPhoto,
                            icon: Icon(
                              Icons.camera,
                              color: Colors.green,
                            )),
                      ),
                      Flexible(
                        child: IconButton(
                            onPressed: addNewMessage,
                            icon: Icon(
                              Icons.send,
                              color: Colors.green[700],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class RowWithComments extends StatefulWidget {
  @override
  _RowWithCommentsState createState() => _RowWithCommentsState();
}

class _RowWithCommentsState extends State<RowWithComments> {
  int _like = 0;
  int _comments = 0;

  void _likeCounter() {
    setState(() {
      _like++;
    });
  }

  void _commentCounter() {
    print('open comment');
    setState(() {
      _comments++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          IconButton(
            onPressed: _commentCounter,
            icon: Icon(
              Icons.message,
              size: 20,
              color: Colors.green[200],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Text(_comments.toString() + ' Comments'),
          // Spacer(),
          IconButton(
            onPressed: _likeCounter,
            icon: Icon(
              Icons.thumb_up,
              size: 20,
              color: Colors.green[200],
            ),
          ),
          SizedBox(
            width: 0,
          ),
          Text(_like.toString() + ' Likes'),
        ],
      ),
    );
  }
}

class ContainerText extends StatelessWidget {
  final String text;
  ContainerText(this.text);

  @override
  Widget build(BuildContext context) {
    if (text == null) {
      return Container();
    } else {
      return Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.black12,
              width: 1,
            ),
          ),
        ),
        child: Text(text),
      );
    }
  }
}

class CardImage extends StatelessWidget {
  final String imageUrl;
  CardImage(this.imageUrl);

  @override
  Widget build(BuildContext context) {
    if (imageUrl == null) {
      return Container(
        height: 0,
      );
    } else {
      return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(imageUrl),
          ),
        ),
      );
    }
  }
}

class RowWithAvatar extends StatelessWidget {
  final String name;
  final String avatar;
  RowWithAvatar(this.name, this.avatar);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black12,
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: Text(avatar),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name),
              Text(
                'Publish at 15:20',
                style: TextStyle(
                    fontStyle: FontStyle.italic, color: Colors.green[300]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
