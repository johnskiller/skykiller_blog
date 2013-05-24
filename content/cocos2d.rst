Cocos2D基本概念
###########
:date: 2011-12-21 18:00
:author: john
:category: iphone
:slug: cocos2d

| 基本概念
|  ========
|  Cocos2D由下面这些基本概念：

| \* Scenes
|  \* Director
|  \* Layers
|  \* Sprites

| Scense 场景
|  ------------
| 
场景是一个相对独立的流程，对于游戏来说，可能会有这些场景：开场动画，主菜单，第一关，过场动画，第二关。。。。最终过关动画，最高分等等。场景也常常叫做screen或者stage。

每个场景包含多个Layer

| Director 导演
|  -------------
|  \_CCDirector\_
负责场景间的调度，也就是怎样，何时从一个场景切换到另一个场景。

CCDirector是一个共享的对象（singleton），它知道当前活动场景，并且维持一个场景堆栈，用来实现（scene
calls，也就是暂停一个场景，切换到另一个，并且可以回到暂停的场景继续执行）。

同时，CCDirector还负责初始化OpenGL ES。

| Layers 层
|  ----------
|  \_CCLayer\_
对象的size是整个drawable区域，并且可以自己绘制自己。每个层可以是透明，半透明或者部分透明的（例如，不透明的层上有一些透明的洞，可以看到下面的层）。层定义了表现和行为，所以大部分的程序量是编写CCLayer的子类。

CCLayer也是定义事件驱动的地方。事件在各个层中从上到下传递，直到有一层处理它为止。

Cocos2D也提供了很多现成的CCLayer子类可供直接使用。

| Sprites 精灵
|  -----------
|  cocos2d' sprite是2D的image，可以移动，旋转，缩放以及动画。

精灵可以有父子关系，父精灵移动，旋转等变换时，子精灵也跟随变换。
