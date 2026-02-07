FROM python:3.11-slim

# Install lxmf package (includes lxmd)
RUN pip install --no-cache-dir lxmf

# Create directories for config and data
RUN mkdir -p /root/.lxmd /root/.reticulum

# Declare volumes (CRITICAL for Umbrel compatibility)
VOLUME /root/.lxmd
VOLUME /root/.reticulum

# Set working directory
WORKDIR /root

# Use ENTRYPOINT + CMD (better practice)
ENTRYPOINT ["lxmd"]
CMD ["-p", "-v"]
