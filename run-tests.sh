#/bin/sh


set -e

Xvfb :99 2>&1 &

robot -d Results -T Tests

exec "$@"
