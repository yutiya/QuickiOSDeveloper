# BackGesuture

看了这篇博客，http://www.jianshu.com/p/d39f7d22db6c/comments/378395#comment-378395
谢谢楼主分享


利用runtime，添加一个和系统相同的手势，达到滑动返回
我将它做成了一个category，在uiviewcontroll中

self.navigationController != nil && self.navigationControler.viewControllers.count > 1

即可调用addBackGesture方法添加滑动返回手势(PS:自定义滑动返回按钮后，系统默认手势将不可用，所以添加一个就可以使用了)
由于调用苹果底层未公开的api，估计不能上架，仅供学习、创意和交流
