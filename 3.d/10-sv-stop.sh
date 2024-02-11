echo "Waiting for services to stop..."

source /etc/runit/vars
source "$basedir/vars"
svdir=$svroot/services

sv force-stop "$svdir"/*
sv exit "$svdir"/*

echo "Done."
