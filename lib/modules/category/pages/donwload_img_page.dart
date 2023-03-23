import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_feed/modules/category/pages/download_img_demo.dart';

class DownloadImgPage extends StatefulWidget {
  const DownloadImgPage({super.key});

  static const String routeName = "/download_img"; 

  @override
  State<DownloadImgPage> createState() => _DownloadImgPageState();
}

class _DownloadImgPageState extends State<DownloadImgPage> with DownloadImgMixinStateful {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Dowload Image")),
      body: Container(
        child: Center(
        child: Column(children: [
          ElevatedButton(onPressed: () {
            downloadImg('Ahihihihihi', 'https://randomuser.me/api/portraits/men/75.jpg');
          }, child: Text("Download Image"))
        ],) 
        
        ),)
    );
  }
}