### Initialize providers & modules
```bash
terraform init
```

### Preview changes
```bash
terraform plan
```

### Apply (~10–15 min)
```bash
terraform apply
```

### Configure kubectl (output from above)
```bash
aws eks update-kubeconfig --region eu-north-1 --name my-eks-cluster
```

### Verify
```bash
kubectl get nodes
```