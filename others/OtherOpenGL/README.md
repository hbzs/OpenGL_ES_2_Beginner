## Shader Intro

### 对比

1.x：变换和光照；纹理环境和颜色求和、雾、Alpha 测试

2.0：顶点着色器；片元着色器

### Shader 语言数据类型

* float、int、bool
* vec2、vec3、vec4 / ivec2、ivec3、ivec4 / bvec2、bvec3、bvec4 （包含 n 个数的向量）
* mat2、mat3、mat4 （n * n 维矩阵）
* sampler1D、sampler2D、sampler3D （n D纹理采集器）

### 顶点着色器

* 可编程的处理单元，执行顶点变换、纹理坐标变换、光照、材质等顶点的相关操作。
* 每顶点执行一次。
* ![顶点着色器处理](http://img.blog.csdn.net/20140628140019093?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ3JhZng=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  * attribute 变量：只能用于顶点着色器。一般表示顶点数据（顶点坐标、纹理坐标、颜色等）
  * uniform 变量：将数据值从应用程序传递到顶点着色器或片元着色器。一致变量，类似于常量，即不能被 Shader 修改，表示变换矩阵、光照参数、纹理采样器等。
  * varying 变量（易变变量）：从顶点着色器传递给片元着色器的数据变量。传递需要插值的颜色、法向量、纹理坐标等任意值。顶点及片元两段 Shader 中声明必须一致。
  * 内建变量（gl_Position：表示变换后的空间位置，原始的顶点数据在顶点着色器经过数学变换生成新的顶点位置）

### 片元着色器

* 处理片元值及其相关联数据的可编程单元，可执行纹理访问、颜色汇总、雾化等操作。
  
* 每片元执行一次。
  
* ![片元着色器处理](http://img.blog.csdn.net/20140628140210359?watermark/2/text/aHR0cDovL2Jsb2cuY3Nkbi5uZXQvZ3JhZng=/font/5a6L5L2T/fontsize/400/fill/I0JBQkFCMA==/dissolve/70/gravity/SouthEast)
  
  ​