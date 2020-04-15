# For hello world :
emcc hello_world.c -s WASM=1 -o hello.html 

# Run the server on port 8080
python3 -m http.server 8080
