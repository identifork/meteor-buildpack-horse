#!/bin/sh
#
# If MONGO_URL is not specified, try the following in order:
#
# - MONGODB_URI: current default for mongolab addon
# - MONGOLAB_URI: old default for mongolab addon
# - MONGOHQ_URL: old default for mongohq addon
#
echo "-----> Adding profile script to resolve MONGO_URL from mongolab addon"
cat > "$APP_CHECKOUT_DIR"/.profile.d/mongo_url.sh <<EOF
  !/bin/bash
  #if [ -z \$MONGO_URL ] ; then
    #export MONGO_URL=\${MONGODB_URI:-\${MONGOLAB_URI:-\$MONGOHQ_URL}}
  #fi
  if [ -z \$MONGO_URL ] ; then
    echo "ROOT_URL: $ROOT_URL"
    echo "MONGO_URL: $MONGO_URL"
    
    env
    echo "meteor-buildpack-horse: MONGO_URL missing, you must define it for meteor to work."
  fi
EOF
