# Theme: Moon (Lua)
Concept: Lua is a beautifully lightweight and minimal language. This 
rice was designed to reflect that philosophy by only implementing a 
bare-essentials UI. Instead of visual clutter, the focus is placed on 
heavy lifting under the hood, heavily utilizing Hyprland's new Lua API
for configuration and functional workflow enhancements.

# Efforts & Lua Integration:
- Original Assets: Wallpaper & Wlogout icons were designed from scratch
  by me in Inkscape

- Keybind Picker I reused a Recursive Descent json parser that I wrote
  in Lua to create a shortcut picker that parses `hyprctl -j binds` 
  and hands them to `hyprlauncher`. it can be launched with `SUPER+ALT+K`

- **Custom Dispatcher** (Lua): I implemented a custom utility function 
  which moves all windows from one workspace to another given `source`
  and `destination` parameters. it can be called with
  `require("dsp").windows.move_all_win()`
  I personally use it to *peek* my name:Comms -> special:comms workspace, 
  but you can use it in your own keybinds to move windows around en
  masse

## The Bar:
Keep clicking the LuaTip Quickshell bar module. You'll get actuall
useful Lua Tips.. mostly. Keep clicking, you'll find them eventually

It includes a workspace module, audio/volume module (powered by
pavu-control-qt) a simple clock, systray and a powermenu (the red crescent moon) 
powered by wlogout.

# Dependencies
for a comprehensive list of dependencies see [DEPS](/DEPS.md)

## Installation
⚠️**READ IT BEFORE YOU USE IT**

While I did write an `install.sh` script, this is my first time creating 
a rice, and I've never written a system-wide install-script before. I cannot guarentee 
that it will work exactly as intended, and it's possible I missed
some packages, though I did try my best :)

Keep in mind this script is only intended to install dependencies.
to actually use these dots, please use the stow command

## ❌ DON'T Stow Utils
Note: This is a private directory containing utilities used throughout 
this config. They are already relatively symlinked to where they are 
needed within the repo. Stowing this directory will create unnecessary
or broken symlinks in your home folder. No need to do it manually.

```bash 
stow utils
```

## ❌ DO THIS:
These are the base configs needed for the rice to function as
  intended.
```bash
stow -vSt ~ hypr mako quickshell Kvantum assets colors scripts \
kdeglobals lua-shell fastfetch wlogout

```
The following are other personal configs that you likely don't need or want
unless you want my exact terminal config
```bash
stow nvim wezterm fish
```
Keep in mind that this rice was designed around the wezterm terminal and 
this specific fish configuration. If you already have a shell and terminal 
preference, simply use your own and set your terminal's font and 
background color to match the theme. and if you want, configure fastfetch
to start with your terminal

# Screenshots
NOTE: Will be updated soon
<!-- <img width="1920" height="1080" alt="screenshot-2026-05-23-luancher" src="https://github.com/user-attachments/assets/ff88df3f-deb1-4a15-b36c-25154442586c" /> -->
<!-- <img width="941" height="640" alt="screenshot-2026-05-23-042204" src="https://github.com/user-attachments/assets/b236b866-2e2a-456d-a649-39e4eefddb21" /> -->
<!-- <img width="1920" height="1080" alt="screenshot-2026-05-23-041934" src="https://github.com/user-attachments/assets/ef1a64d0-e5b2-4ddb-ac36-9e4dde8c7e75" /> -->
<!-- <img width="1920" height="1080" alt="screenshot-2026-05-23-041609" src="https://github.com/user-attachments/assets/098b36ed-351e-40d4-a1fb-7d5c32997893" /> -->
<!-- <img width="1920" height="1080" alt="screenshot-2026-05-23-041417" src="https://github.com/user-attachments/assets/f45f6443-5cce-444c-9db7-a8a120e09e53" /> -->


## 📜 Credits & Licensing

This rice utilizes a modified version of the [Wings-Kvantum](https://github.com/L4ki/Wings-Plasma-Themes) theme by [L4ki], licensed under the **GPLv3 License**.

### Modifications Made:
- Removed the `window-normal` object layers within the core asset SVG 
(`Wings-Kvantum.svg`) to enforce a pure `#000000` 
pitch-black background canvas that matches the minimalist terminal aesthetics.

In accordance with the GPLv3 License, the modified theme assets contained 
within the `Kvantum/` folder remain fully open-source under the GPLv3.
