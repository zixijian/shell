#written by zixijian
#convert videos to HD gif 
#!/bin/sh
ffmpeg -v warning -i $1 -vf palettegen=max_colors=256 -y tmp.png

palette="tmp.png"

filters="fps=15,scale=480:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -b:v 1k -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
rm -f tmp.png
