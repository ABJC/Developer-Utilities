#!/bin/bash 

DEBUG=false


movies=( 
    "jellyfish-3-mbps-hd-h264.mkv"
    "jellyfish-3-mbps-hd-hevc.mkv"
    "jellyfish-3-mbps-hd-hevc-10bit.mkv"
 )

shows=(
    "Series 01"
    "Series 02"
)

episodes=("Episode 01" "Episode 02" "Episode 03")

function download_movie() {
    NAME=$(echo $(echo $1 | cut -d'.' -f 1) | cut -d'/' -f 3)
    FILEPATH="$2/$NAME/$1"
    DLURL="https://jell.yfish.us/media/$(echo $1 | cut -d'/' -f 3)"


    if $DEBUG; then echo "DOWNLOADING $NAME TO $FILEPATH"; fi
    
    if [ -f "$FILEPATH" ]
    then
        if $DEBUG; then echo "> '$NAME' Already Exists, skipping"; fi
        
    else
        if $DEBUG; then echo "> '$NAME' Not Found, downloading"; fi
        mkdir -p "$2/$NAME"
        curl -s -o $FILEPATH $DLURL
    fi
    if $DEBUG; then echo "--> Completed"; else echo "$FILEPATH"; fi
    
}


function download_episodes() {
    for episode in "${episodes[@]}"
    do
        
        FILEPATH="$1/$episode.mkv"
        if [ -f "$FILEPATH" ]
        then
            if $DEBUG; then echo "> '$episode' Already Exists, skipping"; fi
        else
            if $DEBUG; then echo "> '$episode' Not Found, downloading"; fi
            mkdir -p "$1"
            curl -s -o "$FILEPATH" "https://jell.yfish.us/media/jellyfish-3-mbps-hd-h264.mkv"
        fi
    done
    if $DEBUG; then echo "--> Completed"; else echo "$FILEPATH"; fi
}



if [ "$1" == "create" ]; then
    for movie in "${movies[@]}"
    do
        download_movie "$movie" "media/movies"
    done

    for show in "${shows[@]}"
    do
        # Season 01
        download_episodes "media/series/$show/Season 01"
        
        # Season 02
        download_episodes "media/series/$show/Season 02"
    done
elif [ "$1" == "remove" ]; then
        echo "Removing"
        find media -type f -name "*.mkv" -delete;
else
    echo "Missing Command";
    echo "create - Download Files"
    echo "remove - Remove Files"
fi



