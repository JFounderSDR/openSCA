# testsuite
包含两个测试程序：base_test_main和test_appCommunication_main。<br>
base_test_main测试基本接口；<br>
test_appCommunication_main测试通信接口。<br>
它们都依赖于libtest_utils.so和libtest_baseInterface.so动态库。<br>

## 基本接口测试说明
base_test_main用于测试SCA2.2.2基础接口，包含如下功能的测试：<br>

1. 获取DomainManager、DeviceManager
2. 获取所有设备、所有应用
3. 安装MsgTransApp波形
4. 卸载MsgTransApp波形
5. 启动MsgTransApp波形
6. 停止MsgTransApp波形
7. 查询MsgTransApp波形的id和name
8. 查询MsgTransApp波形所有属性的id和value 
9. 配置MsgTransApp波形的start_status属性
10. 查询MsgTransApp波形的start_status属性值，检查属性值是否为新值
11. 查询平台所包含设备的id和name
12. 配置U1_Zynq7035设备的is_board属性
13. 查询U1_Zynq7035设备的is_board属性值，检查属性值是否为新值

## 通信接口测试说明
test_appCommunication_main用于测试通信接口，执行步骤如下：<br>

1. 安装MsgTransApp波形
2. 测试程序中已定义一个发送端口(CWave_Use_port_i)和接收端口(CWave_Provide_port_i)，<br>
分别与波形的接收端口和发送端口相连
3. 创建一个接收线程，用于接收应用发来的数据
4. 测试程序主线程中给波形发送数据"[*****Hello JFounder!*****]"，在子线程中接收从波形发来的数据

这两个测试程序可单独运行，无先后顺序关系。

## 编译方式
两种编译方式：cmake编译，编译命令编译。

1. 使用CMake工具进行编译，openSCA项目默认一起编译testsuite。
配置openSCA项目目录下的configure.cmake文件，配置选项如下：<br>

2. 使用编译命令进行编译，需要先编译两个动态库。

在openSCA/testsuite/test_utils目录下使用如下命令，编译生成libtest_utils.so动态库：

arm-xilinx-linux-gnueabi-g++ -shared -fPIC -o libtest_utils.so ./src/test_utils.cpp -I../../include/ACE_wrappers/ -I../../include/ACE_wrappers/TAO/ -I../../include/ACE_wrappers/TAO/orbsvcs/

将生成的libtest_utils.so放到openSCA/libs/testsuite目录下。

在openSCA/testsuite/test_baseInterface目录下使用如下命令，编译生成libtest_baseInterface.so动态库：

arm-xilinx-linux-gnueabi-g++ -shared -fPIC -std=c++0x -o libtest_baseInterface.so ./src/test_baseInterface.cpp ./src/test_communicationPorts.cpp -I../../include/ACE_wrappers/ -I../../include/ACE_wrappers/TAO/ -I../../include/ACE_wrappers/TAO/orbsvcs/ -I../../include/CF/ -I../../include/ -I../test_utils/include/ -I../test_baseInterface/include/ -L../../libs/testsuite/ -L../../libs/frameworks/

将生成的libtest_baseInterface.so放到openSCA/libs/testsuite目录下。

在openSCA/testsuite/test_interface_main目录下使用如下命令，编译生成test_interface_main.out：

arm-xilinx-linux-gnueabi-g++ -o base_test_main.out ./src/test_interface.cpp -I../../include/runtime_env/ -I../../include/ACE_wrappers/ -I../../include/ACE_wrappers/TAO/ -I../../include/ACE_wrappers/TAO/orbsvcs/ -I../../include/CF/ -I../../include/ -I../test_utils/include/ -I../test_baseInterface/include/ -L ../../libs/ace_tao/ -L../../libs/runtime_env/ -L../../libs/testsuite/ -L../../libs/tiny1xml/ -L../../libs/frameworks/ -lTAO_PI -lACE -lTAO -lTAO_AnyTypeCode -lKokyu -lTAO_CodecFactory -lTAO_Codeset -lTAO_CosEvent -lTAO_CosEvent_Skel -lTAO_CosEvent_Serv -lTAO_CosNaming_Serv -lTAO_CosNaming -lTAO_CosNaming_Skel -lTAO_DynamicInterface -lTAO_IFR_Client -lTAO_ImR_Client -lTAO_IORTable -lTAO_Svc_Utils -lTAO_Messaging -lTAO_Valuetype -lTAO_PortableServer -lorb_abstraction -lrte_utils -lCF_Interface -ltest_baseInterface -ltest_utils -lCF_Utils -lCF_StdPorts -lApplication -lApplicationFactory -lFile -lFileSystem -lFileManager -lXMLParser -ltiny1xml

在openSCA/testsuite/test_applicationCommunication_main目录下使用如下命令，编译生成<br>
test_applicationCommunication_main.out:

arm-xilinx-linux-gnueabi-g++ -o test_applicationCommunication_main.out ./src/test_appCommunication.cpp ../test_baseInterface/src/test_communicationPorts.cpp -I ../../include/runtime_env/ -I ../../include/ACE_wrappers/ -I ../../include/ACE_wrappers/TAO/ -I ../../include/ACE_wrappers/TAO/orbsvcs/ -I ../../include/CF/ -I ../../include/ -I ../test_utils/include/ -I ../test_baseInterface/include/ -L ../../libs/ace_tao/ -L ../../libs/runtime_env/ -L ../../libs/testsuite/ -L ../../libs/tiny1xml/ -L ../../libs/frameworks/ -lTAO_PI -lACE -lTAO -lTAO_AnyTypeCode -lKokyu -lTAO_CodecFactory -lTAO_Codeset -lTAO_CosEvent -lTAO_CosEvent_Skel -lTAO_CosEvent_Serv -lTAO_CosNaming_Serv -lTAO_CosNaming -lTAO_CosNaming_Skel -lTAO_DynamicInterface -lTAO_IFR_Client -lTAO_ImR_Client -lTAO_IORTable -lTAO_Svc_Utils -lTAO_Messaging -lTAO_Valuetype -lTAO_PortableServer -lorb_abstraction -lrte_utils -lCF_Interface -ltest_baseInterface -ltest_utils -lCF_Utils -lCF_StdPorts -lApplication -lApplicationFactory -lFile -lFileSystem -lFileManager -lXMLParser -ltiny1xml -lpthread
