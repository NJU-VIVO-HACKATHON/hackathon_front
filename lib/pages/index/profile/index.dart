import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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

class IndexProfileView extends StatefulWidget {
  const IndexProfileView({Key? key}) : super(key: key);

  @override
  State<IndexProfileView> createState() => _IndexProfileViewState();
}

class _IndexProfileViewState extends State<IndexProfileView> {
  Widget buildTopBar() {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
      ),
      child: SizedBox(
        height: 100,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // 圆形头像
              Container(
                margin: const EdgeInsets.all(10),
                child: const CircleAvatar(
                  radius: 50,
                  foregroundImage:
                      AssetImage('assets/basic_tags/star_rail.png'),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '路过的靓仔',
                      style: TextStyle(fontSize: 30),
                    ),
                    const Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('LV3'),
                        Text('9372/27000'),
                      ],
                    ),
                    LinearProgressIndicator(
                      value: 0.5,
                      backgroundColor: Colors.grey[200],
                      valueColor: const AlwaysStoppedAnimation(Colors.blue),
                    ),
                    Text('个人简介：哈哈哈哈哈'),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.qr_code),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.chevron_right),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildBody() {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: imgList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            imgList[index],
            fit: BoxFit.cover,
          );
        },
      ),
    );
  }

  Widget buildCounter() {
    Widget buildCell(String title, String count) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  count,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            buildCell('关注', '0'),
            buildCell('粉丝', '0'),
            buildCell('获赞', '0'),
            buildCell('收藏', '0'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildTopBar(),
        buildCounter(),
        buildBody(),
      ],
    );
  }
}
