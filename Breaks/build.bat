rmdir BuildLib /s /q
rmdir BuildApp /s /q
md BuildLib


cl -c /experimental:module /DUSE_MODULES /FoBuildLib\a.obj /Iinterface Lib\a.cxx /module:export
if %errorlevel% neq 0 exit /b %errorlevel%
move ModA.ifc BuildLib\ModA.ifc
if %errorlevel% neq 0 exit /b %errorlevel%

cl -c /experimental:module /DUSE_MODULES /FoBuildLib\b.obj /Iinterface Lib\b.cxx /module:export /module:reference BuildLib\*.ifc
if %errorlevel% neq 0 exit /b %errorlevel%
move ModB.ifc BuildLib\ModB.ifc
if %errorlevel% neq 0 exit /b %errorlevel%

md BuildApp

cl -c /experimental:module /DUSE_MODULES /FoBuildApp\c.obj /Iinterface App\c.cxx /module:export /module:reference BuildLib\ModB.ifc /module:reference BuildLib\ModA.ifc
if %errorlevel% neq 0 exit /b %errorlevel%
move ModC.ifc BuildApp\ModC.ifc
if %errorlevel% neq 0 exit /b %errorlevel%

echo Success.                                                        :)
