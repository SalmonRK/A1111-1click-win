@echo off
::PIP
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo
echo "<<< 1-click install Stable Diffusion By SalmonRK >>>"
echo "<<< If you has problem with code  >>>"
echo "<<< Contact me SalmonRK https://www.facebook.com/salmonrkch >>>"
echo
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------
echo ----------------------------------------------------------------------------------------------------

python -m ensurepip
SET home_path=%~dp0
set version=v1.7.0
echo "<<< Install Stable Diffusion %version% and Extension >>>"
::Install A1111

git clone -b %version% https://github.com/AUTOMATIC1111/stable-diffusion-webui
git stash
git pull
git checkout %version%
cd .\stable-diffusion-webui\extensions
git clone https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
git clone https://github.com/continue-revolution/sd-webui-segment-anything
git clone https://github.com/Uminosachi/sd-webui-inpaint-anything
git clone https://github.com/Coyote-A/ultimate-upscale-for-automatic1111
git clone https://github.com/thomasasfk/sd-webui-aspect-ratio-helper
git clone https://github.com/huchenlei/sd-webui-openpose-editor
git clone https://github.com/Gourieff/sd-webui-reactor
git clone https://github.com/picobyte/stable-diffusion-webui-wd14-tagger
git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg
git clone https://github.com/zixaphir/Stable-Diffusion-Webui-Civitai-Helper
git clone https://github.com/Bing-su/adetailer
git clone https://github.com/adieyal/sd-dynamic-prompts
git clone https://github.com/mattjaybe/sd-wildcards
mkdir .\sd-dynamic-prompts\wildcards
copy sd-wildcards\wildcards\* .\sd-dynamic-prompts\wildcards\*
git clone https://github.com/Mikubill/sd-webui-controlnet
git clone https://github.com/hako-mikan/sd-webui-lora-block-weight
git clone https://github.com/zanllp/sd-webui-infinite-image-browsing

REM Back to A111 home
cd %home_path%
echo ----------------------------------------------------------------------------------------------------
echo "<<< SD Checkpoint, Lora and Copntrolnet Download >>>"
::Download Checkpoint
set checkpoint=SD15_Model\Checkpoint
if not exist %Checkpoint% (
MKDIR %Checkpoint%
REM RyuzakiMixRealistic
curl -Lo %Checkpoint%\RyuzakiMixRealistic.safetensors https://civitai.com/api/download/models/220771 --ssl-no-revoke
REM meinamix_meinaV11
curl -Lo %Checkpoint%\meinamix_meinaV11.safetensors https://civitai.com/api/download/models/119057 --ssl-no-revoke
REM architecture_Interior_SDlife_Chiasedamme_V10.0
curl -Lo %Checkpoint%\architecture_Interior_SDlife_Chiasedamme_V10.safetensors https://civitai.com/api/download/models/151814 --ssl-no-revoke
echo "Checkpoint Download"
) else echo "Found Checkpoint"

::Download Lora
set Lora=SD15_Model\Lora
if not exist %Lora% (
MKDIR %Lora%
:: Add detailer
curl -Lo %Lora%\add_detail.safetensors https://civitai.com/api/download/models/62833 --ssl-no-revoke
:: epi_noiseoffset2
curl -Lo %Lora%\epi_noiseoffset2.safetensors https://civitai.com/api/download/models/16576 --ssl-no-revoke
echo "Lora Download"
) else echo "Found Lora"

::Download Controlnet
set Controlnet=SD15_Model\Controlnet
if not exist %Controlnet% (
MKDIR %Controlnet%
curl -Lo %Controlnet%\control_v11e_sd15_ip2p.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_ip2p.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11e_sd15_shuffle.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11e_sd15_shuffle.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11f1e_sd15_tile.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1e_sd15_tile.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11f1p_sd15_depth.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11f1p_sd15_depth.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_canny.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_canny.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_inpaint.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_inpaint.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_lineart.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_lineart.pth --ssl-no-revoke --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_normalbae.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_normalbae.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_openpose.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_openpose.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_scribble.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_scribble.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_seg.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_seg.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_softedge.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_softedge.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15s2_lineart_anime.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15s2_lineart_anime.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v11p_sd15_mlsd.pth https://huggingface.co/lllyasviel/ControlNet-v1-1/resolve/main/control_v11p_sd15_mlsd.pth --ssl-no-revoke
curl -Lo %Controlnet%\control_v1p_sd15_qrcode_monster.safetensors https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.safetensors --ssl-no-revoke
curl -Lo %Controlnet%\control_v1p_sd15_qrcode_monster.yaml https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/resolve/main/control_v1p_sd15_qrcode_monster.yaml --ssl-no-revoke
curl -Lo %Controlnet%\ip-adapter_sd15.pth https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15.pth --ssl-no-revoke
curl -Lo %Controlnet%\ip-adapter_sd15_plus.pth https://huggingface.co/lllyasviel/sd_control_collection/resolve/main/ip-adapter_sd15_plus.pth --ssl-no-revoke
curl -Lo %Controlnet%\ip-adapter-full-face_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-full-face_sd15.safetensors --ssl-no-revoke
curl -Lo %Controlnet%\ip-adapter-plus-face_sd15.safetensors https://huggingface.co/h94/IP-Adapter/resolve/main/models/ip-adapter-plus-face_sd15.safetensors --ssl-no-revoke
echo "Controlnet Download"
) else echo "Found Controlnet"
echo ----------------------------------------------------------------------------------------------------
::Download VAE, Upscaler
echo "<<< VAE, Upscaler Download >>>"
rmdir /Q /S %home_path%stable-diffusion-webui\models\ESRGAN
rmdir /Q /S %home_path%stable-diffusion-webui\embeddings
rmdir /Q /S %home_path%stable-diffusion-webui\models\VAE
git clone https://huggingface.co/datasets/salmonrk/ESRGAN %home_path%stable-diffusion-webui\models\ESRGAN
git clone https://huggingface.co/datasets/salmonrk/embeddings %home_path%stable-diffusion-webui\embeddings
git clone https://huggingface.co/datasets/salmonrk/VAE %home_path%stable-diffusion-webui\models\VAE
echo ----------------------------------------------------------------------------------------------------
::Running SD-WebUI
echo "<<< Double-click webui-user.bat to luanch SD-WebUI >>>"
cd %home_path%stable-diffusion-webui
del webui-user.bat
curl -Lo webui-user.bat https://huggingface.co/datasets/salmonrk/webui-user/resolve/main/webui-user.bat?download=true --ssl-no-revoke
call webui-user.bat
pause