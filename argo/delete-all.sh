#/bin/bash
set +x
kubectl delete -n glpi deployments.apps glpi
kubectl delete -n glpi deployments.apps mariadb
kubectl delete -n glpi svc glpi-service
kubectl delete -n glpi configmaps mariadb-configmap
kubectl delete -n glpi configmaps glpi-configmap
kubectl delete pvc -n glpi glpi-claim 
kubectl delete pvc -n glpi mariadb-claim 
kubectl delete pv glpi-glpi
kubectl delete pv glpi-mariadb 
kubectl delete ns glpi