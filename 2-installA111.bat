@echo off
:: PIP
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo
echo "<<< 1-click install Stable Diffusion By SalmonRK >>>"
echo "<<< If you have problem with code  >>>"
echo "<<< Contact me SalmonRK https://www.facebook.com/salmonrkch >>>"
echo
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------

python -m ensurepip
SET home_path=%~dp0
set version=v1.9.3
echo "<<< Install Stable Diffusion %version% and Extensions >>>"

:: Install A1111
git clone -b %version% https://github.com/AUTOMATIC1111/stable-diffusion-webui
cd .\stable-diffusion-webui
git stash
git pull
git checkout %version%

:: Install extensions
set extensions=^
    "https://github.com/DominikDoom/a1111-sd-webui-tagcomplete" ^
    "https://github.com/continue-revolution/sd-webui-segment-anything" ^
    "https://github.com/Uminosachi/sd-webui-inpaint-anything" ^
    "https://github.com/Coyote-A/ultimate-upscale-for-automatic1111" ^
    "https://github.com/thomasasfk/sd-webui-aspect-ratio-helper" ^
    "https://github.com/huchenlei/sd-webui-openpose-editor" ^
    "https://github.com/Gourieff/sd-webui-reactor" ^
    "https://github.com/picobyte/stable-diffusion-webui-wd14-tagger" ^
    "https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg" ^
    "https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper" ^
    "https://github.com/Bing-su/adetailer" ^
    "https://github.com/adieyal/sd-dynamic-prompts" ^
    "https://github.com/mattjaybe/sd-wildcards" ^
    "https://github.com/Mikubill/sd-webui-controlnet" ^
    "https://github.com/hako-mikan/sd-webui-lora-block-weight" ^
    "https://github.com/zanllp/sd-webui-infinite-image-browsing"

cd .\extensions
for %%e in (%extensions%) do (
    git clone %%e
    if %ERRORLEVEL% NEQ 0 (
        echo การติดตั้ง %%e ล้มเหลว จะลองใหม่อีกครั้ง...
    ) else (
        echo การติดตั้ง %%e สำเร็จ
    )
)
cd ..

:: Download models
echo ----------------------------------------------------------------------------------------------------
echo "<<< SD Checkpoint, Lora and Controlnet Download >>>"

:: Download Checkpoint
set checkpoint=%home_path%SD15_Model\Checkpoint
echo "Checkpoint Path = %checkpoint%"
if not exist "%checkpoint%" (mkdir "%checkpoint%")
call :download_file https://civitai.com/api/download/models/220771 %checkpoint%\RyuzakiMixRealistic.safetensors
::call :download_file https://civitai.com/api/download/models/119057 %checkpoint%\meinamix_meinaV11.safetensors
::call :download_file https://civitai.com/api/download/models/151814 %checkpoint%\architecture_Interior_SDlife_Chiasedamme_V10.safetensors

:: Download Lora
set lora=%home_path%SD15_Model\Lora
echo "Lora Path = %lora%"
if not exist %lora% (mkdir %lora%)
call :download_file https://civitai.com/api/download/models/62833 %lora%\add_detail.safetensors
call :download_file https://civitai.com/api/download/models/16576 %lora%\epi_noiseoffset2.safetensors

:: Download Controlnet
::set controlnet=%home_path%SD15_Model\Controlnet
::echo "Controlnet Path = %controlnet%"
::if not exist %controlnet% (mkdir %controlnet%)
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth %controlnet%\control_v11e_sd15_ip2p.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth %controlnet%\control_v11e_sd15_shuffle.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth %controlnet%\control_v11f1e_sd15_tile.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth %controlnet%\control_v11f1p_sd15_depth.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth %controlnet%\control_v11p_sd15_canny.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth %controlnet%\control_v11p_sd15_inpaint.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth %controlnet%\control_v11p_sd15_lineart.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae.pth %controlnet%\control_v11p_sd15_normalbae.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth %controlnet%\control_v11p_sd15_openpose.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble.pth %controlnet%\control_v11p_sd15_scribble.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg.pth %controlnet%\control_v11p_sd15_seg.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth %controlnet%\control_v11p_sd15_softedge.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth %controlnet%\control_v11p_sd15s2_lineart_anime.pth
::call :download_file https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd.pth %controlnet%\control_v11p_sd15_mlsd.pth
::call :download_file https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors %controlnet%\control_v1p_sd15_qrcode_monster.safetensors
::call :download_file https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.yaml %controlnet%\control_v1p_sd15_qrcode_monster.yaml
::call :download_file https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15.pth %controlnet%\ip-adapter_sd15.pth
::call :download_file https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15_plus.pth %controlnet%\ip-adapter_sd15_plus.pth
::call :download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors %controlnet%\ip-adapter-full-face_sd15.safetensors
::call :download_file https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors %controlnet%\ip-adapter-plus-face_sd15.safetensors

echo ----------------------------------------------------------------------------------------------------
:: Download VAE, Upscaler
echo "<<< VAE, Upscaler Download >>>"
rmdir /Q /S %home_path%stable-diffusion-webui\models\ESRGAN
rmdir /Q /S %home_path%stable-diffusion-webui\embeddings
rmdir /Q /S %home_path%stable-diffusion-webui\models\VAE
git clone https://huggingface.co/datasets/salmonrk/ESRGAN %home_path%stable-diffusion-webui\models\ESRGAN
git clone https://huggingface.co/datasets/salmonrk/embeddings %home_path%stable-diffusion-webui\embeddings
git clone https://huggingface.co/datasets/salmonrk/VAE %home_path%stable-diffusion-webui\models\VAE
echo ----------------------------------------------------------------------------------------------------
:: Running SD-WebUI
echo "<<< Double-click webui-user.bat to launch SD-WebUI >>>"
cd %home_path%stable-diffusion-webui
del webui-user.bat 
curl -Lo webui-user.bat https://huggingface.co/datasets/salmonrk/webui-user/resolve/main/webui-user.bat?download=true --ssl-no-revoke
if exist webui-user.bat (
powershell -Command "[System.Media.SoundPlayer]::new('C:\Windows\Media\tada.wav').playsync()"
powershell -Command "& {Add-Type -AssemblyName PresentationFramework; [System.Windows.MessageBox]::Show('Stable Diffusion Complate Installed', 'Complated') }"
)
::call webui-user.bat

:: Function to download files
:download_file
set url=%1
set dest=%2
if not exist "%dest%" (
    curl -Lo "%dest%" "%url%" --ssl-no-revoke
    if %ERRORLEVEL% NEQ 0 (
        echo การดาวน์โหลด %dest% ล้มเหลว จะลองใหม่อีกครั้ง...
    ) else (
        echo การดาวน์โหลด %dest% สำเร็จ
    )
) else (
    echo "Found %dest%"
)
exit /b
pause
exit /b