FROM ghcr.io/puppeteer/puppeteer:latest
USER root
WORKDIR /app
RUN npm install -g @modelcontextprotocol/server-puppeteer
ENV PORT=3000
EXPOSE 3000
CMD ["npx", "@modelcontextprotocol/server-puppeteer", "--no-sandbox", "--disable-setuid-sandbox"]
CMD ["npx", "-y", "@modelcontextprotocol/server-puppeteer", "--transport", "sse", "--port", "3000"]
