GITHUB_USER="username"
GITHUB_TOKEN="<YOUR_GITHUB_PAT>"   # a PAT with read:packages scope

kubectl create namespace production --dry-run=client -o yaml | kubectl apply -f -

kubectl create secret docker-registry ghcr-secret \
  --namespace=production \
  --docker-server=ghcr.io \
  --docker-username="${GITHUB_USER}" \
  --docker-password="${GITHUB_TOKEN}" \
  --dry-run=client -o yaml | kubectl apply -f -

echo "ghcr-secret created in namespace production"