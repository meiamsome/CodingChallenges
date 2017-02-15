#!/bin/sh
set -e

rm -rf _site/
bundle exec jekyll build -d _site/coding-challenges/

# Check line lengths
(! grep  --exclude-dir='.*' --exclude-dir='_site' -rI '.\{81\}' *)

# Format sanity
(! grep --exclude='test.sh' --exclude-dir='.*' \
 --exclude-dir='_site' -rIP '{({|%)[^ ]|[^ ](}|%)}' *)

# Check HTML validity
bundle exec htmlproofer ./_site --only-4xx --check-html
