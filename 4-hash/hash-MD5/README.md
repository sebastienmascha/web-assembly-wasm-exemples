MD5
===
implementation of the MD5 algorithm written in C

Add: 

Simple way:
``` html
  <div>
    <label style="font-size:20px;" for="myString">String to Hash:</label>
    <input style="font-size:20px;" type="text" id="myString" name="myString">
    <button onclick="Module.callMain([document.getElementById('myString').value])" style="font-size:20px;" >Compute Hash</button>
  </div>
```

With Script:
``` html
  <div>
    <label style="font-size:20px;" for="myString">String to Hash:</label>
    <input style="font-size:20px;" type="text" id="myString" name="myString">
    <button style="font-size:20px;" class="computeHash">Compute Hash</button>
  </div>
  <script>
    document.querySelector('.computeHash')
      .addEventListener('click', function () {
        Module.callMain(["Mist"])
    });
  </script>
```
