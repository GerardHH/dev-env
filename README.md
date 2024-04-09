<!--toc:start-->
- [Setup](#setup)
- [Notes](#notes)
- [Bugs](#bugs)
- [Whishlist](#whishlist)
<!--toc:end-->

# Setup
First clone repo onto system. The assumed path it `$HOME/dev-env`:
`cd && git clone https://github.com/GerardHH/dev-env.git`

Second run:
`$HOME/dev-env/bin/setup-dev-env.bash`

This should setup the whole user system.

Use `home-manager switch` when changes are made to `home.nix`. Other configuration files/folders are symlinks to the appropriate files/folders in the `dev-env`.

# Notes
1. Install awesome on system.
2. Install xclip (or other clipboard manager) from system. Some can't find libbsd if installed through nix.
3. Use system terminal emulator (not nix installed one), to prevent bug 1.
4. On Ubuntu 22.04:
```
sudo apt install libspa-0.2-bluetooth
systemctl --user restart pipewire.service
```
To fix the not working Sony WH-1000XM5.
5. nvim complained about `invalid node type at position` for lua. Running `TSInstall all` in nvim seemed to fix it, so probably `TSInstall lua` should've done the trick too. It seemed to be using the one provided by nix.

# Bugs
1. GUI applications spawned from Alacritty (or any terminal emulator using nixGL), will have problems finding GL libraries:
```
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/m3i46laviz11sywkad3xylq0ikwzfs29-libglvnd-1.7.0/lib/libGLX.so.0)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/ga17mlfsss2fndyvp2s1m0s2rx2b4i9s-libX11-1.8.7/lib/libX11.so.6)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/m3i46laviz11sywkad3xylq0ikwzfs29-libglvnd-1.7.0/lib/libGLdispatch.so.0)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_ABI_DT_RELR' not found (required by /nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib/libpthread.so.0)
[ros2run]: Process exited with failure 1
```
Because Alacritty uses nixGL (replaced the binary with a script), all GUI applications spawned from it may have these issues.
2. pandas can't be found by python3 installed by home-manager.

# Whishlist
1. Look into `clangd --path-mapping`
