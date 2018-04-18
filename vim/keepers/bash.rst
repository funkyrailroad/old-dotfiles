arrays
array=(1 2 3)

${array{*}}
* as index for all members of an array

${#array{*}}
# in front of variable name to get number of members

sed '1,/phrase/d' filename.txt
delete range of text: remove from line 1 to (and including) first line with "phrase"

sed '/phrase/,$d' filename.txt
delete from "phrase" to end of file"

`sed examples <https://linuxconfig.org/learning-linux-commands-sed>`_

`Sed - An Introduction and Tutorial by Bruce Barnett
<http://www.grymoire.com/Unix/Sed.html#uh-0>`_

`awk examples <https://linuxconfig.org/learning-linux-commands-awk>`_
