git clone https://github.com/wg/wrk.git
cd wrk
sudo apt-get install luarocks
sudo luarocks install luasocket
make

# Deployment
kubectl apply -f release/deployments.yaml
# For gRPC Proxy
kubectl apply -f release/service-grpc.yaml 
# For TCP Proxy
kubectl apply -f release/service-tcp.yaml 

# Install Istio
curl -k -L https://istio.io/downloadIstio | sh -
cd istio-1.12.1
export PATH=$PWD/bin:$PATH
istioctl x precheck
istioctl install --set profile=default -y
# turn on
kubectl label namespace default istio-injection=enabled
# turn off
kubectl label namespace default istio-injection-

wrk -t 1 -c 1 -d 30 -s <lua-script> -L http://10.96.7.56/