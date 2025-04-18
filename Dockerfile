FROM python:3.12-slim-bookworm

WORKDIR /app

ENV PATH="/root/.local/bin:$PATH"

RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install --no-cache-dir pipx && \
    pipx install supabase-mcp-server

CMD ["/root/.local/bin/supabase-mcp-server", "--host", "0.0.0.0", "--port", "10000"]
