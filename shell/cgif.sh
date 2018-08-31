#written by zixijian
#convert videos to HD gif
#example: bash cgif.sh 1.mp4 2.gif
#!/bin/sh
palette="tmp.png"

filters="fps=15,scale=280:-1:flags=lanczos"

ffmpeg -v warning -i $1 -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -i $1 -i $palette -b:v 1k -lavfi "$filters [x]; [x][1:v] paletteuse" -y $2
rm -f tmp.png
