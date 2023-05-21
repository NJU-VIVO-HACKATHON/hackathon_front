import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hackathon_front/widget/multi_widget_selector.dart';

class InterestedPage extends StatelessWidget {
  const InterestedPage({Key? key}) : super(key: key);

  Widget buildBody(List<String> files, List<String> names) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 30,
        horizontal: 20,
      ),
      child: Center(
        child: Column(
          children: [
            const Text(
              '发现兴趣',
              style: TextStyle(fontSize: 30),
            ),
            const Text(
              '请选择您感兴趣的话题以优化个性化推荐',
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: MultiWidgetSelector(
                count: files.length,
                builder: (int index) {
                  return SizedBox(
                    width: 120,
                    height: 120,
                    child: Image.asset(
                      'assets/basic_tags/${files[index]}',
                      fit: BoxFit.cover,
                    ),
                  );
                },
                bottomBuilder: (int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 2),
                      Text(names[index]),
                    ],
                  );
                },
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Text(
                  '查看感兴趣的话题',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: rootBundle.loadString('assets/basic_tags/index.json'),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return buildBody(
              jsonDecode(snapshot.data.toString())['files'].cast<String>(),
              jsonDecode(snapshot.data.toString())['names'].cast<String>(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
