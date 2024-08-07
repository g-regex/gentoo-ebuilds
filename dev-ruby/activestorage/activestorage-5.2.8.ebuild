# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_DOCDIR=""
RUBY_FAKEGEM_EXTRADOC="CHANGELOG.md README.md"

RUBY_FAKEGEM_GEMSPEC="activestorage.gemspec"

RUBY_FAKEGEM_EXTRAINSTALL="app config db"

RUBY_FAKEGEM_BINWRAP=""

inherit ruby-fakegem eapi7-ver

DESCRIPTION="Attach cloud and local files in Rails applications"
HOMEPAGE="https://github.com/rails/rails"
SRC_URI="https://github.com/rails/rails/archive/v${PV}.tar.gz -> rails-${PV}.tgz"

LICENSE="MIT"
SLOT="$(ver_cut 1-2)"
KEYWORDS="~amd64 ~ppc ~ppc64 ~x86"
IUSE=""

RUBY_S="rails-${PV}/${PN}"

DEPEND+=" test? ( app-text/mupdf ) "

ruby_add_rdepend "
	~dev-ruby/actionpack-${PV}:*
	~dev-ruby/activerecord-${PV}:*
	dev-ruby/marcel:1.0
"

ruby_add_bdepend "
	test? (
		~dev-ruby/railties-${PV}
		dev-ruby/test-unit:2
		dev-ruby/mini_magick
		dev-ruby/mocha
		dev-ruby/rake
		dev-ruby/sqlite3
	)"

all_ruby_prepare() {
	   # Remove items from the common Gemfile that we don't need for this
		# test run. This also requires handling some gemspecs.
		sed -i -e "/\(system_timer\|sdoc\|w3c_validators\|pg\|execjs\|jquery-rails\|'mysql'\|journey\|ruby-prof\|stackprof\|benchmark-ips\|kindlerb\|turbolinks\|coffee-rails\|debugger\|sprockets-rails\|redcarpet\|bcrypt\|uglifier\|aws-sdk-s3\|google-cloud-storage\|azure-storage\|blade\|bootsnap\|hiredis\|qunit-selenium\|chromedriver-helper\|redis\|rb-inotify\|sprockets\|stackprof\|websocket-client-simple\|libxml-ruby\|sass-rails\|rubocop\|capybara\|rack-cache\|dalli\|listen\|connection_pool\|puma\|mysql2\)/ s:^:#:" \
			-e '/dalli/ s/2.7.7/2.7.9/' \
			-e '/:job/,/end/ s:^:#:' \
			-e '/:test/,/^end/ s:^:#:' \
			-e '/group :doc/,/^end/ s:^:#:' ../Gemfile || die
		rm ../Gemfile.lock || die

		# Fix spec broken with ruby24
		sed -i -e '35ibegin' -e '55iend' test/service/s3_service_test.rb || die
}
