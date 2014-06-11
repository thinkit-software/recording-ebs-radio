# Recording EBS Radio 
RTMP streaming radio to MP3 file 

## Usage:
```shell
./rec_ebs_radio.sh [program_name] [recording_time(min)] [target_dir]
```

## Installation

Tested only on Ubuntu Linux in 2013. Required packages are rtmpdump, ffmpeg, eyeD3. The following command might work well. :)
```shell
sudo apt-get install rtmpdump ffmpeg eyeD3
```

## Usage Tips

### Tip 1. crontab
crontab example
```shell
20 6 * * 1-6 ~/bin/rec_ebs_radio.sh EasyWriting 20 ~/Dropbox/EBS-Radio
40 6 * * 1-6 ~/bin/rec_ebs_radio.sh 귀가트이는영어 20 ~/Dropbox/EBS-Radio
00 7 * * 1-6 ~/bin/rec_ebs_radio.sh 입이트이는영어 20 ~/Dropbox/EBS-Radio
20 7 * * 1-6 ~/bin/rec_ebs_radio.sh EasyEnglish 20 ~/Dropbox/EBS-Radio
40 7 * * 1-6 ~/bin/rec_ebs_radio.sh PowerEnglish 20 ~/Dropbox/EBS-Radio
00 8 * * 1-6 ~/bin/rec_ebs_radio.sh 모닝스페셜 110 ~/Dropbox/EBS-Radio
50 9 * * 1-6 ~/bin/rec_ebs_radio.sh EBSWorldNews 10 ~/Dropbox/EBS-Radio
```
* [EBS 라디오 편성표](http://www.ebs.co.kr/schedule?channelCd=RADIO&onor=RADIO)

### Tip 2. Dropbox
If you save the new recording files into the Dropbox folder, the mp3 files can be easily accessed on mobile devices and other platforms (e.g. OS X). 

### Tip 3. Folder Action Script
For OS X Users, defining folder action script on the MP3 folder (possibly the Dropbox folder feeding MP3s from a distanced linux server, or guest linux OS on virtual machine) to add files into iTunes can save your time.
* [Folder Action Script Example](https://github.com/dongchon/recording-ebs-radio/blob/master/OS-X-folder-action-example)

### Tip 4. Artwork
If you place the the [program_name].jpg file in the artwork directory, the image file will be embedded as an album cover image. (only "jpg" extension is supported at this moment)

For example, the
```shell
./rec_ebs_radio.sh PowerEnglish 20 ~/Dropbox/EBS-Radio
```
command matches to the artwork image file, [artwork/PowerEnglish.jpg](https://github.com/dongchon/recording-ebs-radio/blob/master/artwork/PowerEnglish.jpg)

![Screenshot](https://github.com/dongchon/recording-ebs-radio/raw/master/screenshot.jpg "Screenshot")

## Motivated by
1. https://kldp.org/node/95974?page=1
2. https://code.google.com/p/ebs-radio/
3. http://xucxo.blogspot.ca/2010/08/ebs-lame-mp3gain-mplayer.html (initial source code reference)
