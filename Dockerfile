FROM python:3.12-slim-bookworm

WORKDIR /app

# Set PATH first so pipx binary is globally available
ENV PATH="/root/.local/bin:$PATH"

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx install supabase-mcp-server

# Use explicit path to the binary (avoids PATH issues completely)
CMD ["/root/.local/bin/supabase-mcp-server", "--host", "0.0.0.0", "--port", "${PORT}"]

