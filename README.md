This repository provisions a production-ready Amazon EKS cluster using Terraform.

### Context & Motivation
Our engineering team was running a self-managed Kubernetes cluster on EC2 instances bootstrapped with kubeadm. Upgrades were painful, node failures required manual intervention, and there was no consistent way to reproduce the environment across staging and production. 

---

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
