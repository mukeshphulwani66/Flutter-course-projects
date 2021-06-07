import 'package:flutter/material.dart';
import 'package:wallpaper_manager/wallpaper_manager.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final wallpaper = [
    'images/wallpaper1.jpg',
    'images/wallpaper2.jpg',
    'images/wallpaper3.jpg',
    'images/wallpaper4.jpg',
    'images/wallpaper5.jpg',
  ];

  void setwallpaper(ctx,path) {
    showDialog(
      context: ctx,
      builder: (context) => AlertDialog(
        title: Text('set this image as wallpaper'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('No')),
          TextButton(
              onPressed: () async {
               
                int location = WallpaperManager.HOME_SCREEN;
                await WallpaperManager.setWallpaperFromAsset(path, location);
                Navigator.of(context).pop();
              },
              child: Text('Yes')),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primarySwatch: Colors.green,
          textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30))),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Wallpaper App'),
          centerTitle: true,
        ),
        body: //Image.asset('images/wallpaper1.jpg')

            ListView.builder(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => Container(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () => setwallpaper(context,wallpaper[index]),
              child: Ink.image(
                  image: AssetImage(wallpaper[index]),
                  width: MediaQuery.of(context).size.width - 20,
                  fit: BoxFit.cover),
            ),
          ),
          itemCount: wallpaper.length,
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
