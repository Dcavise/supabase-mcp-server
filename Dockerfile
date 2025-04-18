FROM python:3.12-slim-bookworm

WORKDIR /app

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx ensurepath && \
    pipx install supabase-mcp-server

ENV PATH="/root/.local/bin:$PATH"

CMD ["supabase-mcp-server", "--host", "0.0.0.0", "--port", "${PORT}"]
