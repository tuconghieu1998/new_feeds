import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadFileDemo extends StatefulWidget {
  const DownloadFileDemo({Key? key}) : super(key: key);

  static const String routeName = "/downloadfile";

  @override
  _DownloadFileDemoState createState() => _DownloadFileDemoState();
}

class _DownloadFileDemoState extends State<DownloadFileDemo> {
  var imageUrl =
      "https://www.itl.cat/pngfile/big/10-100326_desktop-wallpaper-hd-full-screen-free-download-full.jpg";
  bool downloading = true;
  String downloadingStr = "No data";
  double percentDownload = 0;
  String savePath = "";
  double size = 250;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Download File"),
          backgroundColor: Colors.pink,
        ),
        body: Column(
          children: [
            Center(
              child: downloading
                  ? SizedBox(
                      height: size,
                      width: size,
                      child: Card(
                        color: Colors.pink,
                        child: Center(
                          child: Text(
                            downloadingStr,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    )
                  : SizedBox(
                      height: size,
                      width: size,
                      child: Center(
                        child: Image.file(File(savePath), height: 200),
                      ),
                    ),
            ),
            if(downloading) 
              LinearProgressIndicator(
              value: percentDownload,
              semanticsLabel: 'Linear progress indicator',
              color: Colors.green,
            ),
             
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ElevatedButton(
                  onPressed: downloadFile,
                  child: const Text('Download'),
                ),
              ),
            ),
          ],
        ),
    );
  }

  Future downloadFile() async {
    try {
      final dio = Dio();

      final fileName = imageUrl.substring(imageUrl.lastIndexOf("/") + 1);

      savePath = await getFilePath(fileName);
      await dio.download(options: Options(headers: {HttpHeaders.acceptEncodingHeader: "*"}), imageUrl, savePath, onReceiveProgress: (rec, total) {
        setState(() {
          downloading = true;
          percentDownload = (rec / total);
          print("Percent $percentDownload | $rec | $total");
          downloadingStr = "Downloading Image : $rec";
        });
      });
      setState(() {
        downloading = false;
        downloadingStr = "Completed";
      });
    } catch (e) {
      print(e.toString());
    }
  }

  Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    final dir = await getApplicationDocumentsDirectory();

    path = '${dir.path}/$uniqueFileName';

    return path;
  }
}
