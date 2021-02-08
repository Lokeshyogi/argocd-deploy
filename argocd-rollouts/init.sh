#!/bin/sh

mkdir -p /etc/deploy

case ${ENV} in
   "dev") echo ${kube_config_dev} | base64 -d > ${KUBECONFIG}
          export AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID_DEV
          export AWS_DEFAULT_REGION=$AWS_DEFAULT_REGION_DEV
          export AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY_DEV
      ;;
   *)
      echo "Environment is not defined correctly [dev]"
      exit 1 # Command to come out of the program with status 1
      ;;
esac

chmod 0600 ${KUBECONFIG}
kubectl config get-contexts
helm version
helm list
