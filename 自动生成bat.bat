@echo off
REM javaPath 代表java bin目录所在的绝对路径 
REM classStoredPath 是用xjc工具生成的类所存放的路径 
REM classModelPath 代表类模型文件存放的路径 
REM relationModelPath是关系模型文件的绝对路径
REM insNumDesPath是实例数量的规则文件
REM attributeDescPath是实例属性的规则文件
REM forClassPath 是通过xjc工具生成的类存放的路径，但是是经过格式化后的路径，以便于jar包反射使用
REM insOutputPath 是导出实例文档的位置
echo 正在装在配置文件...
for /f "tokens=1,2 delims==" %%i in (路径配置文件.ini) do (
  if "%%i"=="JAVA_PATH" set javaPath=%%j
  if "%%i"=="CLASS_STORED_PATH" set classStoredPath=%%j
  if "%%i"=="CLASS_MODEL_PATH" set classModelPath=%%j
  if "%%i"=="RELATION_MODEL_PATH" set relationModelPath=%%j
  if "%%i"=="INS_NUM_DESC_PATH" set insNumDesPath=%%j
  if "%%i"=="ATTRIBUTE_DESC_PATH" set attributeDescPath=%%j
  if "%%i"=="FOR_CLASS_PATH" set forClassPath=%%j 
  if "%%i"=="INS_OUTPUT_PATH" set insOutputPath=%%j 
 )
echo 读取配置文件成功
echo 正在生成类模型文件对应的JAVA类...
%javaPath%\xjc -d %classStoredPath% -p XSDToJava %classModelPath%
echo 生成成功
echo 编译类文件...
%javaPath%\javac %classStoredPath%\XSDToJava\*.java
echo 编译成功
echo 正在生成实例文档..
java -jar 自动生成.jar %relationModelPath% %insNumDesPath% %attributeDescPath% %forClassPath% %insOutputPath%
pause