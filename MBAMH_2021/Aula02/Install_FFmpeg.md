# Vide a bula ffmpeg Paulo Santiago

# Install FFMPEG
setx /m PATH "C:\FFmpeg\bin;%PATH%"

# Compatibilidades
# https://trac.ffmpeg.org/wiki/Capture/Webcam

# Gravar com o ffmpeg
ffmpeg -i /dev/video1 -framerate 60 -video_size 1280x720 out.mp4
ffmpeg -f video4linux2 -i /dev/video1 -framerate 60.0 -video_size 1280x720 out.mp4

# info da media
ffprobe video.mp4
ffprobe -select_streams v -show_streams video.avi

# Converter um video para avi raw
ffmpeg -i video.mp4 -vcodec rawvideo -pix_fmt bgr24 videoraw.avi

# Fazer video "sem perder" qualidade de imagens png
ffmpeg -r:v 30 -i imagens%03d.png -codec:v libx264 -pix_fmt yuv420p -an video$.mp4 -y

# pegar numero de frames
ffprobe -select_streams v -show_streams video.mp4 | grep nb_frames

# gerar imagens de um video
ffmpeg -i video.avi video_png/%09d.png

# pegar um trecho especifico do video e gerar imagens
ffmpeg -i video.mp4 -vf select='between(n\,x\,y)' -vsync 0 video_png/videoframe_%09d.png

# fazer o video das imagens
ffmpeg -start_number 001 -i frames%3d.png video.avi

# cortar pedacos
# https://video.stackexchange.com/questions/4563/how-can-i-crop-a-video-with-ffmpeg
ffmpeg -i frame163.png -filter:v "crop=177:63:257:124" -c:a copy frame163_corte.png
