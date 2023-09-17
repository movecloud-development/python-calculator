# Flask WebApp Calc

[![Mit License Icon](https://black.readthedocs.io/en/stable/_static/license.svg)](https://github.com/UltiRequiem/flask-calculator/blob/main/LICENSE)
[![Code Style](https://img.shields.io/badge/Code%20Style-black-000000.svg)](https://github.com/psf/black)
[![Total Lines](https://img.shields.io/tokei/lines/github.com/UltiRequiem/flask-calculator?color=blue&label=Total%20Lines)](https://github.com/UltiRequiem/flask-calculator)
![CodeQL](https://github.com/UltiRequiem/flask-calculator/workflows/CodeQL/badge.svg)
![Repo Size](https://img.shields.io/github/repo-size/ultirequiem/flask-calculator?style=flat-square&label=Repo)

A simple calculator made with Flask.

[![image](https://user-images.githubusercontent.com/71897736/113590421-794cea80-95e7-11eb-8184-9aedad42131b.png)](https://flask-calculator.ultirequiem.repl.co)

## Demo

Here is a working live demo: https://flask-calculator.ultirequiem.repl.co
it runs in [Repl.it](https://repl.it).

## Development setup

1. Clone the proyect

```bash
git clone https://github.com/UltiRequiem/flask-calculator.git ; cd flask-calculator
```

2. Create a virtual environment

```bash
python3 -m venv env;source env/bin/activate
```

3. Install the dependencies

```bash
pip install -r requirements.txt
```

## License

This project is licensed under the [MIT](./LICENSE) License.

## Pushing image with Kubernetes and dockerhub
## Steps to install k3s cluster
1. Brew install kubectl
2. Kubectl version --client
3. Start docker desktop engine
4. brew install k3d
5. k3d cluster create my-k3s-cluster
6. kubectl version
7. kubectl get nodes
8. k3d cluster list - to list the k3d cluster list
9. export KUBECONFIG="$(k3d kubeconfig write my-k3s-cluster)" - to set environment variables

## Steps to build, tag and push the image to dockerhub repository
1. Create a docker file 
2. Build the docker image - docker build -t<image name>:<tagname> .
3. Sign up to dockerhub and create a private repository
4. Authenticate with dockerhub - docker login <pass username, password>
5. Create kubernetes secret with docker login credintials 
kubectl create secret docker-registry dockerhub-secret \
  --docker-username=saivinayn7 \
  --docker-password=9550037759V@v7 \
6. List the kubernetes secrets and update in the yaml file - kubectl get secrets
 imagePullSecrets:
- name: dockerhub-secret
7. Tag the docker image -  docker tag python-webapp:latest saivinayn7/kube_practice:latest
8. Push the image to the dockerhub repository - docker push saivinayn7/kube_practice:latest

## Steps to deploy python web app into kubernetes cluster
Make sure you are in the kube folder
1. Create a kubernetes resource file python-webapp.yaml
2. Apply the resource to cluster - kubectl apply -f python-webapp.yaml 
3. Check all the cluster events - kubectl get events
4. Check the deployments - kubectl get deployments
5. Check the pods - kubectl get pods
6. To check the listen port us this command 
kubectl get pod <your pod name>--template='{{(index (index .spec.containers 0).ports 0).containerPort}}{{"\n"}}'
6. Create a service - kubectl expose deployment <deployment name> --port=3000\n
7. Forard the port from cluster to localhost - kubectl port-forward service/<service name> 3000:3000
8. Check kubernetes service object - kubectl get service <name> -o yaml
9. Acces the python application from browser - http://localhost:3000



