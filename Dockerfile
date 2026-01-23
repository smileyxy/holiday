# 使用官方的Java开发镜像作为基础镜像
FROM openjdk:8-jdk-alpine

# 设置工作目录
WORKDIR /usr/src/app

# 将你的应用的jar文件复制到Docker镜像中
COPY target/holiday-*.jar /app.jar

RUN echo "Asia/Shanghai" > /etc/timezone
EXPOSE 8001

# 设置环境变量，默认情况下可以是空值，允许在运行容器时通过 `-e` 参数覆盖
ENV DB_HOST=localhost
ENV DB_PORT=3306
ENV DB_NAME=magichouse-api
ENV DB_USERNAME=root
ENV DB_PASSWORD=password

ENTRYPOINT ["java","-jar","/app.jar"]