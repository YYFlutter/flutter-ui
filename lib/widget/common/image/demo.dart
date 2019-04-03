import 'package:flutter/material.dart';

class Index extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _IndexState();
}

class _IndexState extends State<Index> {
  List _imageType = ['Image.network', 'Image.asset', 'ImageProvider'];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
      ),
      body: Container(
        margin: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: ListView.builder(
          itemCount: _imageType.length,
          itemBuilder: (context, index) {
            return _Stack(_imageType[index]);
          },
        )
      )
    );
  }

  Widget _Stack (String item) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 5.0),
          width: double.infinity,
          child: _Image(item)
        ),
        Positioned(
          top: 32,
          left: 32,
          child: Text(item, style: TextStyle(fontSize:20, color: Theme.of(context).primaryColor),),
        )
      ],
    );
  }

  Widget _Image (String item) {
    switch (item) {
      case 'Image.network':
        return Image.network(
            'https://desk-fd.zol-img.com.cn/t_s960x600c5/g2/M00/02/05/Cg-4WlVxbqyIUWdVAAZhyzM-HqkAAEs-AET61oABmHj388.jpg',
            fit: BoxFit.cover
          );
          break;
      case 'Image.asset':
        return Image.asset(
          'assets/imgs/cool.jpg',
          fit: BoxFit.cover
        );
        break;
      case 'ImageProvider':
        return Image(
          image: NetworkImage(
            'https://pic.qqtn.com/up/2017-10/15082099209936659.jpg'
          ),
        );
      default:
        return Image.network(
            'https://desk-fd.zol-img.com.cn/t_s960x600c5/g2/M00/02/05/Cg-4WlVxbqyIUWdVAAZhyzM-HqkAAEs-AET61oABmHj388.jpg',
            fit: BoxFit.cover,
          );
    }
  }
}
