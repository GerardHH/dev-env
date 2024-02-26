# Setup
First clone repo onto system. The assumed path it `$HOME/dev-env`:
`cd && git clone https://github.com/GerardHH/dev-env.git`

Second run:
`$HOME/dev-env/bin/setup-dev-env.bash`

This should setup the whole user system.

Use `home-manager switch` when changes are made to `home.nix`. Other configuration files/folders are symlinks to the appropiate files/folders in the `dev-env`.

## Notes
- Install awesome on system.
- Install xclip (or other clipboard manager) from system. Some can't find libbsd if installed through nix.

## Bugs
- When installing for the first time, the Alacritty.desktop symlink in home.nix will terrorize the `home-manager switch` that is being done in `setup-dev-env.bash`. Comment it out and run `setup-dev-env.bash` again, after that comment the line in again and run `setup-dev-env.bash` again. The problem is about the file `Alacritty.desktop` not yet existing before it is installed, but home-manager will care.
- `trace: warning: getExe: Package nixGL does not have the meta.mainProgram attribute. We'll assume that the main program has the same name for now, but this behavior is deprecated, because it leads to surprising errors when the assumption does not hold. If the package has a main program, please set `meta.mainProgram` in its definition to make this warning go away. Otherwise, if the package does not have a main program, or if you don't control its definition, use getExe' to specify the name to the program, such as lib.getExe' foo "bar".`
- `vectorv2 [ TP333224_imu_oven_setting_not_working][$] ❯ ros2 run plotjuggler plotjuggler
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/m3i46laviz11sywkad3xylq0ikwzfs29-libglvnd-1.7.0/lib/libGLX.so
.0)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/ga17mlfsss2fndyvp2s1m0s2rx2b4i9s-libX11-1.8.7/lib/libX11.so.6
)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found (required by /nix/store/m3i46laviz11sywkad3xylq0ikwzfs29-libglvnd-1.7.0/lib/libGLdisp
atch.so.0)
/opt/ros/humble/lib/plotjuggler/plotjuggler: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_ABI_DT_RELR' not found (required by /nix/store/cyrrf49i2hm1w7vn2j945ic3rrzgxbqs-glibc-2.38-44/lib/lib
pthread.so.0)
[ros2run]: Process exited with failure 1`

## Whishlist
- Look into `clangd --path-mapping`
