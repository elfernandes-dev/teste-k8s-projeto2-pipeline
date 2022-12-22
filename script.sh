#!/bin/bash
echo "Criando a imagem....."
docker build -t evandrofernandes/kubernetes-projeto-dio:1.0 app/.

echo "Realizando o push da imagem....."
docker push evandrofernandes/kubernetes-projeto-dio:1.0

echo "Criando secrets....."
kubectl apply -f ./secrets.yml
rm ./secrets.yml

echo "Criando serviços no cluster kubernetes....."
kubectl apply -f ./services.yml

echo "Realizando os deployments....."
kubectl apply -f ./mysql-deployment.yml --record
kubectl apply -f ./app-deployment.yml --record
