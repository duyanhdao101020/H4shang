@echo off
chcp 65001 >nul
cd /d "%~dp0"
if not exist audio mkdir audio
echo === Cai dat / cap nhat edge-tts ===
python -m pip install -U edge-tts
echo.
for %%f in (text\*.txt) do (
  echo Dang tao %%~nf.mp3 ...
  python -m edge_tts --file "%%f" --voice zh-CN-XiaoxiaoNeural --rate=-10%% --write-media "audio\%%~nf.mp3"
)
echo.
echo === XONG. Kiem tra thu muc audio ===
dir /b audio\*.mp3
pause
