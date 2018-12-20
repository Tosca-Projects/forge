#!/usr/bin/env bash

BINTRAY_USER="loicalbertin"

date_lang="1 month ago"
purge_date="$(date --date="${date_lang}" --iso-8601=seconds)"

if [[ -z "${BINTRAY_API_KEY}" ]]; then
	echo "please setup BINTRAY_API_KEY variable";
	exit 1
fi

echo "cleanup forge snapshots older than ${date_lang}"

for p in $(curl -s -u "${BINTRAY_USER}:${BINTRAY_API_KEY}" "https://api.bintray.com/packages/ystia/forge/distributions/files" | jq ".[] | select((.path | startswith(\"snapshots\")) and ( .path | startswith(\"snapshots/develop\") | not ) and (.created < \"${purge_date}\" )) | .path" -r) ; do
        echo "deleting path $p"
        curl -s -u "${BINTRAY_USER}:${BINTRAY_API_KEY}" "https://api.bintray.com/content/ystia/forge/${p}" -X DELETE | jq '.message' -r
        echo
done

