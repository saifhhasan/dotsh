## Basic kernel info
```
$ uname -r
$ uname -a
```

## /proc
Information about processes

## Kernel Modules
```
// List all kernel modules
$ lsmod

// Load a kernel module along with it's dependencies
$ modeprobe iptables

// Insert a custom built kernel module
$ insmod my_kernel_module.ko

// Remove kernel module
$ rmmod my_kernel_module

```

## Kernel Panic
When something goes wrong in Kernel it's fatals and system restarts. Useful
information can be

- Instruction pointer
- PID
- Call Trace

## Kernel Threads
Processes inside kernel. Some of them are `kworker`, `watchdog`
