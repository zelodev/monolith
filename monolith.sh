#!/system/bin/sh

MODE="speed"

echo ">>> Compiling"
echo
cmd package compile -a -f --full -m "$MODE"

echo ">>> Cleaning up"
echo
cmd package bg-dexopt-job

echo ">>>>>>>>>"
echo ">>> Done"
