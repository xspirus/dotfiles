if [ ! -d "${HOME}/android/sdk" ]; then
  return
fi

export ANDROID_SDK_ROOT="${HOME}/android/sdk"
export ANDROID_HOME="${ANDROID_SDK_ROOT}"

if [ -d "${ANDROID_SDK_ROOT}" ]; then
  alias adb="${ANDROID_SDK_ROOT}/platform-tools/adb"
  alias sid="${ANDROID_SDK_ROOT}/platform-tools/adb devices -l | grep -E 'MSM' | awk '{print \$1}' | xargs echo"
  alias tid="${ANDROID_SDK_ROOT}/platform-tools/adb devices -l | grep -E 'Tablet' | awk '{print \$1}' | xargs echo"
fi
