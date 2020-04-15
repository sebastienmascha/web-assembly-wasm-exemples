# WebAssembly JavaScript API
Source: Documentation Mozilla Web Assembly 
Link: https://developer.mozilla.org/en-US/docs/WebAssembly/Exported_functions
### Hello World
index.html and simple.wasm

The net result of this is that we call our exported WebAssembly function exported_func, which in turn calls our imported JavaScript function imported_func, which logs the value provided inside the WebAssembly instance (42) to the console.

### Memory
In the low-level memory model of WebAssembly, memory is represented as a contiguous range of untyped bytes called Linear Memory that are read and written by load and store instructions inside the module.  In this memory model, any load or store can access any byte in the entire linear memory, which is necessary to faithfully represent C/C++ concepts like pointers.

Unlike a native C/C++ program, however, where the available memory range spans the entire process, the memory accessible by a particular WebAssembly Instance is confined to one specific — potentially very small — range contained by a WebAssembly Memory object.  This allows a single web app to use multiple independent libraries — each of which are using WebAssembly internally — to have separate memories that are fully isolated from each other.

In JavaScript, a Memory instance can be thought of as a resizable ArrayBuffer and, just as with ArrayBuffers, a single web app can create many independent Memory objects.  You can create one using the WebAssembly.Memory() constructor, which takes as arguments an initial size and (optionally) a maximum size.

Memory imports work just like function imports, only Memory objects are passed as values instead of JavaScript functions. Memory imports are useful for two reasons:

They allow JavaScript to fetch and create the initial contents of memory before or concurrently with module compilation.
They allow a single Memory object to be imported by multiple module instances, which is a critical building block for implementing dynamic linking in WebAssembly.

### Globals
WebAssembly has the ability to create global variable instances, accessible from both JavaScript and importable/exportable across one or more WebAssembly.Module instances. This is very useful, as it allows dynamic linking of multiple modules.

To create a WebAssembly global instance from inside your JavaScript, you use the WebAssembly.Global() 

# Compiling a New C/C++ Module to WebAssembly
When you’ve written a new code module in a language like C/C++, you can compile it into WebAssembly using a tool like Emscripten. Let’s look at how it works.

Get the Emscripten SDK, using these instructions: https://emscripten.org/docs/getting_started/downloads.html

With the environment set up, let's look at how to use it to compile a C example to Emscripten. There are a number of options available when compiling with Emscripten, but the main two scenarios we'll cover are:

Compiling to wasm and creating HTML to run our code in, plus all the JavaScript "glue" code needed to run the wasm in the web environment.
Compiling to wasm and just creating the JavaScript.
We will look at both below.

### Calling a custom function defined in C
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