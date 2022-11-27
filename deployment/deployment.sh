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

echo "Creating backend services...\n"

helm install auth-service --values ./launchs/auth_service.yml  ./python-app 
helm install products-service --values ./launchs/products_service.yml  ./python-app 

helm install search-consumer --values ./launchs/search_consumer.yml ./go-app
helm install search-service --values ./launchs/search_service.yml ./go-app

echo "Creating frontend services...\n"

helm install frontend --values ./launchs/frontend_service.yml ./next-app

# helm install <service_name> --values ./launchs/auth_db.yml  ./postgres_db 

#kubectl create secret docker-registry covapp --docker-server covapp.azurecr.io --docker-username c74dcb48-3455-40ae-8ad9-47fe3d48aa4d --docker-password 3162823639Mio. --docker-email c74dcb48-3455-40ae-8ad9-47fe3d48aa4d

#kubectl create secret docker-registry regcred --docker-server=<your-registry-server> --docker-username=<clientId> --docker-password=<your-pword> --docker-email=<your-email>


