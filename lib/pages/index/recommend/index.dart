import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<String> imgList = [
  'https://tse4-mm.cn.bing.net/th/id/OIP-C.PzrAfqwH7QDyF-AGACAvyAHaFd?w=235&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.ffZbqc79eNP-xI3LqRULVQHaEo?w=274&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.G9pGzLHuWapC4dWnw-1PVAHaNK?w=115&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.jPdDv3VDyfn162vbT0buLAHaEo?w=274&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.3b0sfeEyUG4wXmT69zyKzwHaEK?w=303&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse4-mm.cn.bing.net/th/id/OIP-C.c06f2h7VnMagGN0w1ZFRFAHaF7?w=213&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse3-mm.cn.bing.net/th/id/OIP-C.CBRSObBHaX1dA_OqPdZSDQHaHt?w=163&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse3-mm.cn.bing.net/th/id/OIP-C.pfSvHtmpmAZrRPSvTIUX7wHaHB?w=179&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.Bc0XVkyftSlHnzFtdlUyAAHaEv?w=267&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.4wBfQJWi3n2zvWEVskyGYAHaEo?w=276&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse2-mm.cn.bing.net/th/id/OIP-C.zGXP-SdlX_UkuK-akHpeggHaEo?w=276&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse2-mm.cn.bing.net/th/id/OIP-C.UqvvLFmb8aLdeDs8_P6VLwHaEK?w=306&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.x_-LPRRQTeO88r02CAiUcwHaEo?w=275&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse2-mm.cn.bing.net/th/id/OIP-C.HiCEXpzbcUBRcrAc-Ckt6wHaFj?w=218&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse2-mm.cn.bing.net/th/id/OIP-C.RNCgk71yi-CLGuO_s5ZU1AHaEK?w=291&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.yoIeq6UsWUnvlduoSAOJaAHaI4?w=136&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse3-mm.cn.bing.net/th/id/OIP-C.-OXSGNKdA0Oy9IEeHRECxwHaFj?w=218&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse1-mm.cn.bing.net/th/id/OIP-C.U88OOHemN0yJzXpHaAAm4gHaEo?w=262&h=180&c=7&r=0&o=5&pid=1.7',
  'https://tse4-mm.cn.bing.net/th/id/OIP-C.sBzbSUm298vGEpPDqIP_GQHaEi?w=303&h=185&c=7&r=0&o=5&pid=1.7',
];

List<String> titleList = [
  "探索未知的世界：我的旅行日记",
  "遇见不一样的自己：走出舒适区的旅行",
  "放下束缚，拥抱自由：独自一人的旅行",
  "与自然亲密接触：徒步旅行的美好体验",
  "历史与文化的穿越之旅：探寻古老的城市遗迹",
  "与美食同行：品尝各地美味的美食之旅",
  "放松身心，重拾活力：度假村的休闲旅行",
  "与家人共度时光：开启一段难忘的亲子旅行之旅",
  "放下手机，与自己对话：数字游牧的旅行体验",
  "跨越时空的旅行：发现异国他乡的魅力"
];

List<String> nicknameList = [
  "糖果小姐",
  "小幸运",
  "猫咪奶茶",
  "星空萤火",
  "花间酒",
  "小蜜蜂",
  "樱桃小丸子",
  "喵星人",
  "小兔子",
  "夏日阳光",
  "森林精灵",
  "小鹿乖乖",
  "蜜桃公主",
  "小熊猫",
  "乐天派",
  "小鱼儿"
];

class IndexRecommendView extends StatelessWidget {
  const IndexRecommendView({Key? key}) : super(key: key);

  Widget buildCard(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: imgList[Random().nextInt(imgList.length)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(children: [
                Text(
                  titleList[Random().nextInt(titleList.length)],
                  style: const TextStyle(fontWeight: FontWeight.bold),
                )
              ]),
            ),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      CircleAvatar(
                        foregroundImage: CachedNetworkImageProvider(
                            imgList[Random().nextInt(imgList.length)]),
                      ),
                      SizedBox(width: 10),
                      Text(nicknameList[Random().nextInt(nicknameList.length)]),
                    ],
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.thumb_up,
                        color: Colors.grey,
                      ),
                    ),
                    Text('111'),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.custom(
        gridDelegate: SliverWovenGridDelegate.count(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          pattern: const [
            WovenGridTile(1),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return buildCard(index);
        }),
      ),
    );
  }
}
