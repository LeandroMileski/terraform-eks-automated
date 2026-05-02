### Initialize providers & modules
terraform init

### Preview changes
terraform plan

### Apply (~10–15 min)
terraform apply

### Configure kubectl (output from above)
aws eks update-kubeconfig --region eu-north-1 --name my-eks-cluster

### Verify
kubectl get nodes
