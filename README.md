# 获取法定节假日信息

## 使用说明

* 自动更新
* 保存到数据库中，减少对网络依赖
* 只有一个接口，调用简单
* 个人项目，不保证永久维护
* 开源免费

## 直接使用

## ✨ 新增功能和使用方法

本项目已经增加了以下新功能：

1. **🌐 环境变量配置支持**：
   - 现在可以通过 Docker 容器的环境变量来动态配置数据库连接信息。以下是环境变量的使用示例：
     ```bash
     docker run -d --name holiday-app -p 8001:8001      -e DB_HOST=mydbhost      -e DB_PORT=3306      -e DB_NAME=holidaydb      -e DB_USERNAME=root      -e DB_PASSWORD=secret      smileyxy/holiday:latest
     ```
   - 这些环境变量使您可以灵活地在不同的环境中部署应用程序，无需修改代码或配置文件。

2. **🚀 自动化构建和发布**：
   - 使用 GitHub Actions 配置了自动化的 Docker 镜像构建与发布流程。每次代码推送到 `main` 分支时，都会自动触发构建并将最新镜像推送到 Docker Hub。

3. **📄 使用方法**：
   - 您可以通过以下命令拉取并运行最新的 Docker 镜像：
     ```bash
     docker pull smileyxy/holiday:latest
     docker run -d --name holiday-app -p 8001:8001 smileyxy/holiday:latest
     ```
   - 在浏览器中访问 `http://localhost:8001` 即可使用该应用。

> **💡 提示**：此镜像基于 [Haoshenqi0123/holiday](https://github.com/Haoshenqi0123/holiday) 项目构建，并作出了一些定制化调整。

### 接口地址

            http://api.haoshenqi.top/holiday

### 参数

        eg:
            http://api.haoshenqi.top/holiday?date=2019-05-01
            http://api.haoshenqi.top/holiday?date=2019-05
            http://api.haoshenqi.top/holiday?date=2019

### 响应

        eg:
            {
                "date": "2019-05-01",
                "year": 2019,
                "month": 5,
                "day": 1,
                "status": 3
            }

        status: 0普通工作日1周末双休日2需要补班的工作日3法定节假日

### 2.0 新功能

            http://api.haoshenqi.top/holiday/today

### 响应

        eg:
            工作
        -- 今天需要上班
            休息
        -- 今天不用上班

        -- today 可以换成 tomorrow yesterday

## [使用容器(docker-compose)运行](https://github.com/Haoshenqi0123/holiday/wiki/%E4%BD%BF%E7%94%A8%E5%AE%B9%E5%99%A8%E8%BF%90%E8%A1%8C)

## [配合ios快捷操作实现法定节假日闹钟](https://github.com/Haoshenqi0123/holiday/wiki/%E6%94%AF%E6%8C%81IOS%E6%B3%95%E5%AE%9A%E8%8A%82%E5%81%87%E6%97%A5%E9%97%B9%E9%92%9F)



## 二次开发

### 注意事项

```diff 
+ 百度API接口修改了，已经更新了最新的api

+ 修改你的 spring.datasource
+ 需要安装lombok插件 http://plugins.jetbrains.com/plugin/6317-lombok
- 服务器资源有限，访问过于频繁会把ip加入黑名单，一天后自动解除。
``` 
