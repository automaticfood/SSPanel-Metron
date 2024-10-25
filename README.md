## SSPanel-Metron主题，目前由@BobS9维护开发中。

交流群：[https://t.me/BobShareGroup](https://t.me/BobShareGroup)

#### 1.连接 SSH 安装宝塔面板

#### 2.宝塔面板安装环境, 推荐使用 PHP 7.4、MySQL 5.7、Nginx 1.2+

#### 3.宝塔面板创建网站, 域名等信息自行填写

#### 4.连接 SSH 下载源码

`cd /www/wwwroot/你的网站文件夹名`

#### 5.使用composer安装依赖


```shell
wget https://getcomposer.org/installer -O composer.phar && php composer.phar && sudo -u www php composer.phar install
```


#### 6.复制配置文件

```shell

cp config/.config.example.php config/.config.php

cp config/.metron_setting.example.php config/.metron_setting.php

cp config/appprofile.example.php config/appprofile.php
```

.config.php设置后执行`php xcat Tool initQQWry` 下载IP解析库

#### 8.网站设置

打开 宝塔面版 > 网站 > 你的网站


    在 网站目录 里取消勾选 防跨站攻击，运行目录里面选择 /public，点击保存。

在 伪静态 中填入下面内容，然后保存


```shell
location / {
try_files $uri /index.php$is_args$args;
}
```

#### 9.在SSH里的网站目录下执行，给网站文件755权限

```shell
cd ../
chmod -R 755 你的文件夹名/
chown -R www:www 你的文件夹名/
```

#### 10.数据库操作

首次迁移: 导入网站目录下的`sql/glzjin_all.sql` 文件

将数据库user表里的全部用户的theme列改为metron，使用phpmyadmin执行这条sql语句:
```sql
UPDATE user SET theme='metron'
```

#### 11.添加计划任务

编辑定时任务列表

```
crontab -e
```

输入下面定时任务

```
# 每日任务 (每天 0 点 0 分执行)
0 0 * * * php /www/wwwroot/你的网站目录/xcat Job DailyJob

# 检测任务 (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat Job CheckJob

# 用户账户相关任务 (每小时执行一次)
0 * * * * php /www/wwwroot/你的网站目录/xcat Job UserJob

# 检查用户会员等级过期任务 (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat Job CheckUserClassExpire

# 检查账号过期任务 (每小时执行一次)
0 * * * * php /www/wwwroot/你的网站目录/xcat Job CheckUserExpire

# 定时检测邮件队列 (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat Job SendMail

# 每日流量报告 (每天 0 点 0 分执行)
0 0 * * * php /www/wwwroot/你的网站目录/xcat SendDiaryMail

# 审计封禁 (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat DetectBan

# 检测节点被墙 (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat DetectGFW

# 检测中转服务器 (每 5 分钟执行一次)
*/5 * * * * php /www/wwwroot/你的网站目录/xcat DetectTransfer

# Radius sync (每分钟执行一次)
* * * * * php /www/wwwroot/你的网站目录/xcat SyncRadius synclogin
* * * * * php /www/wwwroot/你的网站目录/xcat SyncRadius syncvpn
* * * * * php /www/wwwroot/你的网站目录/xcat SyncRadius syncnas
```

可选:

```
# 自动备份 (每 30 分钟执行一次)
*/30 * * * * php /www/wwwroot/你的网站目录/xcat Backup full
*/30 * * * * php /www/wwwroot/你的网站目录/xcat Backup simple

# 财务报表
# 日报 (每天 0 点 0 分执行)
0 0 * * * php /www/wwwroot/你的网站目录/xcat FinanceMail day
# 周报 (每周日 0 点 0 分执行)
0 0 * * 0 php /www/wwwroot/你的网站目录/xcat FinanceMail week
# 月报 (每月 1 日 0 点 0 分执行)
0 0 1 * * php /www/wwwroot/你的网站目录/xcat FinanceMail month
```