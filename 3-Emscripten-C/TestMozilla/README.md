# Compiling a New C/C++ Module to WebAssembly
When you’ve written a new code module in a language like C/C++, you can compile it into WebAssembly using a tool like Emscripten. Let’s look at how it works.

Get the Emscripten SDK, using these instructions: https://emscripten.org/docs/getting_started/downloads.html

With the environment set up, let's look at how to use it to compile a C example to Emscripten. There are a number of options available when compiling with Emscripten, but the main two scenarios we'll cover are:

Compiling to wasm and creating HTML to run our code in, plus all the JavaScript "glue" code needed to run the wasm in the web environment.
Compiling to wasm and just creating the JavaScript.
We will look at both below.

# Calling a custom function defined in C
If you have a function defined in your C code that you want to call as needed from JavaScript, you can do this using the Emscripten ccall() function, and the EMSCRIPTEN_KEEPALIVE declaration (which adds your functions to the exported functions list (see Why do functions in my C/C++ source code vanish when I compile to JavaScript, and/or I get No functions to process?)). Let's look at how this works.

add to the end of JS file:

```
            document.querySelector('.mybutton')
                .addEventListener('click', function () {
                    alert('check console');
                    var result = Module.ccall(
                        'myFunction',	// name of C function 
                        null,	// return type 
                        null,	// argument types 
                        null	// arguments 
                        ); 
                        });
```