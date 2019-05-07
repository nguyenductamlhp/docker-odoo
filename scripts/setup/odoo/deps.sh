set -e

echo "Install webkit2pdf command"

WTH_VERSION="0.12.1"
UBUNTU_ARCHI=`uname -a | grep 64 &>/dev/null; [ $? -eq 0 ] && echo 'amd64' || echo 'i386'`
UBUNTU_CODE=`lsb_release -a 2>/dev/null | grep Codename  | sed 's/.*\:\t*//'`
WTH_BASE_URL="https://downloads.wkhtmltopdf.org/0.12/0.12.5/wkhtmltox_0.12.5-1.xenial_amd64.deb"
WTH_URL=`printf $WTH_BASE_URL $WTH_VERSION $WTH_VERSION $UBUNTU_CODE $UBUNTU_ARCHI`

echo "- download wkhtmltopdf $WTH_VERSION deb package for ubuntu $UBUNTU_CODE..."
echo "  package url: $WTH_URL"

apt-get install xfonts-base xfonts-75dpi
wget  "$WTH_URL" -O /tmp/wkhtmltopdf.deb
dpkg -i /tmp/wkhtmltopdf.deb
rm -f /tmp/wkhtmltopdf.deb

