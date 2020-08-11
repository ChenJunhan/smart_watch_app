# 健康手表APP 基于flutter实现

## 项目简介
学习flutter写的一个app项目，本来打算用flutter重写公司项目，发现flutter社区基于一些类似地图、图表还有扫描二维码的插件还不太成熟，有挺多bug，于是暂时放弃用flutter重写项目，记录一些技术要点，等flutter更加成熟后再进行学习。

## 项目效果图
![](/assets/images/introduction.gif)

## 目录结构
```
├── lib    项目文件夹
│      ├── common  通用文件夹
│      │     ├── config      公用配置文件夹
│      │     ├── eventBus    共享数据文件夹
│      │     └── model       类文件夹
│      │     └── widget      公用组件
│      ├── pages             页面文件夹
│      ├── route_animates    自定义路由动画文件夹
│      └── widget            页面组件
├── design       设计图文件夹
├── assets       静态资源文件夹
└── pubspec.yaml 配置文件
```

## 技术要点
1. [启动页](/lib/splash.dart)
2. [自定义渐变标题栏](/lib/common/widget/gradient_app_bar.dart)
3. [自定义路由动画](/lib/route_animates/slide_route.dart)
```dart
// 跳转到设备信息页面
Navigator.push( context,
  new SlideRoute(builder: (context) {
        return EquipmentInfomation();
}));
```
4. [自定义底部导航栏](/lib/navigation.dart)

## 安卓下载包
![](/assets/images/apk_download.png)

## 学习资源
- [flutter中文网](https://flutterchina.club/) / [官方文档](https://flutter.dev/)
- [flutter实战](https://book.flutterchina.club/)
- [flutter-study](https://github.com/yang7229693/flutter-study)
- [flutter-learn](https://github.com/AweiLoveAndroid/Flutter-learning)