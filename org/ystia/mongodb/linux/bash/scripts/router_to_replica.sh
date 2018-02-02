#!/usr/bin/env bash
#
# Ystia Forge
# Copyright (C) 2018 Bull S. A. S. - Bull, Rue Jean Jaures, B.P.68, 78340, Les Clayes-sous-Bois, France.
# Use of this source code is governed by Apache 2 LICENSE that can be found in the LICENSE file.
#


source ${utils_scripts}/utils.sh
log begin

log info "A Replica Set Server IP Address and Port ${REPLICA_SET}/${TARGET_IP}:${DB_PORT} to be added to shard file"

lock "shard"
  # Add Replica Set Server node IP Address and Port for shard to shard file behind lock
  log info "sh.addShard(\"${REPLICA_SET}/${TARGET_IP}:${DB_PORT}\") to be added to shard file"
  
  if [[ ! -f ~/replica ]]; then
    echo "sh.status()" >>~linux/bashard
    echo "sh.addShard(\"${REPLICA_SET}/${TARGET_IP}:${DB_PORT}\")" >>~/shard
    echo "sh.status()" >>~/shard
  else
    echo "sh.addShard(\"${REPLICA_SET}/${TARGET_IP}:${DB_PORT}\")" >>~/shard
    echo "sh.status()" >>~/shard
  fi
unlock "shard"

log info "Added <<<sh.addShard(\"${REPLICA_SET}/${TARGET_IP}:${DB_PORT}\")>>> to shard file"
    
log end
