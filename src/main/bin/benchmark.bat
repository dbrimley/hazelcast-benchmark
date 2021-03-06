@ECHO OFF
title Benchmark:hazelcast
SETLOCAL EnableDelayedExpansion

cd %~dp0\..
set HOME=%CD%

set CLASS_PATH="config;"
for %%F in ("lib/"*.jar) do set CLASS_PATH=!CLASS_PATH!;"lib/%%~nxF"

SET MEM_OPTS=-Xms8Gb -Xmx8Gb -XX:+HeapDumpOnOutOfMemoryError
SET GC_OPTS=-XX:+UseG1GC -XX:+PrintGCDetails -XX:+PrintGCDateStamps -XX:+PrintGCTimeStamps -Xloggc:logs/benchmark-gc.log

SET JAVA_OPTS=-server -showversion %MEM_OPT% %GC_OPTS%
@ECHO ON

java %JAVA_OPTS% -cp "%CLASS_PATH%" com.moex.eif.benchmark.Main
PAUSE
