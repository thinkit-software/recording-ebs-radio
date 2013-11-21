#!/bin/bash

BASEDIR=$(dirname $0)
RADIO_ADDR="rtmp://ebsandroid.nefficient.com/fmradiofamilypc/familypc1m"
RADIO_NAME="EBS"
TIME_OFFSET="5s"
ALBUMARTDIR=$BASEDIR/artwork

if [ $# -lt 3 ] 
  then
  echo $0": insufficient arguement!"
  echo "usage: $0 [program_name] [recording_time(min)] [target_dir]"
  exit 1
fi

RTMPDUMP_BIN=rtmpdump
FFMPEG_BIN=ffmpeg
EYED3_BIN=eyeD3

DEPENDENT_PROGRAMS="$RTMPDUMP_BIN $FFMPEG_BIN $EYED3_BIN"

for PROG in $DEPENDENT_PROGRAMS
do
  if [ "`which $PROG`" == "" ] ; then
    echo "ERROR: $PROG is required to run this script."
    exit 1
  fi
done

PROGRAM_NAME=$1
RECORD_MINS=$2
RECORD_SECS=$(($2*60))
DEST_DIR=$3

DAY=$(LC_ALL=C /bin/date +%d)
YEAR=$(LC_ALL=C /bin/date +%Y)
MONTH=$(LC_ALL=C /bin/date +%b)
DATE=$(LC_ALL=C /bin/date +%Y-%m-%d-%a)

TEMP_FLV=`mktemp -u`$PROGRAM_NAME.flv

ID3_TITLE="$PROGRAM_NAME $DATE"
ID3_ARTIST=$RADIO_NAME
ID3_ALBUM=$PROGRAM_NAME" "$MONTH
ID3_YEAR=$YEAR
ID3_TRACK=$DAY
ID3_GENRE="Podcast"
ID3_ALBUMART="$ALBUMARTDIR/$PROGRAM_NAME.jpg"

MP3_FILE_NAME=$DATE"-"$PROGRAM_NAME.mp3

sleep $TIME_OFFSET
$RTMPDUMP_BIN -q -r $RADIO_ADDR -B $RECORD_SECS -o $TEMP_FLV
sleep 1
$FFMPEG_BIN -i $TEMP_FLV -ar 44100 $MP3_FILE_NAME
sleep 1
$EYED3_BIN --to-v2.4    \
    --set-encoding=utf8     \
    -t "$ID3_TITLE"         \
    -a "$ID3_ARTIST"        \
    -A "$ID3_ALBUM"         \
    -Y "$ID3_YEAR"          \
    -n "$ID3_TRACK"         \
    -G "$ID3_GENRE"         \
    $MP3_FILE_NAME

if [ -e "$ID3_ALBUMART" ] ; then
  $EYED3_BIN --to-v2.4 \
  --add-image="$ID3_ALBUMART":FRONT_COVER \
  $MP3_FILE_NAME
fi

rm $TEMP_FLV

mkdir -p $DEST_DIR
mv $MP3_FILE_NAME $DEST_DIR

