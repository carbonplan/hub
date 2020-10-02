FROM jupyterhub/k8s-hub:0.9.0-n226.h47f3da5c

ENV HASH 8fc2fc7ed696f925aa8e53cfc810d5fb6e7fb772
RUN pip install --upgrade --no-cache git+https://github.com/jupyterhub/kubespawner.git@${HASH}
