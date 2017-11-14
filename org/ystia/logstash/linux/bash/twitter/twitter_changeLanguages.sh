#!/usr/bin/env bash

source ${utils_scripts}/utils.sh
log begin

source ${lsscripts}/logstash_utils.sh

ensure_home_var_is_set

# get LOGSTASH_HOME
source ${YSTIA_DIR}/${HOST}-service.env

log info "Update Twitter languages property: "
log info "    languages: ${languages}"


if [[ "$(grep -c "languages" "${LOGSTASH_HOME}/conf/1-${NODE}_logstash_inputs.conf")" != "0" ]]; then

    if [[ "${languages}" == "" ]]; then

        del_conf_property $LOGSTASH_HOME/conf/1-${NODE}_logstash_inputs.conf "languages" || error_exit "Reconfiguration failed"

    else

        replace_conf_value $LOGSTASH_HOME/conf/1-${NODE}_logstash_inputs.conf "languages" "${languages}" || error_exit "Reconfiguration failed"

    fi

elif [[ "${languages}" != "" ]]; then

    add_conf_property $LOGSTASH_HOME/conf/1-${NODE}_logstash_inputs.conf "languages" "${languages}" || error_exit "Reconfiguration failed"

fi

send_sighup_ifneeded

log end