#!/sbin/sh
#
# This addon.d script was automatically generated
# It backs up the files installed by microg-playstore
# If there are any issues, send an email to admin@shadow53.com
# describing the issue
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
app/FDroid/FDroid.apk
priv-app/DejaVuLocationService/DejaVuLocationService.apk
priv-app/DroidGuard/DroidGuard.apk
priv-app/FDroidPrivilegedExtension/FDroidPrivilegedExtension.apk
priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
priv-app/LocalGSMNLPBackend/LocalGSMNLPBackend.apk
priv-app/LocalWiFiNLPBackend/LocalWiFiNLPBackend.apk
priv-app/MozillaUnifiedNLPBackend/MozillaUnifiedNLPBackend.apk
priv-app/NominatimNLPBackend/NominatimNLPBackend.apk
priv-app/Phonesky/Phonesky.apk
priv-app/PrebuiltGmsCore/PrebuiltGmsCore.apk
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      echo "Backing up $FILE"
      backup_file $S/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      echo "Restoring $REPLACEMENT"
      R=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" -o -L "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
    done
  ;;
  pre-backup)
    #Stub
  ;;
  post-backup)
    #Stub
  ;;
  pre-restore)
    #Stub
  ;;
  post-restore)
    #Stub
  ;;
esac
