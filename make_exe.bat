rem uru 187
rem pik use 187
start /wait mkexy spr_report.rb
type spr_report.exy.icon.txt >> spr_report.exy

@set upx_exe=C:\Program files_free\Free_UPX\upx.exe
@set /P ver="Input Release Version:"
@set time_tmp=%time: =0%
@set now=%date:/=%_%time_tmp:~0,2%%time_tmp:~3,2%%time_tmp:~6,2%
@set output_dir=bin\spr_report_v%ver%_%now%

mkdir "%output_dir%"
mkdir "%output_dir%\src"

@for %%i in (
  config_default.yaml
  env.yaml
  readme.txt
  spr_report_history.txt
  ëSåèïÒçêÉÇÅ[Éh.bat
  dependencies\*
) do @echo %%i & @copy %%i "%output_dir%"

@for %%i in (
  make_exe.bat
  spr_report.exy.icon.txt
  spr_report.ico
  spr_report.rb
) do @echo src\%%i & @copy %%i %output_dir%\src

@echo D | @xcopy /S lib "%output_dir%\src\lib"

start /wait cmd /c exerb spr_report.exy -o "%output_dir%\spr_report.exe"
"%upx_exe%" "%output_dir%\spr_report.exe"
