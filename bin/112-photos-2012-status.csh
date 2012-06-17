#!/bin/csh
#
# gives brief status of status in 112 photos of 2012. recomend
# calling from cron periodically, for example:
#
#   ~/projects/photos/bin/112-photos-2012-status.csh | mailx -s '112 photos in 2012 - status' schvin@schvin.net
#
# for more info on the 112 photos in 2012 project, check out these
# urls:
#
#   http://www.flickr.com/groups/1843711@N21/
#   http://www.flickr.com/photos/schvin/sets/72157629486826649/
#
###

set DATA=~/projects/scallop/art/112.md
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
