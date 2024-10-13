# Use a lightweight image
FROM alpine:latest

# Install dependencies for both QuickJS and Node.js
RUN apk add --no-cache git build-base curl

# Install QuickJS (JIT-less by default)
RUN git clone https://github.com/bellard/quickjs.git /quickjs && \
    cd /quickjs && \
    make && \
    cp qjs /usr/local/bin/ && \
    cp qjsc /usr/local/bin/

# Install Node.js (JIT-enabled)
RUN curl -fsSL https://unofficial-builds.nodejs.org/download/release/v14.17.0/node-v14.17.0-linux-x64.tar.xz | tar -xJ -C /usr/local --strip-components=1

# Set the working directory
WORKDIR /app

# Copy JavaScript files into the container
COPY sorters.js .
COPY tests.js .

# Default command will accept argument for choosing between QuickJS and Node.js
CMD ["sh", "-c", "if [ \"$1\" = 'node' ]; then node tests.js; else qjs tests.js; fi", "--"]
