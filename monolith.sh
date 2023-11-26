#!/system/bin/sh

SDK="$(getprop ro.build.version.sdk)"

if [ "$SDK" -ge 34 ]; then
  echo ">>> SDK version is $SDK"
  echo ">>> Using updated method"
  echo
  MODE="speed"
  echo ">>> Compiling"
  echo
  cmd package compile -a -f --full -m "$MODE"
else
  echo ">>> SDK version is $SDK"
  echo ">>> Using legacy method"
  echo
  MODE="everything-profile"
  echo ">>> Compiling"
  echo
  cmd package compile -a -f -m "$MODE"
  cmd package compile -a -f --compile-layouts
fi
echo ">>> Cleaning up"
echo
cmd package bg-dexopt-job

echo ">>>>>>>>>"
echo ">>> Done"
