@echo off

:: กำหนด directory สำหรับโมเดล
SET home_path=%~dp0

:: Checkpoint Download
set checkpoint=%home_path%SD15_Model\Checkpoint
echo "Checkpoint Path = %checkpoint%"
if not exist "%checkpoint%" (mkdir "%checkpoint%")
::call :download_file https://civitai.com/api/download/models/220771 %checkpoint%\RyuzakiMixRealistic.safetensors
call :download_file https://civitai.com/api/download/models/119057 %checkpoint%\meinamix_meinaV11.safetensors
call :download_file https://civitai.com/api/download/models/151814 %checkpoint%\architecture_Interior_SDlife_Chiasedamme_V10.safetensors


:: Controlnet Download
set controlnet=%home_path%SD15_Model\Controlnet
if not exist %controlnet% (mkdir %controlnet%)
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth %controlnet%\control_v11e_sd15_ip2p.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth %controlnet%\control_v11e_sd15_shuffle.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth %controlnet%\control_v11f1e_sd15_tile.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth %controlnet%\control_v11f1p_sd15_depth.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth %controlnet%\control_v11p_sd15_canny.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth %controlnet%\control_v11p_sd15_inpaint.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth %controlnet%\control_v11p_sd15_lineart.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae.pth %controlnet%\control_v11p_sd15_normalbae.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth %controlnet%\control_v11p_sd15_openpose.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble.pth %controlnet%\control_v11p_sd15_scribble.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg.pth %controlnet%\control_v11p_sd15_seg.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth %controlnet%\control_v11p_sd15_softedge.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth %controlnet%\control_v11p_sd15s2_lineart_anime.pth
call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd.pth %controlnet%\control_v11p_sd15_mlsd.pth
call :download_file https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors %controlnet%\control_v1p_sd15_qrcode_monster.safetensors
call :download_file https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.yaml %controlnet%\control_v1p_sd15_qrcode_monster.yaml
call :download_file https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15.pth %controlnet%\ip-adapter_sd15.pth
call :download_file https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15_plus.pth %controlnet%\ip-adapter_sd15_plus.pth
call :download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors %controlnet%\ip-adapter-full-face_sd15.safetensors
call :download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors %controlnet%\ip-adapter-plus-face_sd15.safetensors

:download_file
set "url=%~1"
set "dest=%~2"
if not exist "%dest%" (
    echo "%dest%" กำลังดาวน์โหลด
    curl -# -Lo "%dest%" "%url%" --ssl-no-revoke
    if %ERRORLEVEL% NEQ 0 (
        echo การดาวน์โหลด %dest% ล้มเหลว จะลองใหม่อีกครั้ง...
    ) else (
        echo การดาวน์โหลด %dest% สำเร็จ
    )
) else (
    echo "Found %dest%"
)
exit /b