import 'package:flutter/material.dart';
import 'package:FlutterStyle/models/friends_model.dart';
import 'package:FlutterStyle/models/player_ratings_model.dart';
import 'package:FlutterStyle/widgets/friend_widget.dart';


class FriendsScreen extends StatelessWidget {
  final List<Friend> friendList = [
    Friend(
      'Aurélien',
      [
        PlayerNotation(
          'Zinedine Zidane',
          'Real Madrid',
          9.8,
          'https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2Fvar.2Fgal.2Fstorage.2Fimages.2Fmedia.2Fimages.2Factu.2Fphotos_c_est_suprenant.2Fzinedine_zidane.2F467131-1-fre-FR.2Fzinedine_zidane.2Ejpg/480x480/quality/80/zidane-retour-au-real-madrid.jpg'
        ),
        PlayerNotation(
            'Kylian Mbappé',
            'Paris Saint Germain',
            6,
            'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5cfe85694c687b0008593562%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D19%26cropX2%3D1756%26cropY1%3D210%26cropY2%3D1948'
          ),
        PlayerNotation(
          'Dembélé Moussa',
          'Olympique Lyonnais',
          4,
          'http://photos.madeingones.com/photos/joueurs/289781.jpg'
        ),
    ]),
        Friend(
      'François',
      [
        PlayerNotation(
          'Zinedine Zidane',
          'Real Madrid',
          9,
          'https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2Fvar.2Fgal.2Fstorage.2Fimages.2Fmedia.2Fimages.2Factu.2Fphotos_c_est_suprenant.2Fzinedine_zidane.2F467131-1-fre-FR.2Fzinedine_zidane.2Ejpg/480x480/quality/80/zidane-retour-au-real-madrid.jpg'
        ),
        PlayerNotation(
          'Dembélé Moussa',
          'Olympique Lyonnais',
          7.5,
          'http://photos.madeingones.com/photos/joueurs/289781.jpg'
        ),
    ]),
    Friend(
      'Georges',
      [
        PlayerNotation(
          'Zinedine Zidane',
          'Real Madrid',
          10,
          'https://gal.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgal.2Fvar.2Fgal.2Fstorage.2Fimages.2Fmedia.2Fimages.2Factu.2Fphotos_c_est_suprenant.2Fzinedine_zidane.2F467131-1-fre-FR.2Fzinedine_zidane.2Ejpg/480x480/quality/80/zidane-retour-au-real-madrid.jpg'
        ),
        PlayerNotation(
            'Kylian Mbappé',
            'Paris Saint Germain',
            4.6,
            'https://thumbor.forbes.com/thumbor/fit-in/416x416/filters%3Aformat%28jpg%29/https%3A%2F%2Fspecials-images.forbesimg.com%2Fimageserve%2F5cfe85694c687b0008593562%2F0x0.jpg%3Fbackground%3D000000%26cropX1%3D19%26cropX2%3D1756%26cropY1%3D210%26cropY2%3D1948'
          ),
        PlayerNotation(
          'Dembélé Moussa',
          'Olympique Lyonnais',
          6.7,
          'http://photos.madeingones.com/photos/joueurs/289781.jpg'
        ),
    ]),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ...friendList.map((friend) {
                return FriendWidget(friend);
              }).toList()
            ],
          ),
        )
      ],
    );
  }
}
