#!/bin/sh
set -e

bundle exec jekyll build

# Check line lengths
(! grep  --exclude-dir='.*' --exclude-dir='_site' -rI '.\{81\}' *)

# Format sanity
(! grep --exclude='test.sh' --exclude-dir='.*' \
 --exclude-dir='_site' -rIP '{({|%)[^ ]|[^ ](}|%)}' *)

# Check HTML validity
bundle exec htmlproofer ./_site --only-4xx --check-html
