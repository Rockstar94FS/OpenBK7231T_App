# This script will be called just before starting build process for ESP-IDF
# It allows you to make changes to the SDK, for example..
# For example, you can use changed files in the SDK for the automated build during the checks for a PR without changing the SDK itself:
# So your PR needs a modified define in the SDK, for example ? This script can make this change directly before the build.
#
#
# As an example you will find a script below which will copy all content of the "override"
# directory to the corresponding location in the SDK
#
#DIRNAME=$(dirname $0);
#echo "PREBUILD script! Executed from $DIRNAME!"
# allow whitspace in file or path, so take only newline as seperator
#OFS=$IFS
#IFS='
#'
#for X in $(find platforms/ESP-IDF/override/ -type f);do
#	# script is executed from main app directory, so take found file and path as source
#	S=${X};
#	# destination is path stripped from path to override
#	# so inside "override" we have the full path to the file
#	# starting with "sdk/esp-idf/..."
#	D=${X#platforms/ESP-IDF/override/};
#	# if file is present, we replace it, otherwise file is added ...
#	[ -e $D ] && echo "PREBUILD: replacing file\n\t$D\n\twith file\n\t$S" || echo "PREBUILD: adding file\n\t$S\n\tas\n\t$D"
#	cp $S $D;
#done
## restore IFS to whatever it was before ...
#IFS=$OFS
# you can also use all other commands to change files, like
# sed -i "s/#define FOO bar/#define FOO baz/" sdk/esp-idf/components/esp_driver_ledc/src/ledc.c
# or, let's assume you made a local change to your SDK
# and make a diff from that change (inside sdk/esp-idf/)
# git diff > ../../platforms/ESP-IDF/my_change.diff
# ( or make the diff and copy this file to platforms/ESP-IDF)
#
# and then in pre_build.sh you apply this patch with:
#
# patch -p 1 -d sdk/esp-idf < platforms/ESP_IDF/my_change.diff