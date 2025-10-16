import 'package:flutter/material.dart';
import 'package:tuicall_kit_example/src/chat_config.dart';

/// 简化的聊天主界面组件
class ChatMainWidget extends StatelessWidget {
  final String userId;
  final String userSig;

  const ChatMainWidget({
    Key? key,
    required this.userId,
    required this.userSig,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聊天界面'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: Colors.blue,
            ),
            SizedBox(height: 16),
            Text(
              '用户ID: $userId',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 8),
            Text(
              '聊天功能开发中...',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // 返回上一页
                Navigator.of(context).pop();
              },
              child: Text('返回'),
            ),
          ],
        ),
      ),
    );
  }
}