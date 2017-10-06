#!/usr/bin/env bash

source ${utils_scripts}/utils.sh
source ${geoscripts}/utils.sh

log begin

ensure_home_var_is_set

if isServiceInstalled; then
    log end "GeoNames component '${NODE}' already installed"
    exit 0
fi

sudo yum install -y "wget" "unzip" || {
    error_exit "Failed to install required support packages using yum"
}

GEONAMES_HOME=$HOME/${NODE}
mkdir -p ${GEONAMES_HOME}/logs
mkdir -p ${GEONAMES_HOME}/data

GEONAMES_FILE=$GEONAMES_HOME/data/${FNAME}.txt

echo "GEONAMES_HOME=$GEONAMES_HOME" > ${YSTIA_DIR}/${NODE}-service.env
echo "GEONAMES_FILE=$GEONAMES_FILE" >> ${YSTIA_DIR}/${NODE}-service.env

get_geonames_from_repository $FNAME $REPOSITORY

setServiceInstalled

log end