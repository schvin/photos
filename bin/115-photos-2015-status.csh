#!/bin/csh
#
# gives brief status of status in 115 photos of 2015. recomend
# calling from cron periodically, for example:
#
#   ~/projects/photos/bin/115-photos-2015-status.csh | mailx -s '115 photos in 2015 - status' schvin@schvin.net
#
# for more info on the 115 photos in 2015 project, check out these
# urls:
#
#   https://www.flickr.com/groups/2636120@N24/
#   https://www.flickr.com/photos/schvin/sets/72157649667421559
#
###

set DATA=~/projects/photos/projects/115.md
set TODODATA=$TMPDIR/$$-list
set IDEA=$TMPDIR/$$-idea

if(! -e $DATA) then
  echo "Data file $DATA doesn't exist."
  exit(1)
endif

set DONE=`egrep '^\* [0-9]+\.' $DATA | wc -l`
egrep '^[0-9]+\.' $DATA > $TODODATA
set TODO=`cat $TODODATA | wc -l`

echo "You have completed $DONE photos, leaving $TODO to go!"
echo
echo "Here are a few ideas:"
foreach idea (1 2 3)
  set R=`perl -le "print int(rand($TODO))"`
  cat $TODODATA | perl -slane 'if($. == $r) { print "  $_"; }' -- -r=$R >> $IDEA
end
cat $IDEA | sort -g | uniq
