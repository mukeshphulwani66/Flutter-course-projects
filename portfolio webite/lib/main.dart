import 'dart:html';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio web app',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Mukesh Phulwani'),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeroSection(),
                SizedBox(height: 20),
                Text('   Projects -', style: TextStyle(fontSize: 40)),
                SizedBox(height: 20),
                ProjectSection(),
                SizedBox(height: 20),
                Text('   Skills -', style: TextStyle(fontSize: 40)),
                SkillsSection()
              ],
            ),
          )),
    );
  }
}

class HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 600),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            'images/hero.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
          ),
          Text(
            '   I am Mukesh Phulwani. \n   I write code for Web and Mobile Apps.',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: MediaQuery.of(context).size.width > 768 ? 50 : 30,
                color: Colors.white,
                backgroundColor: Theme.of(context).primaryColor),
          )
        ],
      ),
    );
  }
}

class ProjectSection extends StatelessWidget {
  final List<Map> projets = [
    {
      "title": "Instagram clone",
      "url": "instagram.com",
      "image":
          "https://images.unsplash.com/photo-1585247226801-bc613c441316?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Insta chat",
      "url": "instagram.com",
      "image":
          "https://images.unsplash.com/photo-1512486130939-2c4f79935e4f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "My Store",
      "url": "codersneverquit.in",
      "image":
          "https://images.unsplash.com/photo-1509395062183-67c5ad6faff9?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Notes App",
      "url": "codersneverquit.in",
      "image":
          "https://images.unsplash.com/photo-1516131206008-dd041a9764fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
    {
      "title": "Job Portal",
      "url": "codersneverquit.in",
      "image":
          "https://images.unsplash.com/photo-1516131206008-dd041a9764fd?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=80"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300, crossAxisSpacing: 10, mainAxisSpacing: 10),
      children: projets
          .map((e) => Container(
                margin: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: GridTile(
                    header: GridTileBar(
                      title: Text(e["title"]),
                      backgroundColor: Theme.of(context).primaryColorDark,
                    ),
                    child: Image.network(e["image"]),
                    footer: GridTileBar(
                      title: TextButton.icon(
                          onPressed: () {
                            window.open(e["url"], 'code link');
                          },
                          icon: Icon(Icons.code,
                              color: Theme.of(context).primaryColorDark),
                          label: Text(
                            'View code',
                            style: TextStyle(
                                color: Theme.of(context).primaryColorDark),
                          )),
                      backgroundColor: Colors.white,
                    ),
                  ),
                ),
              ))
          .toList(),
    );
  }
}

class GenerateStars extends StatelessWidget {
  final int star;
  final String skillname;

  GenerateStars({required this.skillname, required this.star});
  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [
      Container(
          width: 180,
          child: Text(
            skillname,
            style: TextStyle(fontSize: 30),
          )),
    ];
    for (var i = 1; i <= star; i++) {
      stars.add(Icon(Icons.star,color: Theme.of(context).primaryColor,));
    }
    for (var i = star; i <= 10; i++) {
      stars.add(Icon(Icons.star_outline));
    }

    return Row(
      children: stars,
    );
  }
}

class SkillsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            GenerateStars(skillname: 'React', star: 7),
            GenerateStars(skillname: 'Node.js', star: 7),
            GenerateStars(skillname: 'Html/css/js', star: 5),
            GenerateStars(skillname: 'FLutter', star: 6),
            GenerateStars(skillname: 'Python', star: 4),
          ],
        ),
        if(MediaQuery.of(context).size.width > 946) Image.asset('images/webdev.png',fit: BoxFit.cover),
      ],
    );
  }
}
