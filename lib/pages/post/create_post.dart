import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hackathon_front/global/index.dart';
import 'package:hackathon_front/util/aigc.dart';

import 'preview_page.dart';

final _log = GlobalObjects.logger;

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends State<CreatePostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  bool emojiShowing = false;

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  Future<String?> showAIGCDialog() async {
    TextEditingController controller = TextEditingController();
    return await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('请输入AI提示词: '),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // 生成图像
                  TextButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'AI生成中...');
                      String content = await generateContentByAI(
                        controller.text,
                        GenMode.image,
                      );
                      EasyLoading.showSuccess('生成成功！');
                      if (!mounted) return;
                      Navigator.of(context).pop('![]($content)');
                    },
                    child: const Text('生成图像'),
                  ),
                  // 生成文本
                  TextButton(
                    onPressed: () async {
                      EasyLoading.show(status: 'AI生成中...');
                      String content = await generateContentByAI(
                        controller.text,
                        GenMode.text,
                      );
                      EasyLoading.showSuccess('生成成功！');
                      if (!mounted) return;
                      Navigator.of(context).pop(content);
                    },
                    child: const Text('生成文本'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('添加文章')),
      body: Column(
        children: [
          const TextField(
            decoration: InputDecoration(
              labelText: '标题',
              hintText: '请输入标题',
              prefixIcon: Icon(Icons.title),
            ),
          ),
          Expanded(
            child: TextField(
              controller: _contentController,
              style: const TextStyle(fontSize: 20.0, color: Colors.black87),
              maxLines: null,
              minLines: 999999,
              decoration: const InputDecoration(
                hintText: 'Type a message',
                filled: true,
                fillColor: Colors.white,
                contentPadding: EdgeInsets.only(
                  left: 16.0,
                  bottom: 8.0,
                  top: 8.0,
                  right: 16.0,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        emojiShowing = !emojiShowing;
                      });
                    },
                    icon: const Icon(Icons.emoji_emotions),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.image),
                  ),
                  IconButton(
                    onPressed: () async {
                      String? content = await showAIGCDialog();
                      print(content);
                      _contentController.text += content ?? '';
                    },
                    icon: const Icon(Icons.article),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return PreviewPage(
                                title: _titleController.text,
                                content: _contentController.text);
                          },
                        ));
                      },
                      icon: Icon(Icons.open_in_browser_outlined))
                ],
              ),
              ElevatedButton(
                onPressed: () async {
                  _log.i('发布内容：${_contentController.text}');
                  final api = GlobalObjects.apiProvider.post;
                  EasyLoading.show(status: '发布中...');
                  await api.createPost(
                    title: _titleController.text,
                    content: _contentController.text,
                    cover: '',
                  );
                },
                child: const Text('发布'),
              ),
            ],
          ),
          Offstage(
            offstage: !emojiShowing,
            child: SizedBox(
                height: 250,
                child: EmojiPicker(
                  textEditingController: _contentController,
                  config: const Config(
                    columns: 7,
                    emojiSizeMax: 32,
                    verticalSpacing: 0,
                    horizontalSpacing: 0,
                    gridPadding: EdgeInsets.zero,
                    initCategory: Category.RECENT,
                    bgColor: Color(0xFFF2F2F2),
                    indicatorColor: Colors.blue,
                    iconColor: Colors.grey,
                    iconColorSelected: Colors.blue,
                    backspaceColor: Colors.blue,
                    skinToneDialogBgColor: Colors.white,
                    skinToneIndicatorColor: Colors.grey,
                    enableSkinTones: true,
                    showRecentsTab: true,
                    recentsLimit: 28,
                    replaceEmojiOnLimitExceed: false,
                    noRecents: Text(
                      'No Recents',
                      style: TextStyle(fontSize: 20, color: Colors.black26),
                      textAlign: TextAlign.center,
                    ),
                    loadingIndicator: SizedBox.shrink(),
                    tabIndicatorAnimDuration: kTabScrollDuration,
                    categoryIcons: CategoryIcons(),
                    buttonMode: ButtonMode.MATERIAL,
                    checkPlatformCompatibility: true,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
