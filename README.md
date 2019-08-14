# openSCA
本项目基于SCA2.2.2标准进行开发，完全符合SCA2.2.2标准，已在多个项目中投入使用。<br>

## 编译环境
1. 宿主机操作系统：建议Ubuntu 16.04及以上版本  宿主机硬件版本：ARMv7_CortexA9；<br>
2. 交叉编译器现支持两类：jLinux、PetaLinux2015.4。<br>
获取编译器路径：https://github.com/JFounderSDR/jRootfs-and-Toolchains<br>
jLinux：arm-linux-gnueabihf-gcc、arm-linux-gnueabihf-g++<br>
版本：6.5.0 (Linaro GCC 6.5-2018.12)<br>
PetaLinux2015.4：arm-xilinx-linux-gnueabi-gcc、arm-xilinx-linux-gnueabi-g++<br>
版本：4.9.2 (Sourcery CodeBench Lite 2015.05-17)<br>
3. cmake，版本不低于3.5；<br>

## 编译设置
本项目使用CMake工具进行编译，需要先配置交叉编译器的环境变量。<br>

### jLinux:<br>
1. 安装Linaro_SDK<br>
2. 新建gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/settings64.sh脚本，添加如下内容：<br>

> export PATH=$PATH:/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/bin/<br>
export CPLUS_INCLUDE_PATH=/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/include/<br>
export C_INCLUDE_PATH=/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/include/<br>
export CPLUS_INCLUDE_PATH=$CPLUS_INCLUDE_PATH:/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/include/<br>
export LD_LIBRARY_PATH=/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/lib:$LD_LIBRARY_PATH<br>
export LIBRARY_PATH=$LIBRARY_PATH:/home/jf-yt/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/lib<br>
export CXX=arm-linux-gnueabihf-g++<br>
export CC=arm-linux-gnueabihf-gcc<br>

/home/jf-yt为具体安装路径，请根据实际情况更改。<br>

3. 编译前请先执行如下命令：

```
source ~/gcc-linaro-6.5.0-2018.12-i686_arm-linux-gnueabihf/settings64.sh
```

配置目录下的configure.cmake文件，配置选项如下：<br>

![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/jLinux_compile_config.png)<br>

4. 设置openSCA/cmake/common/compiler_setting.cmake文件<br>
> SET(CMAKE_C_COMPILER   "${COMPILER_DIR}/bin/arm-linux-gnueabihf-gcc")<br>
SET(CMAKE_CXX_COMPILER "${COMPILER_DIR}/bin/arm-linux-gnueabihf-g++")<br>
SET(CMAKE_AR "${COMPILER_DIR}/bin/arm-linux-gnueabihf-ar")<br>
SET(CMAKE_FIND_ROOT_PATH <br>
	"${COMPILER_DIR}/lib")<br>

如图：<br>
	
![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/jLinux_compiler_setting.png)<br>	

### PetaLinux2015.4:<br>
1. 安装Xilinx_SDK<br>
2. 在Xilinx-2015.4/SDK/2015.4/settings64.sh脚本中，添加如下内容：<br>

> export CC=arm-xilinx-linux-gnueabi-gcc<br>
export CXX=arm-xilinx-linux-gnueabi-g++

3. 编译前请先执行如下命令：

```
source ~/Xilinx-2015.4/SDK/2015.4/settings64.sh
```

配置目录下的configure.cmake文件，配置选项如下：<br>

![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/PetaLinux_compile_config.png)<br>

4. 设置openSCA/cmake/common/compiler_setting.cmake文件<br>
> SET(CMAKE_C_COMPILER   "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-gcc")<br>
SET(CMAKE_CXX_COMPILER "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-g++")<br>
SET(CMAKE_AR "${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/bin/arm-xilinx-linux-gnueabi-ar")<br>
SET(CMAKE_FIND_ROOT_PATH <br>
	"${COMPILER_DIR}/SDK/2015.4/lib" <br>
	"${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/lib" <br>
	"${COMPILER_DIR}/SDK/2015.4/gnu/arm/lin/arm-xilinx-linux-gnueabi/libc")<br>
	
如图：

![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/PetaLinux_compiler_setting.png)<br>	

## 编译步骤
1. 编译本项目，首先从GitHub拉取sdrLibrary仓库，新建openSCA/libs目录，然后将sdrLibrary中ace_tao、boost、<br>
runtime_env、tiny1xml四个文件夹直接拷贝到openSCA/libs目录下。<br>
sdrLibrary仓库地址为：(https://github.com/JFounderSDR/sdrLibrary.git)<br>
2. 拉取examples仓库，将拉取到的examples文件夹直接拷贝到OpenSCA目录下，<br>
examples仓库地址为：(https://github.com/JFounderSDR/examples.git)<br>
3. 拉取testsuite仓库，将拉取到的testsuite文件夹直接拷贝到OpenSCA目录下，<br>
testsuite仓库地址为：(https://github.com/JFounderSDR/testsuite.git)<br>
4. 新建openSCA/build目录，在此目录下执行"cmake ../"命令<br>
5. 步骤3执行成功后，继续执行"make"命令，生成目标文件<br>

## 运行环境
jLab实验平台 1.0<br>
![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/jLab%E5%AE%9E%E9%AA%8C%E5%B9%B3%E5%8F%B0.png)<br>

## 依赖的开源项目
1、ACE+TAO-2.0a<br>
2、boost 1.69.0<br>
3、tinyxml<br>

## 补充说明
项目还提供如下内容：<br>
1. 可直接运行的demo，仓库地址：(https://github.com/JFounderSDR/demos)<br>
2. 说明文档，仓库地址：(https://github.com/JFounderSDR/documents)<br>
3. 第三方库源码：仓库地址：(https://github.com/JFounderSDR/thirdparty)<br>
4. 组件和逻辑设备开发实例代码，仓库地址：(https://github.com/JFounderSDR/examples)
5. 测试实例代码，仓库地址：(https://github.com/JFounderSDR/testsuite)
6. openSCA-SDK，仓库地址：(https://github.com/JFounderSDR/sdrSDK)

## 项目描述
&emsp;&emsp;本项目为开源版本，供开发者学习、研究之用，实现了部分基础接口，如加载波形、卸载波形、<br>
设置与查询属性、启动与停止波形，且未对性能进行优化，如加载波形时采用的是串行加载波形组件的方式，耗时较长。<br>

&emsp;&emsp;介方商业版openSCA在实现完整SCA接口的基础上又做了增强型设计，且对性能进行了优化。

### 开源版与商业版的区别
|        | 开源版 | 商业版 |
| ------ | ----- | ------ |
| SCA接口实现情况 | 基础接口 | 所有接口 |
| ace_tao库是否优化 | 未优化 | 优化 |
| 波形加载方式 | 串行加载 | 并行加载 |
| 心跳服务 | 不支持 | 支持 |
| 聚合服务 | 不支持 | 支持 |
| 分布式加载 | 不支持 | 支持 |
| 跨节点连接 | 不支持 | 支持 |
| 事件服务 | 不支持 | 支持 |

如对商业版openSCA感兴趣，可发邮件至sdr@onetek.net进行咨询。

## 工具支持
介方同时提供SDR集成开发环境和平台监控软件jLab_Monitor。<br>

&emsp;&emsp;SDR集成开发环境为用户提供模型驱动支撑，支持波形建模、节点建模、模型库管理、波形算法开发等功能，<br>
用户可通过此工具生成平台包并一键导入至jLab实验平台运行。<br>

![load picture failed](https://github.com/JFounderSDR/openSCA/blob/master/IDE.png)<br>

&emsp;&emsp;jLab_Monitor为平台监控软件，提供波形的加载、卸载、属性配置与查询、启动与停止波形等功能。<br>

![load_picture_failed](https://github.com/JFounderSDR/openSCA/blob/master/jMonitor.png)

如对上述工具感兴趣，可发邮件至sdr@onetek.net进行咨询。
