#!/bin/sh
allOK = true

echo "------------------> Deploying Covachapp" $(date) "\n"
echo "Creating secrects...\n"

kubectl apply -f ./secrects

echo "Creating volumes...\n"

kubectl apply -f ./volumesConfigs

echo "Creating services...\n"

echo "Creating dbs...\n"

helm install auth-db --values ./launchs/auth_db.yml  ./postgres-db 
helm install products-db --values ./launchs/products_db.yml  ./postgres-db 
helm install search-db --values ./launchs/search_db.yml  ./mongo-db 




helm install <service_name> --values ./launchs/auth_db.yml  ./postgres_db 


