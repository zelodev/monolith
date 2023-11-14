#!/system/bin/sh

MODE="verify"

echo ">>> Compiling"
echo
cmd package compile -a -f --full -m "$MODE"

echo ">>> Cleaning up"
cmd package bg-dexopt-job

echo ">>> Done"
