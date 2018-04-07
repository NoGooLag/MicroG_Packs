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
app/DejaVuLocationService/DejaVuLocationService.apk
app/DroidGuard/DroidGuard.apk
app/GoogleCalendarSyncAdapter/GoogleCalendarSyncAdapter.apk
app/GoogleContactsSyncAdapter/GoogleContactsSyncAdapter.apk
app/LocalGSMNLPBackend/LocalGSMNLPBackend.apk
app/LocalWiFiNLPBackend/LocalWiFiNLPBackend.apk
app/MozillaUnifiedNLPBackend/MozillaUnifiedNLPBackend.apk
app/NominatimNLPBackend/NominatimNLPBackend.apk
etc/default-permissions/default-permissions.xml
etc/default-permissions/opengapps-permissions.xml
etc/permissions/com.google.android.maps.xml
etc/permissions/com.google.android.media.effects.xml
etc/permissions/com.google.widevine.software.drm.xml
etc/permissions/privapp-permissions-google.xml
etc/preferred-apps/google.xml
etc/sysconfig/framework-sysconfig.xml
etc/sysconfig/google_build.xml
etc/sysconfig/google.xml
etc/sysconfig/microg_packages.xml
etc/sysconfig/whitelist_com.android.omadm.service.xml
framework/com.google.android.maps.jar
framework/com.google.android.media.effects.jar
framework/com.google.widevine.software.drm.jar
lib64/libjni_latinimegoogle.so
lib/libjni_latinimegoogle.so
priv-app/GoogleServicesFramework/GoogleServicesFramework.apk
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
