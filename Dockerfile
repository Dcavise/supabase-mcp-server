FROM python:3.12-slim-bookworm

WORKDIR /app

# Set PATH early so pipx + the binary will be globally accessible
ENV PATH="/root/.local/bin:$PATH"

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx install supabase-mcp-server

CMD ["supabase-mcp-server", "--host", "0.0.0.0", "--port", "${PORT}"]
