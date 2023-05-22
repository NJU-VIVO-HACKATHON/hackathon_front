# hackathon_front

本项目是一款基于Flutter框架开发的类似小红书的一款App，提供了贴文浏览、用户信息、富文本展示、AIGC等功能。

需求分析文档在后端仓库中：
https://github.com/NJU-VIVO-HACKATHON/hackathon

由于时间有限，本前端项目仅实现了部分功能。
本前端项目的架构实现了一定的抽象，API实现由接口`ApiProvider`派生出 `ApiProviderImpl` 与 `ApiProviderMock`,
其中 ApiProviderImpl 实现基于Dio封装实现，Mock实现为前端开发调试使用
Storage实现由接口 `StorageProvider` 派生出 `StorageProviderImpl` 与 `StorageProviderMock`,
其中 `StorageProviderImpl` 基于 `SharedPreferences实现`
由于时间有限，本前端项目与后端项目的对接不完善，故本项目主要基于mock数据实现了demo演示。



## 使用说明
安装Flutter环境：请参考Flutter官网进行安装。本项目基于 `flutter 3.10` 开发
获取代码：`git clone https://github.com/NJU-VIVO-HACKATHON/hackathon_front.git`
安装依赖：`flutter pub get`
运行项目：`flutter run`