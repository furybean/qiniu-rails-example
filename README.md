qiniu-rails-example
===================

一个基于 [七牛云存储](http://www.qiniutek.com) [Ruby SDK](https://github.com/qiniu/ruby-sdk) 开发的示例相册程序。
修改自：[PHP 5.3 SDK 开发的示例相册程序](https://github.com/qiniu/php5.3-sdk-example)。

## 运行环境
Ruby 1.9.x & Rails 3.2.x

## 安装和运行程序
1. 获取源代码：

    `git clone https://github.com/furybean/qiniu-rails-example.git photoapp && cd photoapp`
    
2. 编辑 `config/initializers/qiniu-rs.rb` 文件，修改其中字段 `access_key` 和 `secret_key` 的值。参考 [应用接入：获取Access Key 和 Secret Key](http://docs.qiniutek.com/v3/sdk/ruby/#establish_connection!) 。

3. 在当前目录下依次执行：
rake db:create
rake db:migrate
rails server

4. 访问http://localhost:3000，注册帐号后登陆即可上传照片。

## 说明

1. WEB 批量上传组件用的开源 [SWFUpload v2.2.0.1](http://code.google.com/p/swfupload/)。

2. 相关钩子调用参考 `public/assets/js/handlers.js` 文件中的 `uploadStart()`, `uploadSuccess()`, `uploadComplete()` 方法。

## 资源
- [Ruby SDK 使用指南](http://docs.qiniutek.com/v3/sdk/ruby/)