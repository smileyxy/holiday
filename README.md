# 获取法定节假日信息

## 使用说明

* 自动更新
* 保存到数据库中，减少对网络依赖
* 只有一个接口，调用简单
* 个人项目，不保证永久维护
* 开源免费

## ✨ 新增功能和使用方法

本项目已经增加了以下新功能：

1. **🌐 环境变量配置支持**：
   - 现在可以通过 Docker 容器的环境变量来动态配置数据库连接信息。以下是环境变量的使用示例：
     ```bash
     docker run -d --name holiday-app -p 8080:8080 \
     -e DB_HOST=mydbhost \
     -e DB_PORT=3306 \
     -e DB_NAME=holidaydb \
     -e DB_USERNAME=root \
     -e DB_PASSWORD=secret \
     smileyxy/holiday:latest
     ```
   - 这些环境变量使您可以灵活地在不同的环境中部署应用程序，无需修改代码或配置文件。
   
2. **📄 使用方法**：
   - 手动执行数据库初始化脚本（手动执行 SQL 脚本以在holidaydb数据库中创建 `holiday_date` 表）：
   ```sql
   SET FOREIGN_KEY_CHECKS=0;
   
   -- ----------------------------
   -- Table structure for holiday_date
   -- ----------------------------
   DROP TABLE IF EXISTS `holiday_date`;
   CREATE TABLE `holiday_date` (
     `date` varchar(20) NOT NULL COMMENT '日期yyyy-MM-dd',
     `year` int(4) NOT NULL,
     `month` int(2) NOT NULL,
     `day` int(2) NOT NULL,
     `status` int(2) DEFAULT '0' COMMENT '0普通工作日1周末2需要补班的工作日3法定节假日',
     PRIMARY KEY (`date`)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;
   ```
   
   - 您可以通过以下命令拉取并运行最新的 Docker 镜像：
    ```bash
    docker pull smileyxy/holiday:latest
    docker run -d --name holiday-app -p 8001:8001 smileyxy/holiday:latest
    ```
   - 在浏览器中访问
    ```bash
    http://locaohost:8001/holiday/today
    http://locaohost:8001/holiday?date=2019-05-01
    http://locaohost:8001/holiday?date=2019-05
    http://locaohost:8001/holiday?date=2019
    ```

> **💡 提示**：此镜像基于 [Haoshenqi0123/holiday](https://github.com/Haoshenqi0123/holiday) 项目构建，并作出了一些定制化调整。


## ⚙️ 环境变量说明

| 环境变量名       | 功能描述                                                                 | 使用示例                      |
|----------------|------------------------------------------------------------------------|-----------------------------|
| 🌐 `DB_HOST`    | 指定数mysql服务器的主机地址。                      | `-e DB_HOST=mydbhost`       |
| 🌐 `DB_PORT`    | 指定mysql服务器的端口号。                      | `-e DB_PORT=3306`           |
| 📂 `DB_NAME`    | 指定要连接的数据库名称。                           | `-e DB_NAME=holidaydb`      |
| 👤 `DB_USERNAME`| 指定用于连接mysql的用户名。                          | `-e DB_USERNAME=root`       |
| 🔑 `DB_PASSWORD`| 指定用于连接mysql的密码。                 | `-e DB_PASSWORD=secret`     |

---

## 直接使用

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
