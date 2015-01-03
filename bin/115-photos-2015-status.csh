#!/bin/csh
#
# gives brief status of status in 113 photos of 2013. recomend
# calling from cron periodically, for example:
#
#   ~/projects/photos/bin/113-photos-2013-status.csh | mailx -s '113 photos in 2013 - status' schvin@schvin.net
#
# for more info on the 113 photos in 2013 project, check out these
# urls:
#
#   http://www.flickr.com/groups/2107611@N24/
#   http://www.flickr.com/photos/schvin/sets/72157632620200167/
#
###

set DATA=~/projects/scallop/art/113.md
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
