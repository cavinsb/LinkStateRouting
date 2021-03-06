==================================================
  CSCI 4273
  Network Systems
  Programming Assignment 3
  Link State Routing
  Written by Ben Cavins (cavinsb@colorado.edu)
==================================================

==================================================
  Files
==================================================

routed_LS.c        : Router implementation
initialization.txt : Initialization file
vector.h           : Vector header
vector.c           : Vector implementation
hashmap.h          : Hashmap header
hashmap.c          : Hashmap implementation
Makefile           : Makefile
start_routers.sh   : Startup script for routers
kill_routers.sh    : Kill script for routers

==================================================
  Examples
==================================================

--- Build ---
make

--- Run ---
# Run a single router
./routed_LS <router ID> < log file name> <initialization file>

# Run all routers
./start_routers.sh

--- Kill ---
./kill_routers.sh

==================================================
  General Info
==================================================

This is an implementation of a link state routing protocol built on top of
TCP. Routers connect to their direct neighbors (using an initialization file)
and flood the network with LSP containing these connections. Routers learn
the topology of the network via received LSP's and use Dijkstra's algorithm to
calculate the shortest-path tree to all known hosts. Routers forward all LSP's
they receive (unless the time-to-live has expired) and Rebroadcast their own
LSP's every 5 seconds.

==================================================
  Starting the Routers
==================================================

There is currently a race condition in router startup where two or more routers
listen on the same socket, causing deadlock. A delay should be added between
starting up routers to keep this from happening, like the one second sleep
in between startups in start_routers.sh .

==================================================
  Terminating Routers
==================================================

There are two ways to terminate routers. All routers periodically check stdin
for input. Typing "exit" for a router running in the foreground will cause it
to terminate. Further, this router will send a kill packet that causes all 
other routers to terminate as well.

The second, less elegant method is to use the kill_routers.sh script. This
simply sends a kill signal to all currently running routers.

==================================================
  Borrowed Code
==================================================

vector.* and hashmap.* were copied from https://github.com/zhemao/libds 

The code has been modified slightly to remove compiler warnings about signed/
unsigned integer comparison.

This code is distributed under the MIT licence, a copy of which is reproduced
below:

--- Licence ---

Copyright (c) 2011 Zhehao Mao

Permission is hereby granted, free of charge, to any person obtaining a copy of 
this software and associated documentation files (the "Software"), to deal in 
the Software without restriction, including without limitation the rights to 
use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies 
of the Software, and to permit persons to whom the Software is furnished to do 
so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all 
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR 
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS 
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR 
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER 
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN 
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

==================================================
  Known Bugs
==================================================

There is a race condition when initializing routers that may cause them to 
deadlock. See "Starting Routers" above for more info. 

==================================================
  Kitty
==================================================

  ^ ^
=(O.O)=
 (u u)/
