#!/bin/bash
YEAR=`cat ./year`
echo "Gathering $YEAR Messages..." >> ./script.log
find . -name "*.msg" -newermt "$YEAR"0101 -not -newermt "$((1+YEAR))"0101 >> msg_$YEAR.txt
echo "Changing the Permissions, Please Wait..." >> ./script.log
chmod -R 755 ../../store/ >> ./script.log
mkdir ../archive_$YEAR
echo "rsync starts Now..." >> ./script.log
rsync -a --include '*/' --exclude '*' /opt/zimbra/store/0/ ../archive_"$YEAR"/ >> ./script.log
sed -i 's/\.\///g' msg_$YEAR.txt
echo "Done for rsync, and now moving messages..." >> ./script.log
for foo in `cat msg_$YEAR.txt`;
    do
        mv $foo ../archive_"$YEAR"/"$foo";
    done
echo "$YEAR Messages are successfully, gathered" >> ./script.log
echo "Remaining Mailboxes from IDs to Aliases..." >> ./script.log
cd ../archive_"$YEAR"/
#Code this to default Python2.7 Path
/usr/local/bin/python2.7 ../0/rename_dirs.py >> ../0/script.log
echo "Removing the Empty Mailboxes..." >> ../0/script.log
for i in `ls | grep -v "@"`;
    do
        rm -rf $i;
    done
echo "Done, Archiving starts Now.." >> ../0/script.log
cd ../
tar --remove-files -zcvf /root/archive_"$YEAR".tar.gz archive_"$YEAR"
echo "Archiving is Done, Removing Archive Folder..." >> ./0/script.log
echo "Fixing Permissions..." >> ./0/script.log
chmod -R 750 ../../store/
echo "Done Successfully, Archive is ready at Root Home Dir..." >> ./0/script.log