import 'package:flutter/foundation.dart';

// 聊天配置类

/// 聊天界面配置类
class ChatConfig {
  /// SDK App ID - 需要替换为您的实际 SDKAppID
  static const int sdkAppId = 0; // TODO: 替换为您的 SDKAppID
  
  /// 默认用户ID
  static const String defaultUserId = 'user123';
  
  /// 默认会话ID
  static const String defaultConversationId = 'conversation123';
  
  /// 默认会话类型（1: 单聊，2: 群聊）
  static const int defaultConversationType = 1;
  
  /// 默认会话显示名称
  static const String defaultConversationName = '测试聊天';
  
  /// 初始化聊天配置
  static Future<void> initializeChat() async {
    // 这里可以添加初始化逻辑
    debugPrint('聊天配置初始化完成');
  }
}

/// 聊天工具类
class ChatUtils {
  /// 生成 UserSig（实际项目中应该在服务端生成）
  static String generateUserSig(String userId) {
    // 这里应该使用腾讯云的 UserSig 生成算法
    // 为了演示，返回一个空字符串
    // 实际项目中请在服务端生成 UserSig
    return '';
  }
  
  /// 初始化聊天配置
  static void initializeChat() {
    // 设置默认用户配置
    ChatConfig.userId = 'test_user_001';
    ChatConfig.nickname = '测试用户';
    ChatConfig.avatar = '';
  }
}