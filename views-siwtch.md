###视图跳转方式

1.通过modal方式进行跳转（presentviewconller：方法）

   - 注意事项：默认他的实现过程是移除跳转之前的控制器的view，并将新的控制器的view展示，但跳转之前的控制器并没有被释放，而是被强引用着。

2.通过导航控制器进行跳转（pushviewcontroller:方法）

  - 注意事项：在导航控制器中子控制器以栈的形式存储，只有在栈顶的控制器能够显示在界面中，一旦一个子控制器出栈则会被销毁。导航控制器默认也不会显示任何视图（这个控制器自身的UIView不会显示），它必须有一个根控制器rootViewController，而且这个根控制器不会像其他子控制器一样被销毁。

3.通过UITabBarController进行跳转

 - 注意事项：创建了UIViewController之后默认就会显示这个视图，但是UITabBarController本身并不会显示任何视图，如果要显示视图则必须设置其viewControllers属性（它默认显示viewControllers[0]）。这个属性是一个数组，它维护了所有UITabBarController的子视图。为了尽可能减少视图之间的耦合，所有的UITabBarController的子视图的相关标题、图标等信息均由子视图自己控制，UITabBarController仅仅作为一个容器存在。