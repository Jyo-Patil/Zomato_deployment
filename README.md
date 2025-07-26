Here's your cleaned-up `README.md` file in a single code block with **no personal name** included:

```markdown
# 🎬 Netflix Clone - CI/CD with GitHub Actions, AWS EKS, ECR, Helm, and ArgoCD

This project demonstrates a fully automated CI/CD pipeline for deploying a Netflix Clone application to an AWS EKS cluster using:

- **GitHub Actions** for CI/CD
- **Terraform** for infrastructure provisioning
- **Amazon ECR** for storing Docker images
- **Helm** for Kubernetes packaging
- **ArgoCD** for GitOps-based deployment

---

## 📦 Project Structure

```

.
├── app\_code/                  # Dockerized Netflix Clone source code
├── helm/
│   └── netflix-clone/        # Helm chart for Kubernetes deployment
├── terraform/                # Infrastructure as Code for AWS resources
├── .github/
│   └── workflows/
│       └── ci-cd.yaml        # GitHub Actions workflow file
└── README.md

````

---

## ⚙️ CI/CD Pipeline Overview

### 🔄 Trigger
- Triggered automatically on push to `main` branch.

### 📦 Build & Push Docker Image
- Docker image is built from `app_code/`.
- Image is tagged as `latest` and pushed to Amazon ECR.

### ☁️ Infrastructure Provisioning
- Terraform is used to provision or destroy AWS resources (EKS, VPC, etc.)

### 🐳 Kubernetes Deployment
- The `helm/netflix-clone` chart is deployed to EKS via ArgoCD.

### 🔁 GitOps with ArgoCD
- ArgoCD CLI logs into the remote ArgoCD server.
- EKS cluster is registered with ArgoCD.
- A new ArgoCD app is created (or updated) pointing to the Helm chart.

---

## 🚀 Deployment

### ✅ Prerequisites

- AWS Account with:
  - EKS Cluster (`netflix-cluster`)
  - ECR Repository (`netflix-clone`)
- ArgoCD installed on a separate VM or EC2 instance
- GitHub repository secrets configured:

| Secret Name               | Description                              |
|--------------------------|------------------------------------------|
| `AWS_ACCESS_KEY_ID`      | IAM user access key                      |
| `AWS_SECRET_ACCESS_KEY`  | IAM user secret key                      |
| `ARGOCD_SERVER_IP`       | Public IP or DNS of your ArgoCD instance |
| `ARGOCD_USERNAME`        | ArgoCD login username (default: admin)   |
| `ARGOCD_PASSWORD`        | ArgoCD login password                    |
| `GIT_USERNAME`           | GitHub username for ArgoCD access        |
| `GIT_PAT`                | GitHub personal access token             |

---

## 🌐 Access the App

### 1. Check Service Info

```bash
kubectl get svc netflix-clone -n default
````

* If `TYPE` is `LoadBalancer`, use the `EXTERNAL-IP` to access the app.
  Example:

  ```
  http://a1b2c3d4e5f6g7.elb.amazonaws.com
  ```

* If `TYPE` is `NodePort`, use the Node IP and port.

### 2. Port Forward (Optional Dev Test)

```bash
kubectl port-forward svc/netflix-clone 8080:80 -n default
```

Visit: `http://localhost:8080`

---

## 🧹 Clean Up

To destroy all resources via GitHub Actions:

```bash
git push origin main  # The CI/CD pipeline runs `terraform destroy`
```

---

## 🔐 Security Notes

* All credentials are managed securely using GitHub Actions Secrets.
* Avoid committing sensitive info in the repository.

---

---

## 🙋‍♂️ Support

For help, raise an issue in this repository.

```

Let me know if you want this `README.md` auto-generated into your repo structure or converted into HTML for a GitHub Pages view.
```
