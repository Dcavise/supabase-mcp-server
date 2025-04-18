FROM python:3.12-slim-bookworm

WORKDIR /app

# Minimal install
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx ensurepath && \
    pipx install supabase-mcp-server

ENV PATH="/root/.local/bin:$PATH"

# No need to EXPOSE if you're using render.yaml
# No need for CMD if using render.yaml's startCommand
