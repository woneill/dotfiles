#!/usr/bin/env bash

PLUGIN_LIST=$(helm plugin list | tail +2 | awk '{print $1}')

for i in \
    diff,https://github.com/databus23/helm-diff \
    helm-git,https://github.com/aslafy-z/helm-git \
    s3,https://github.com/hypnoglow/helm-s3 \
    secrets,https://github.com/jkroepke/helm-secrets \
    unittest,https://github.com/helm-unittest/helm-unittest.git \
    kubeconform,https://github.com/jtyr/kubeconform-helm \
    ; do
  PLUGIN=${i%,*};
  URL=${i#*,};

  if echo "$PLUGIN_LIST" | grep -F -q -x "$PLUGIN"; then
      echo "Helm plugin $PLUGIN already installed"
  else
      echo "Helm plugin $PLUGIN NOT installed. Installing..."
      helm plugin install "$URL"
  fi
done
