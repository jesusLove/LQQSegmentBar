# LQQSegmentBar

* Pod库的创建过程
* 封装选项卡控件
* 链式编程思想

# Pod库的创建过程

* `pod lib create [名称]` 例如：`pod lib create LQQSegmentBar`
* 编写库的实现代码
* 创建远程仓库并关联，配置podspec文件
* 提交到远程仓库，`git add .`添加到暂存区；` git commit -m '注释'`添加到工作区；`git push origin master`推送到远程仓库
* 打标签，`git tag -a xxx -m '注释'`标签名`xxx`,`git push --tags`推送标签远程仓库。
* 验证`podspec`文件，本地验证`pod lib lint`，远程验证`pod spec lint`
* 推送到远程索引库`pod repo push XXX xxx.podspec`，其中: XXX索引库名称需要之前添加过的，查看方式`pod repo`。

#  封装选项卡控件

## 需求

* 外界传入字符串数组，生成对应的选项卡
* 外界控制选项卡的背景颜色、选中颜色、指示器颜色等
* 点击选项卡得到索引值
* 滚动时选项卡联动