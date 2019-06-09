# flutter-demos

#### 入门

#### Widgets 基础

##### 创建 Flutter 项目

```
flutter create <项目名称>
```

- 项目名称不要使用连接符（-）连接单词，可以使用下划线（\_)分隔单词。
- 需要打开模拟器

```
cd <项目名称>
flutter run
```

![启动第一个flutter应用](https://upload-images.jianshu.io/upload_images/8207483-eaff554a2cfc940f.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### 项目结构

![flutter结构](https://upload-images.jianshu.io/upload_images/8207483-8ee79de4c2782797.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

- idea 用于 android studio IDE 配置
- android 和 ios 分别 Android 和 ios 放置 native code
- lib 是我们工作的目录
- test 测试
- metadata
- pubspec.yaml 是一个比较重要文件，是有关项目配置和依赖管理的文件，在这里可以添加第三方依赖

##### 启动文件

main.dart 是我们应用的启动文件，入口方法 main 方法，运行程序会找到 main 方法来执行这些都是 Flutter 来自动执行该方法。我们不需要手动调用 main 方法。

```
main() {}
```

##### Widget 是 Flutter 的基石

- 每一个组件都是 Widget
- 每一个页面也都是 Widget
- 甚至整个应用都是一个 Widget
  其实 Flutter 项目就是 widget 树，有点像 web 应用的 DOM 树，这也是 Flutter 也可以编译为 web 应用。

##### 创建第一个 Widget

在 Dart 语言中 object 是第一个公民，那么也就是说 Dart 是属于 OO 系的语言，通过类来组织代码。
创建自己的 widget ，每一个 Widget 都是可以定义 Widget 的模样和功能的 class，那么我们创建 Class 并让其扩展 Widget。要扩展 Widget 我们就需要先引入所需包（package）

```
import 'package:flutter/material.dart';
```

给应用根 Widget 起个名字并扩展 StatelessWidget

```
class ZiApp extends StatelessWidget{

}
```

扩展了 Widget 类我们还需要实现一个 build 方法，Flutter 会在渲染 Widget 时候找到 build 方法并执行，然后才能将组价渲染到界面，有点像 react 的 render 方法，现在很多跨界参考。

```
class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
```

- BuildContext 也就是可会获取 Flutter 上下文，从获取一些渲染时候用到信息或应用的信息。
- 这个方法还需要返回什么，需要返回 Widget

```
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp();
  }
```

- MaterialApp() 这是一个构造函数返回一个 MaterialApp 类的实例作为我们 Widget 返回。这个类似 body dom 元素。

```
class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ZiApp'),
        ),
      ),
    );
  }
}
```

- 首先创建 MaterialApp 应用 Widget 然后在 home 属性（应该就是应该进入主页页面）吧传入 Scaffold Widget 这个 Widget 就是空白页面，我们可以在这个空白页上继续添加 Widget，添加 AppBar 作为工具栏，然后添加 Text Widget 来设置工具栏的标题。
- 最后在 main 方法中调用 run 方法来执行我们应用的实例。
  ![第一个界面](https://upload-images.jianshu.io/upload_images/8207483-766c7ea859f8a0a1.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
build(context) {
```

我们可以去掉类型，例如去掉 build 返回类型和 context 的类型，Dart 会自动推断类型所以上面写法也是行之有效的。

```
void main() => runApp(ZiApp());
```

对于只有一行表达式的函数可以写出 inline 函数形式。

到现在为止我们的应用界面还是一片空白，我们需要添加一些内容

```
return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('ZiApp'),
        ),
        body: Card(
          child: Column(
            children: <Widget>[Image(), Text("Zidea")],
          ),
        ),
      ),
    );
```

- 在 Scoffold 的 body 上添加一个 Card 的 Widget
- 在 Column Widget 上添加 Image 和 Text 分别放置图片和文字
  ![创建 assets](https://upload-images.jianshu.io/upload_images/8207483-5e012d76c44e72f0.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
  在项目目录下创建名字为 assets 的文件夹，名字可以随意其。不过叫 assets 还是规范些，这样大家一看就知道这是一个放资源的文件夹。
  然后还需要 pubspec.yaml 文件中配置一下
  ![配置](https://upload-images.jianshu.io/upload_images/8207483-9621e3b95e661e4e.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
 Image.asset('assets/flutter_and_dart.jpg'),
              Text("Zidea")
```

然后调用 Image 的 asset 静态方法（也是构造方法）来传入图片
![图](https://upload-images.jianshu.io/upload_images/8207483-c841dad665057d17.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

Flutter 给我们提供丰富的 Widget 使用，那么我们是怎么知道有哪些 Widget 以及如何使用这些 Widget 的呢？
可在 Flutter 官网的 Widget catelog 找到答案
![图1](https://upload-images.jianshu.io/upload_images/8207483-715ea43094f02e8c.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

![图2](https://upload-images.jianshu.io/upload_images/8207483-796fcad8fce06dd7.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
body: Column(
            children: [
              RaisedButton(
                onPressed: () {},
                child: Text('Add Tut'),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/flutter.jpg'),
                    Text("Flutter 分享")
                  ],
                ),
              ),
            ],
          )),
```

想要给界面添加更多 Widget

- 首先在 body 添加 Column Widget 来布局界面我纵向排列 Widget ，然后添加一个 RaiseButton。
- 这一在 RaiseButton 的 onPressed 属性添加匿名方法来表示按钮触发动作
  ![图](https://upload-images.jianshu.io/upload_images/8207483-ff1948550143648d.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```Dart
            Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Add Tut'),
                ),
              ),
```

可通过为 RaisedButton 包裹一个 Container Widget 然后通过 margin 传入控制边距的 EdgeInsets 来控制 RaiseButton 的边距。一切都是 Widget 呀。

这里用的是 StatelessWidget 也就是说明其没有状态，数据通过外部获取，状态也是由外部控制，不会随着内部数据改变而重新调用 build 方法来渲染界面。类似 React 的函数组件。

```
class ZiApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZiAppState();
  }
}

class _ZiAppState extends State<ZiApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Add Tut'),
                ),
              ),
              Card(
                child: Column(
                  children: <Widget>[
                    Image.asset('assets/flutter.jpg'),
                    Text("Flutter 分享")
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

```

那么我们需要给组件添加状态，怎么添加状态以及如何将状态和 Widget 关联呢？

- 首先修改 ZiApp 为 StatefulWidget 子类，然后需要实现一个 createState 方法，应该提供状态的组件。
- 然后创建一个内部类 \_ZiAppState 以下划线开始类名是内部类也可以理解为私有类，在加载此文件时候 Dart 不会加载内部类吧。这个类扩展 state 状态 Widget 然后通过泛型关联到 ZiApp。

```
class _ZiAppState extends State<ZiApp> {
  List<String> _tuts = ['flutter'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: RaisedButton(
                  onPressed: () {},
                  child: Text('Add Tut'),
                ),
              ),
              Column(
                  children: _tuts
                      .map(
                        (tut) => Card(
                              child: Column(
                                children: <Widget>[
                                  Image.asset('assets/flutter.jpg'),
                                  Text(tut)
                                ],
                              ),
                            ),
                      )
                      .toList())
            ],
          )),
    );
  }
}

```

- 创建一个 List 为 tuts 可以指定列表类型为 String 并且给出一个初始值
- tuts 命名以下划线(\_)开始表示私有变量
- 因为是列表，所有用 Column Widget 包裹 Card Widget
- 通过调用 map

```
          child: RaisedButton(
                  onPressed: () {
                    setState(() {
                      _tuts.add("Dart");
                    });
                  },
                  child: Text('Add Tut'),
                ),
```

![图](https://upload-images.jianshu.io/upload_images/8207483-aa68f48bb211d0fd.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

这是普通列表，并没有可滚动功能所有下面有提示，

#### 拆分代码

![拆分文件](https://upload-images.jianshu.io/upload_images/8207483-62b52f6abfbc77f2.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

##### main.dart

```
import 'package:flutter/material.dart';
import './tut_manager.dart';

void main() => runApp(ZiApp());

class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: TutManager()),
    );
  }
}
```

##### tut_manager.dart

```
import 'package:flutter/material.dart';

import './tuts.dart';

class TutManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutManagerState();
  }
}

class _TutManagerState extends State<TutManager> {
  List<String> _tuts = ['flutter'];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            onPressed: () {
              setState(() {
                _tuts.add("Dart");
              });
            },
            child: Text('Add Tut'),
          ),
        ),
        Tuts(_tuts),
      ],
    );
  }
}

```

##### tuts.dart

```
import 'package:flutter/material.dart';

class Tuts extends StatelessWidget {
  final List<String> tuts;

  Tuts(this.tuts);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: tuts
          .map(
            (tut) => Card(
                  child: Column(
                    children: <Widget>[
                      Image.asset('assets/flutter.jpg'),
                      Text(tut)
                    ],
                  ),
                ),
          )
          .toList(),
    );
  }
}

```

- 在 Dart 有关数据传递有点像 react 通过 props 传递数据，这里通过构造函数传递数据。

···
class \_TutManagerState extends State<TutManager> {
List<String> \_tuts = [];
···
将 \_tuts 初始化数据设置为空数据，数据通过 main.dart 传递过来，看一看应该怎么实现。

```
class TutManager extends StatefulWidget {
  final String startingTut;

  TutManager(this.startingTut);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _TutManagerState();
  }
}
```

- 在 TutManager 类中定义变量 startTut 作为初始值，在构造函数对其进行初始化

```
class _TutManagerState extends State<TutManager> {
  List<String> _tuts = [];

  @override
  void initState() {
    // TODO: implement initState
    _tuts.add(widget.startingTut);
    super.initState();
  }
```

- initState 是在 builder 之前运行的，所以无需使用 setState 直接为 \_tuts 赋值即可。

```
class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: TutManager("flutter")),
    );
  }
}
```

#### Stateless 和 Stateful

- Stateless
  从外部接收数据，初始化 Widget 然后将 Widget 渲染到界面上
  当外部输入数据发生变化，其会随之进行重新渲染。
- Stateful
  与 Stateless 不同 Stateful 会维护一个内部状态。所以当输入数据或内部状态发生变化都会重新渲染界面。

#### Stateless Widget 生命周期

- constructor Function
- build()

#### Stateful 生命周期

- constructor Function
- InitState
- build
- setState ，可更改状态
- didUpdateWidget
- build

#### 更改主题

```
class ZiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.deepOrange),
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: TutManager("flutter")),
    );
  }
}
```

![更改主题](https://upload-images.jianshu.io/upload_images/8207483-42d0ba96f41c2404.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
Container(
          margin: EdgeInsets.all(10.0),
          child: RaisedButton(
            color: Theme.of(context).primaryColor,
            onPressed: () {
              setState(() {
                _tuts.add("Dart");
              });
            },
            child: Text('Add Tut'),
          ),
        ),
```

![更改按钮颜色](https://upload-images.jianshu.io/upload_images/8207483-77ab1101023300fb.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

```
return MaterialApp(
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.deepOrange,
          accentColor: Colors.deepPurple),
      home: Scaffold(
          appBar: AppBar(
            title: Text('ZiApp'),
          ),
          body: TutManager("flutter")),
    );
```

![图](https://upload-images.jianshu.io/upload_images/8207483-bfe7def1b3faac00.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)

静态类型

```
static const Color transparent = Color(0x00000000);
```

```
TutManager({this.startingTut});
```

可以给构造函数参数定义指定名称，以便在传递多个参数时更加明确

```
body: TutManager(startingTut: "flutter")),
```

可以给参数默认值，这样即使不给构造函数传递参数时会使用默认值

```
  TutManager({this.startingTut = 'default tut'});
```
