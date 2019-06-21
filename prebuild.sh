#/bin/sh
set -xe
echo ">>>cp build.sh"
cp /var/code/webdockershell/build.sh /var/code/build.sh

echo ">>>chmod build.sh"
chmod +x /var/code/build.sh

echo ">>>start build"
/bin/bash /var/code/build.sh

echo ">>>cp docker.sh"
cp /var/code/webdockershell/docker.sh /var/code/docker.sh

echo ">>>chmod docker.sh"
chmod +x /var/code/docker.sh

echo ">>>start docker"
/bin/bash /var/code/docker.sh