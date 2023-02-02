docker build -t gmateosaws/fibonacci-client:latest -t gmateosaws/fibonacci-client:$GIT_SHA -f ./client/Dockerfile ./client
docker build -t gmateosaws/fibonacci-server:latest -t gmateosaws/fibonacci-server:$GIT_SHA -f ./server/Dockerfile ./server
docker build -t gmateosaws/fibonacci-worker:latest -t gmateosaws/fibonacci-worker:$GIT_SHA -f ./worker/Dockerfile ./worker

docker push gmateosaws/fibonacci-client:latest
docker push gmateosaws/fibonacci-server:latest
docker push gmateosaws/fibonacci-worker:latest

docker push gmateosaws/fibonacci-client:$GIT_SHA
docker push gmateosaws/fibonacci-server:$GIT_SHA
docker push gmateosaws/fibonacci-worker:$GIT_SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=gmateosaws/fibonacci-server:$GIT_SHA
kubectl set image deployments/client-deployment client=gmateosaws/fibonacci-client:$GIT_SHA
kubectl set image deployments/worker-deployment worker=gmateosaws/fibonacci-worker:$GIT_SHA

