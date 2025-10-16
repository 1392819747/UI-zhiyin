import 'package:tencent_cloud_chat_sdk/tencent_cloud_chat_sdk.dart';

/// 聊天界面配置类
class ChatConfig {
  /// 腾讯云 SDKAppID，需要在腾讯云控制台获取
  static const int sdkAppId = 0; // TODO: 替换为您的 SDKAppID
  
  /// 用户 ID
  static String userId = 'test_user_001';
  
  /// 用户昵称
  static String nickname = '测试用户';
  
  /// 用户头像
  static String avatar = '';
  
  /// 生成 UserSig 的密钥，需要在腾讯云控制台获取
  static const String secretKey = ''; // TODO: 替换为您的密钥
  
  /// 默认会话 ID（用于测试）
  static const String defaultConversationId = 'test_conversation';
  
  /// 默认会话类型（1: 单聊，2: 群聊）
  static const int defaultConversationType = 1;
  
  /// 默认会话名称
  static const String defaultConversationName = '测试聊天';
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