#!/bin/bash

BASEDIR=$(dirname $0)
RADIO_ADDR="rtmp://ebsandroid.ebs.co.kr:1935/fmradiofamilypc/familypc1m"
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
FLV2MP3_BIN=avconv
ID3TAG_BIN=/usr/local/bin/eyeD3  # eyeD3 0.7.5

PROGRAM_NAME=$1
RECORD_MINS=$2
RECORD_SECS=$(($2*60))
DEST_DIR=$3

DAY=$(LC_ALL=C /bin/date +%d)
YEAR=$(LC_ALL=C /bin/date +%Y)
MONTH=$(LC_ALL=C /bin/date +%m)
DATE=$(LC_ALL=C /bin/date +%Y-%m-%d-%a)
ISODATE=$(LC_ALL=C /bin/date +%Y-%m-%d)

TEMP_FLV=`mktemp -u`$PROGRAM_NAME.flv

ID3_TITLE="$PROGRAM_NAME $DATE"
ID3_ARTIST=$RADIO_NAME
ID3_ALBUM=$PROGRAM_NAME
ID3_YEAR=$YEAR
ID3_TRACK=$DAY
ID3_DISC=$MONTH
ID3_GENRE="Podcast"
ID3_ALBUMART="$ALBUMARTDIR/$PROGRAM_NAME.jpg"

MP3_FILE_NAME=$DATE"-"$PROGRAM_NAME.mp3

sleep $TIME_OFFSET
$RTMPDUMP_BIN -q -r $RADIO_ADDR -B $RECORD_SECS -o $TEMP_FLV
sleep 1
$FLV2MP3_BIN -i $TEMP_FLV -ar 44100 $MP3_FILE_NAME
sleep 1
$ID3TAG_BIN                      \
    -t "$ID3_TITLE"              \
    -a "$ID3_ARTIST"             \
    -A "$ID3_ALBUM"              \
    --release-date      $ISODATE \
    --orig-release-date $ISODATE \
    --recording-date    $ISODATE \
    -n $ID3_TRACK  -N 31         \
    -d $ID3_DISC   -D 12         \
    -G "$ID3_GENRE"              \
    $MP3_FILE_NAME

if [ -e "$ID3_ALBUMART" ] ; then
  $ID3TAG_BIN --to-v2.4 \
  --add-image="$ID3_ALBUMART":FRONT_COVER \
  $MP3_FILE_NAME
fi

rm $TEMP_FLV

mkdir -p $DEST_DIR
mv $MP3_FILE_NAME $DEST_DIR

