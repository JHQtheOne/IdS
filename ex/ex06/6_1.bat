@ECHO OFF
set /a r0 = 0
echo in:
set /p "r1="
set /a r2=r0+r1
set /a r3 = 1
:loop
if %r2% EQU 0 goto :end
set /a r3 = r2 * r3
set /a r2 = r2 - 1
echo "r2=%r2%, r3=%r3%"
pause
goto loop
:end
echo out: %r3%
echo %r3% >> out.txt