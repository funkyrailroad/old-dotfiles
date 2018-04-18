#! /bin/bash
for i in `ls | grep -v symlink_script.sh`; do
    mv ~/.$i{,.bak}
    ln -rs $i ~/.$i
done
