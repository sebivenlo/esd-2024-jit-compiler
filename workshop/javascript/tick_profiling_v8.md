## Tick profiling V8

JIT is all about performance. Profiling a Node.js application involves measuring its performance by analyzing the CPU, memory, and other runtime metrics while the application is running.

```text
NODE man page
--prof            Generate V8 profiler output.
--prof-process    process V8 profiler output generated using --prof
```


### FIBONACCI
    node --prof fibonacci.js

This creates a isolate-xxxxxxxxxxxxx-v8.log file

    node --prof-process isolate-xxxxxxxxxxxxx-v8.log > profile.txt

Open profile.txt and see in summary that **Javascript** has the most ticks

### ALDA_SORTING

    node --prof sorters.js

This creates a isolate-xxxxxxxxxxxxx-v8.log file

    node --prof-process isolate-xxxxxxxxxxxxx-v8.log > profile.txt

Open profile.txt and see in summary that **C++** has the most ticks

## Question
Why the ALDA_SORTING is more C++ intensive, and the FIBONACCI is more Javascript intensive?

![V8](v8engine.webp)
Source: [V8 JavaScript Engine Improvement](https://www.freshcodeit.com/blog/v8-javascript-engine-improvement)


Back to [challenges overview](/README.md)