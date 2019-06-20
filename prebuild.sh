#/bin/sh
set -xe
echo ">>>cp build.sh"
cp /var/code/webdockershell/build.sh /var/code/build.sh

echo ">>>chmod build.sh"
chmod +x /var/code/build.sh

echo ">>>start build"
/bin/bash /var/code/build.sh