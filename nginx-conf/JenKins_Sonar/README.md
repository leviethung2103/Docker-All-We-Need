## System Requirement
Linux 18.04, 22.04

Linux 18.04: Use the Sonar version 10

Linux 22.04: Use Sonar version 8.9.9-community -> Worked best

Sử dụng 18.04 thì có thể chạy trực tiếp trên `docker-compose.yml`.

Khi chạy trên linux version 22.04 thì chạy thủ công

```
docker run -it -d -p 9000:9000 -p 9002:9002 --name sonarqube sonarqube:8.9.9-community
```



## Docker Host Requirements 
Bởi vì SonnarQube nó sử dụng ElasticSearch. nên cấu hình hợp lí để cho nó chạy.

Because SonarQube uses an embedded Elasticsearch, make sure that your Docker host configuration complies with the Elasticsearch production mode requirements and File Descriptors configuration.

For example, on Linux, you can set the recommended values for the current session by running the following commands as root on the host:

sysctl -w vm.max_map_count=524288
sysctl -w fs.file-max=131072
ulimit -n 131072
ulimit -u 8192

## Use volumes
Nên tạo volumes cho các thư mực
We recommend creating volumes for the following directories:

/opt/sonarqube/data: data files, such as the embedded H2 database and Elasticsearch indexes
/opt/sonarqube/logs: contains SonarQube logs about access, web process, CE process, Elasticsearch logs
/opt/sonarqube/extensions: for 3rd party plugins
Warning: You cannot use the same volumes on multiple instances of SonarQube.