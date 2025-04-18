FROM python:3.12-slim-bookworm

WORKDIR /app

ENV PATH="/root/.local/bin:$PATH"

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx install supabase-mcp-server

CMD ["sh", "-c", "supabase-mcp-server --host 0.0.0.0 --port ${PORT}"]
