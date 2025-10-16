# GitHub Actions 工作流配置

本项目配置了多个 GitHub Actions 工作流，用于自动编译 Flutter 应用的 iOS 和 Android 版本。

## 工作流说明

### 1. flutter-build.yml
综合构建工作流，包含：
- iOS 构建（无签名）
- Android APK 构建
- 示例应用 iOS 构建（无签名）
- 示例应用 Android APK 构建

### 2. ios-simple.yml
iOS 简单构建工作流（参考你的配置）：
- 仅构建 iOS 版本
- 无代码签名
- 生成 IPA 文件

### 3. android-build.yml
Android 专用构建工作流：
- 构建 APK 文件
- 构建 AAB (Android App Bundle) 文件

### 4. example-build.yml
示例应用专用构建工作流：
- 独立构建示例应用
- 支持 iOS 和 Android

## 触发条件

所有工作流都支持以下触发方式：
- 推送到 `main` 或 `develop` 分支
- 对 `main` 或 `develop` 分支的 Pull Request
- 手动触发（通过 GitHub 界面）

## 使用方法

### 手动触发构建

1. 进入 GitHub 仓库的 Actions 标签页
2. 选择要运行的工作流
3. 点击 "Run workflow" 按钮
4. 选择分支并运行

### 获取构建产物

构建完成后，可以在以下位置下载构建产物：
- **iOS IPA**: 在 `ios-simple` 或 `flutter-build` 工作流的 Artifacts 中
- **Android APK**: 在 `android-build` 或 `flutter-build` 工作流的 Artifacts 中
- **示例应用**: 在 `example-build` 工作流的 Artifacts 中

## 构建产物

### iOS 构建
- IPA 文件（无签名，仅用于测试）
- 构建产物位于 `build/ios/iphoneos/`

### Android 构建
- APK 文件（`app-release.apk`）
- AAB 文件（`app-release.aab`）
- 构建产物位于 `build/app/outputs/`

## 注意事项

1. **iOS 签名**: 当前配置为无签名构建，仅适用于开发和测试。如需发布到 App Store，需要配置签名证书。

2. **Flutter 版本**: 工作流使用 Flutter 3.16.0，可以根据需要修改版本号。

3. **构建时间**: iOS 构建通常需要 10-20 分钟，Android 构建需要 5-10 分钟。

4. **存储限制**: GitHub Actions 的构建产物有存储期限（默认 90 天），请及时下载需要的文件。

## 自定义配置

可以根据需要修改工作流文件：
- 修改 Flutter 版本
- 添加构建参数
- 修改触发条件
- 添加测试步骤
- 配置签名信息（iOS）

## 故障排除

如果构建失败，请检查：
1. Flutter 代码是否有编译错误
2. 依赖是否正确安装
3. 工作流文件语法是否正确
4. GitHub Actions 的运行日志