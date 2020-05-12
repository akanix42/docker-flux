FROM fluxcd/flux:1.19.0

# Install Curl
RUN /sbin/apk add curl

# Install Helm
RUN mkdir -p /tmp/setup \
  && cd /tmp/setup \
  && curl https://get.helm.sh/helm-v3.2.0-linux-amd64.tar.gz | tar xz \
  && mv linux-amd64/helm /usr/local/bin \
  && rm -rf /tmp/setup

# Install yq
RUN curl https://github.com/mikefarah/yq/releases/download/3.3.0/yq_linux_amd64 --location --output /usr/local/bin/yq \
  && chmod +x /usr/local/bin/yq

# Copy flux environment script
COPY flux.env.sh /
