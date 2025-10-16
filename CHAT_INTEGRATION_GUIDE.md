# 聊天功能集成说明

## 概述
项目已从音视频通话功能切换到聊天功能，集成了腾讯云聊天 UIKit。

## 主要组件

### 1. ChatConversationListWidget
会话列表组件，显示所有聊天会话，支持：
- 查看会话列表
- 点击进入聊天界面
- 创建新聊天

### 2. ChatMainWidget  
聊天界面组件，支持：
- 发送和接收消息
- 显示消息历史
- 消息生命周期管理

### 3. ChatConfig
聊天配置类，包含：
- SDKAppID 配置
- 用户信息配置
- 默认会话设置

## 配置步骤

### 1. 获取腾讯云 SDKAppID
1. 登录 [腾讯云控制台](https://console.cloud.tencent.com/im)
2. 创建应用，获取 SDKAppID
3. 在 `ChatConfig.sdkAppId` 中填入 SDKAppID

### 2. 生成 UserSig
- 开发环境：使用控制台生成测试 UserSig
- 生产环境：在服务端生成 UserSig

### 3. 配置用户信息
修改 `ChatConfig` 中的相关配置：
```dart
static String userId = 'your_user_id';
static String nickname = 'your_nickname';
static String avatar = 'your_avatar_url';
```

## 功能特性

### ✅ 已实现功能
- 会话列表展示
- 单聊界面
- 消息发送/接收
- 用户头像显示
- 消息状态显示

### 🚧 待实现功能
- 群聊支持
- 文件传输
- 语音消息
- 视频消息
- 表情包
- 消息撤回

## 使用示例

### 启动聊天界面
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ChatMainWidget(
      userId: 'user123',
      userSig: 'generated_user_sig',
    ),
  ),
);
```

### 显示会话列表
```dart
const ChatConversationListWidget()
```

## 注意事项

1. **UserSig 安全**：生产环境必须在服务端生成 UserSig
2. **SDKAppID**：确保使用正确的 SDKAppID
3. **网络权限**：Android 需要添加网络权限
4. **推送配置**：如需离线推送，需要额外配置推送服务

## 相关文档

- [腾讯云聊天 SDK 文档](https://cloud.tencent.com/document/product/269/36838)
- [Flutter 聊天 UIKit 文档](https://pub.dev/packages/tencent_cloud_chat_uikit)
- [TDesign Flutter 组件库](https://tdesign.tencent.com/flutter/)