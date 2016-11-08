@echo off
REM javaPath ����java binĿ¼���ڵľ���·�� 
REM classStoredPath ����xjc�������ɵ�������ŵ�·�� 
REM classModelPath ������ģ���ļ���ŵ�·�� 
REM relationModelPath�ǹ�ϵģ���ļ��ľ���·��
REM insNumDesPath��ʵ�������Ĺ����ļ�
REM attributeDescPath��ʵ�����ԵĹ����ļ�
REM forClassPath ��ͨ��xjc�������ɵ����ŵ�·���������Ǿ�����ʽ�����·�����Ա���jar������ʹ��
REM insOutputPath �ǵ���ʵ���ĵ���λ��
echo ����װ�������ļ�...
for /f "tokens=1,2 delims==" %%i in (·�������ļ�.ini) do (
  if "%%i"=="JAVA_PATH" set javaPath=%%j
  if "%%i"=="CLASS_STORED_PATH" set classStoredPath=%%j
  if "%%i"=="CLASS_MODEL_PATH" set classModelPath=%%j
  if "%%i"=="RELATION_MODEL_PATH" set relationModelPath=%%j
  if "%%i"=="INS_NUM_DESC_PATH" set insNumDesPath=%%j
  if "%%i"=="ATTRIBUTE_DESC_PATH" set attributeDescPath=%%j
  if "%%i"=="FOR_CLASS_PATH" set forClassPath=%%j 
  if "%%i"=="INS_OUTPUT_PATH" set insOutputPath=%%j 
 )
echo ��ȡ�����ļ��ɹ�
echo ����������ģ���ļ���Ӧ��JAVA��...
%javaPath%\xjc -d %classStoredPath% -p XSDToJava %classModelPath%
echo ���ɳɹ�
echo �������ļ�...
%javaPath%\javac %classStoredPath%\XSDToJava\*.java
echo ����ɹ�
echo ��������ʵ���ĵ�..
java -jar �Զ�����.jar %relationModelPath% %insNumDesPath% %attributeDescPath% %forClassPath% %insOutputPath%
pause