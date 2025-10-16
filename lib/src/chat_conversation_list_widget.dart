import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_sdk/tencent_cloud_chat_sdk.dart';
import 'chat_config.dart';
import 'chat_main_widget.dart';

/// 聊天会话列表组件
class ChatConversationListWidget extends StatefulWidget {
  const ChatConversationListWidget({Key? key}) : super(key: key);

  @override
  State<ChatConversationListWidget> createState() => _ChatConversationListWidgetState();
}

class _ChatConversationListWidgetState extends State<ChatConversationListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('聊天列表'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: TUIKitConversation(
        onTapConversation: (V2TimConversation conversation) {
          // 点击会话进入聊天界面
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChatMainWidget(
                userId: ChatConfig.userId,
                userSig: ChatUtils.generateUserSig(ChatConfig.userId),
              ),
            ),
          );
        },
        lifeCycle: TUIKitConversationLifeCycle(
          conversationWillMount: (List<V2TimConversation> conversationList) {
            // 会话列表加载前处理
            debugPrint('会话列表加载完成，共 ${conversationList.length} 个会话');
            return conversationList;
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 创建新聊天
          _showCreateChatDialog(context);
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  /// 显示创建聊天对话框
  void _showCreateChatDialog(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('开始新聊天'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(
              hintText: '输入用户ID',
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('取消'),
            ),
            TextButton(
              onPressed: () {
                final targetUserId = controller.text.trim();
                if (targetUserId.isNotEmpty) {
                  Navigator.of(context).pop();
                  // 进入聊天界面
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ChatMainWidget(
                        userId: ChatConfig.userId,
                        userSig: ChatUtils.generateUserSig(ChatConfig.userId),
                      ),
                    ),
                  );
                }
              },
              child: const Text('确定'),
            ),
          ],
        );
      },
    );
  }
}