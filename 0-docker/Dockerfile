FROM debian:latest
MAINTAINER Robert Aboukhalil

# Main dependencies
RUN apt-get update && \
    apt-get install -y git python build-essential openjdk-8-jre-headless

# Setup emsdk
RUN git clone https://github.com/emscripten-core/emsdk.git
WORKDIR /emsdk
RUN git pull

RUN ./emsdk install latest && \
    ./emsdk activate latest && \
    ./emsdk construct_env && \
    echo ". /emsdk/emsdk_set_env.sh" >> ~/.bashrc && \
    . ~/.bashrc && \
    em++ --version

RUN mkdir /src
WORKDIR /src

# Book dependencies (putting those here so we don't rebuild scratch every time we add a dependency)
# Tools we'll use while building packages + OpenGL support + SDL2 support
RUN apt-get install -y \
    procps gcc vim libz-dev autoconf libtool cmake \
    libgles2-mesa-dev \
    libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev \
    curl

# Setup & launch web server
ENV PORT 80
ENV WEB_SERVER_CODE "\
import SimpleHTTPServer, SocketServer \n\n\
class Handler(SimpleHTTPServer.SimpleHTTPRequestHandler): \n\
    pass \n\n\
Handler.extensions_map['.wasm'] = 'application/wasm' \n\n\
print('Launching server on port {}...'.format($PORT)) \n\
httpd = SocketServer.TCPServer(('', $PORT), Handler) \n\
httpd.serve_forever()\n"

RUN echo "$WEB_SERVER_CODE" > /emsdk/server.py
CMD python /emsdk/server.py

# Export port
EXPOSE $PORT
