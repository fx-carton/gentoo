# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit eutils

DESCRIPTION="A mashup of Nintendo's Super Mario Bros. and Valve's Portal"
HOMEPAGE="http://stabyourself.net/mari0/"
SRC_URI="http://stabyourself.net/dl.php?file=mari0-1006/mari0-source.zip -> ${P}.zip"

LICENSE="CC-BY-NC-SA-3.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

LVSLOT="0.8"
RDEPEND=">=games-engines/love-0.8.0:${LVSLOT}
	 media-libs/devil[png,gif]
"
DEPEND="app-arch/unzip"

S="${WORKDIR}"

src_install() {
	local dir=/usr/share/love/${PN}

	exeinto "${dir}"
	newexe "mari0_${PV}.love" ${PN}.love

	newdoc "readme.txt" README

	make_wrapper ${PN} "love-${LVSLOT} ${PN}.love" "${dir}"
	make_desktop_entry ${PN}
}
