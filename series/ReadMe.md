- GLKit（OpenGL API）
  - GLKView/GLKViewController：样板代码抽样出来的类，基本
  - GLKEffects：1.0/2.0，实践了共同渲染行为，获得基本光照和纹理工作的方法
  - GLMath：通用向量、矩阵操作等数学库
  - GLKTextureLoader：读取影像格式加载纹理


* OpenGL
  * 低阶 API，交互作用于图型卡与绘制屏幕。


* 对比
  * 1.0：固定管线，使用内置函数设置灯、顶点、颜色、数码相机等
  * 2.0：可编程管线，自己建立
* hello 程序
  * QuartzCore.framework、OpenGLES.framework、GLKit.framework
  * EAGLContext、GLKViewDelegate
  * glClearColor、glClear
  * drawableColorFormat(存储颜色并显示的缓存)、drawableDepthFormat（深度缓冲）、drawableStencilFormat(模板缓存)、drawableMultisample(多重采样缓存)
  * drawableHeight(drawableWidth，只读)、snapshot（当前上下文的UIImage）、bindDrawable(重新绑定帧缓存)、deleteDrawable
  * enableSetNeedsDisplay


* GLKViewController
  * FPS：framesPerSecond
  * 仅执行顺序，draw 方法 -> update 方法
  * timeSinceLastUpdate
  * pause
  * timeSinceLastDraw 等
* 顶点缓冲对象
  * glGenBuffers：创建新的缓存对象
  * glBindBuffer：告诉 OpenGL 要处理创建的顶点缓存
  * glBufferData：内存作用在CPU，将数据搬移到显卡
* GLKBaseEffect
  * 创建 GLKBaseEffect，需要销毁
  * 设置属性
    * projectionMatrix：投影矩阵，视野（一般设置在65-75，GLKMathDegreesToRadians）、宽高比、远近平面——GLKMatrix4MakePerspective
    * modelViewMatrix：几何及特效绘制间的转换器
  * [self.effect prepareToDraw]
  * 启用`pre-define`预声明属性
  * 绘制几何：glDrawElements

