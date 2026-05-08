# Gunakan image resmi yang stabil
FROM ghcr.io/puppeteer/puppeteer:latest

USER root

# Install dependencies tambahan untuk Chrome di Linux
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    procps \
    libxss1 \
    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install MCP server
RUN npm install -g @modelcontextprotocol/server-puppeteer

# Pastikan port menggunakan 3000
ENV PORT=3000
EXPOSE 3000

# Jalankan dengan mode SSE dan bypass sandbox
CMD ["npx", "-y", "@modelcontextprotocol/server-puppeteer", "--transport", "sse", "--port", "3000"]
