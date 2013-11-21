recording-ebs-radio
===================

Recording EBS radio broadcast

Motivated by
[1] https://kldp.org/node/95974?page=1
[2] https://code.google.com/p/ebs-radio/

Initial reference: 
[3] http://xucxo.blogspot.ca/2010/08/ebs-lame-mp3gain-mplayer.html

crontab example:
20 6 * * 1-6 ~/bin/rec_ebs_radio.sh EasyWriting 20 ~/Dropbox/EBS-Radio
40 6 * * 1-6 ~/bin/rec_ebs_radio.sh 귀가트이는영어 20 ~/Dropbox/EBS-Radio
00 7 * * 1-6 ~/bin/rec_ebs_radio.sh 입이트이는영어 20 ~/Dropbox/EBS-Radio
20 7 * * 1-6 ~/bin/rec_ebs_radio.sh EasyEnglish 20 ~/Dropbox/EBS-Radio
40 7 * * 1-6 ~/bin/rec_ebs_radio.sh PowerEnglish 20 ~/Dropbox/EBS-Radio
00 8 * * 1-6 ~/bin/rec_ebs_radio.sh 모닝스페셜 110 ~/Dropbox/EBS-Radio
50 9 * * 1-6 ~/bin/rec_ebs_radio.sh EBSWorldNews 10 ~/Dropbox/EBS-Radio
