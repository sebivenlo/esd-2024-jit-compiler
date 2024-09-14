# PHP with JIT tests

This part contains the instructions on how to install a docker image which has a php 8.0 version with a JIT compiler, the JIT compiler can also be disable which allow us to test the performance between the PHP runner with and without JIT compiler. For this tests the Docker program is needed in order to use the images of the PHP with JIT


## Installation

1- Run the following command to install the image of the PHP 8.0
```bash
docker run -it akondas/php:8.0-cli-alpine
```

2- Add this file into your desired workfolder, call the file script.php
```bash
function fibonacci($n){
    return(($n < 2) ? 1 : fibonacci($n - 2) + fibonacci($n - 1));
}

$n = 32;
$start = microtime(true);
$fibonacci = fibonacci($n);
$stop = microtime(true);

echo sprintf("Fibonacci(%s): %s\nTime: %s", $n, $fibonacci, $stop-$start);
```

3- Copy the path where the script.php is located and put it in the following command which will run the file WITHOUT USING JIT
```bash
docker run -it -v "[Here goes your path where the PHP file is located]":/app -w /app akondas/php:8.0-cli-alpine php script.php
```

4- to see the improvement of the JIT compiler you can use the following command which enables the JIT, you should see in the echo of the php file that it prints a faster output
```bash
docker run -it -v "[Here goes your path where the PHP file is located]":/usr/src/app -w /usr/src/app akondas/php:8.0-cli-alpine php -dzend_extension=opcache.so -dopcache.enable_cli=1 -dopcache.jit_buffer_size=500000000 -dopcache.jit=1235 script.php
```




