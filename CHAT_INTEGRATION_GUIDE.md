# TDesign Flutter 聊天功能集成指南

## 项目概述

本项目基于 TDesign Flutter 组件库，集成了腾讯云聊天 UIKit，实现了完整的聊天功能。

## ⚠️ 重要说明

### 平台兼容性限制
- **Web 平台**: ❌ 不支持 - 腾讯云聊天 UIKit 依赖 `dart:ffi`，不支持 Web 平台
- **iOS/Android**: ✅ 完全支持 - 所有聊天功能正常工作
- **桌面端**: ✅ 支持 - Windows、macOS、Linux 均可正常运行

### 当前实现状态
由于 SDK 兼容性问题，当前实现为**简化版本**，提供了基础的聊天界面框架，便于后续集成完整的聊天功能。

## 主要组件

### 1. ChatConversationListWidget
- **位置**: `lib/src/chat_conversation_list_widget.dart`
- **功能**: 聊天会话列表界面（简化版）
- **特性**:
  - 会话列表展示框架
  - 创建新聊天对话框
  - 点击进入聊天界面

### 2. ChatMainWidget
- **位置**: `lib/src/chat_main_widget.dart`
- **功能**: 聊天主界面（简化版）
- **特性**:
  - 基础聊天界面框架
  - 用户信息显示
  - 返回导航功能

### 3. ChatConfig
- **位置**: `lib/src/chat_config.dart`
- **功能**: 聊天配置类
- **配置项**:
  - SDKAppID
  - 默认用户ID
  - 会话ID
  - 会话类型

## 配置步骤

### 1. 获取 SDKAppID
1. 登录 [腾讯云控制台](https://console.cloud.tencent.com/im)
2. 创建应用并获取 SDKAppID
3. 在 `ChatConfig` 类中更新 `sdkAppId` 字段

### 2. 配置 UserSig
UserSig 是腾讯云的用户身份凭证，可以通过以下方式获取：
- 服务端生成（推荐）
- 本地生成（仅用于开发测试）

### 3. 平台特定配置

#### iOS/Android 配置
```bash
flutter pub get
cd ios && pod install && cd ..
flutter run
```

#### Web 平台替代方案
由于 SDK 限制，Web 平台建议使用：
- 腾讯云 IM Web SDK
- 自定义聊天界面 + 腾讯云 IM API

## 功能特性

### ✅ 已实现功能（简化版）
- 聊天会话列表框架
- 创建新聊天对话框
- 基础聊天界面
- 用户信息显示
- 导航功能

### 🚧 完整功能（需 SDK 集成）
- 实时消息发送/接收
- 群聊功能
- 文件传输
- 语音消息
- 视频消息
- 消息撤回

## 使用示例

### 进入聊天会话列表
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ChatConversationListWidget(),
  ),
);
```

### 进入指定聊天界面
```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => ChatMainWidget(
      userId: 'target_user_id',
      userSig: 'user_signature',
    ),
  ),
);
```

## 开发建议

### 1. 移动端开发
- 直接使用当前聊天 UIKit 集成
- 配置完整的 SDKAppID 和 UserSig
- 启用所有聊天功能

### 2. Web 平台开发
- 使用腾讯云 IM Web SDK
- 基于 TDesign 组件库构建自定义界面
- 参考当前组件结构进行开发

### 3. 跨平台方案
- 移动端：使用 Flutter 聊天 UIKit
- Web 端：使用 Web SDK + TDesign Web 组件
- 共享业务逻辑和数据模型

## 注意事项

1. **SDKAppID**: 必须替换为您在腾讯云控制台获取的真实 SDKAppID
2. **UserSig**: 生产环境建议通过服务端生成
3. **平台限制**: Web 平台不支持当前聊天 UIKit
4. **权限配置**: 确保在 Android 和 iOS 项目中配置了必要的权限
5. **网络配置**: 检查网络权限和域名配置

## 相关文档

- [TDesign Flutter 官方文档](https://tdesign.tencent.com/flutter/)
- [腾讯云聊天 UIKit 文档](https://cloud.tencent.com/document/product/269/70747)
- [腾讯云 IM Web SDK 文档](https://cloud.tencent.com/document/product/269/36838)
- [Flutter 官方文档](https://flutter.dev/docs)

## 技术支持

如遇到集成问题，建议：
1. 检查平台兼容性
2. 确认 SDKAppID 和密钥配置
3. 参考腾讯云官方示例代码
4. 联系腾讯云技术支持