import 'package:flutter/material.dart';
import 'package:tencent_cloud_chat_uikit/tencent_cloud_chat_uikit.dart';
import 'package:tencent_cloud_chat_sdk/tencent_cloud_chat_sdk.dart';
import 'chat_config.dart';

class ChatMainWidget extends StatefulWidget {
  final String userId;
  final String userSig;

  const ChatMainWidget({
    Key? key,
    required this.userId,
    required this.userSig,
  }) : super(key: key);

  @override
  State<ChatMainWidget> createState() => _ChatMainWidgetState();
}

class _ChatMainWidgetState extends State<ChatMainWidget> {
  late final CoreServicesImpl _coreServices;

  @override
  void initState() {
    super.initState();
    _initializeChat();
  }

  Future<void> _initializeChat() async {
    try {
      // 初始化腾讯云聊天 SDK
      await TencentImSDKPlugin.v2TIMManager.initSDK(
        sdkAppID: ChatConfig.sdkAppId,
        loglevel: LogLevelEnum.V2TIM_LOG_DEBUG,
        listener: V2TimSDKListener(),
      );

      // 登录
      await TencentImSDKPlugin.v2TIMManager.login(
        userID: widget.userId,
        userSig: widget.userSig.isNotEmpty ? widget.userSig : ChatUtils.generateUserSig(widget.userId),
      );

      setState(() {
        _coreServices = CoreServicesImpl();
      });
    } catch (e) {
      debugPrint('聊天初始化失败: $e');
      // 显示错误提示
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('聊天初始化失败: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_coreServices == null) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return TUIKitChat(
      conversationID: ChatConfig.defaultConversationId,
      conversationType: ChatConfig.defaultConversationType,
      conversationShowName: ChatConfig.defaultConversationName,
      onTapAvatar: () {
        // 点击头像回调
        debugPrint('点击了头像');
      },
      lifeCycle: TUIKitChatLifeCycle(
        messageWillSend: (V2TimMessage message) {
          // 消息发送前处理
          debugPrint('准备发送消息: ${message.textElem?.text}');
          return message;
        },
      ),
    );
  }

  @override
  void dispose() {
    // 退出登录
    TencentImSDKPlugin.v2TIMManager.logout();
    super.dispose();
  }
}