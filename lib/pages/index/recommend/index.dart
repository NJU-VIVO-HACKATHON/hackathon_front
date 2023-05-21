import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

List<String> imgList = [
  'https://bkimg.cdn.bcebos.com/pic/500fd9f9d72a6059252d1977427a239b033b5bb50c05?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto',
  'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fnimg.ws.126.net%2F%3Furl%3Dhttp%3A%2F%2Fdingyue.ws.126.net%2F2021%2F0624%2Fca3f3547j00qv6yuq002ic000mn0148c.jpg%26thumbnail%3D650x2147483647%26quality%3D80%26type%3Djpg&refer=http%3A%2F%2Fnimg.ws.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1636620826&t=1f7e60c5d4a5baadafbae5d25dfdae39',
  'https://bkimg.cdn.bcebos.com/pic/0d338744ebf81a4c510f10a4bd647759252dd42a0805?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UyMjA=,g_7,xp_5,yp_5/format,f_auto',
  'https://upload-images.jianshu.io/upload_images/6865547-100e574111cf0696.png?imageMogr2/auto-orient/strip|imageView2/2/w/507/format/webp',
  'https://bkimg.cdn.bcebos.com/pic/500fd9f9d72a6059252d1977427a239b033b5bb50c05?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxNTA=,g_7,xp_5,yp_5/format,f_auto',
  'https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/76a788337365419c971a94a5fbdbc4f8~tplv-k3u1fbpfcp-zoom-crop-mark:1304:1304:1304:734.awebp?',
  'https://upload-images.jianshu.io/upload_images/6865547-100e574111cf0696.png?imageMogr2/auto-orient/strip|imageView2/2/w/507/format/webp',
  'https://bkimg.cdn.bcebos.com/pic/0ff41bd5ad6eddc451dad5965395a1fd5266d0169502?x-bce-process=image/watermark,image_d2F0ZXIvYmFpa2UxMTY=,g_7,xp_5,yp_5/format,f_auto',
  'https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/76a788337365419c971a94a5fbdbc4f8~tplv-k3u1fbpfcp-zoom-crop-mark:1304:1304:1304:734.awebp?',
  'https://upload-images.jianshu.io/upload_images/6865547-100e574111cf0696.png?imageMogr2/auto-orient/strip|imageView2/2/w/507/format/webp',
  'https://p9-juejin.byteimg.com/tos-cn-i-k3u1fbpfcp/76a788337365419c971a94a5fbdbc4f8~tplv-k3u1fbpfcp-zoom-crop-mark:1304:1304:1304:734.awebp?',
  'https://upload-images.jianshu.io/upload_images/6865547-100e574111cf0696.png?imageMogr2/auto-orient/strip|imageView2/2/w/507/format/webp',
];

List<String> titleList = [
  '创建瀑布流应用 ',
  '1.新建应用 2.配置底部导航栏 ',
  '3.引入布局插件 4.页面搭建 总结',
  ' 前言 本文着眼于搭建一个瀑布流布',
  '局的简化版Flutter应用，Jo',
  'e大叔将从应用创',
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
            // WovenGridTile(
            //   5 / 7,
            //   crossAxisRatio: 1,
            //   alignment: AlignmentDirectional.centerEnd,
            // ),
          ],
        ),
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return buildCard(index);
        }),
      ),
    );
  }
}
