# Maintainer: cherrynoize <cherrynoize@duck.com>
pkgname=set-light
pkgver=0.0.2
pkgrel=1
epoch=
pkgdesc="Minimal backlight manager written in shell"
arch=()
url="https://github.com/cherrynoize/set-light"
license=('GPL')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname-$pkgver.tar.gz"
        "$pkgname-$pkgver.patch")
noextract=()
md5sums=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"
	patch -p1 -i "$srcdir/$pkgname-$pkgver.patch"
}

build() {
	cd "$pkgname-$pkgver"
	make install
}

check() {
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
