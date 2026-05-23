# Dependencies
for a list of dependencies see [DEPS](/DEPS.md)

# DON'T
```bash 
stow utils
```

to import these dotfiles on you're in you're on environment, you can use
the stow command.
- **NOTE:** These are the base configs needed for the rice to function as
  intended.
```bash
stow -vSt ~ hypr mako quickshell Kvantum assets colors scripts \
kdeglobals lua-shell fastfetch wlogout
```
The following are other personal configs that you likely don't need or want.
```bash
stow nvim wezterm fish
```
Keep in mind that this Rice was designed around the `wezterm` terminal
and this specific `fish` configuration. 
However, it's likely you already have a shell and terminal preference,
if that's the case use you're own shell config, and to match the 
wezterm config you can just set the `font` and `background color` 
variables the same.

# Screenshots
<img width="1920" height="1080" alt="screenshot-2026-05-23-luancher" src="https://github.com/user-attachments/assets/ff88df3f-deb1-4a15-b36c-25154442586c" />
<img width="1922" height="1085" alt="screenshot-2026-05-23-044008" src="https://github.com/user-attachments/assets/f79e9575-23d3-4bd3-95ae-792344e738c8" />
<img width="941" height="640" alt="screenshot-2026-05-23-042204" src="https://github.com/user-attachments/assets/b236b866-2e2a-456d-a649-39e4eefddb21" />
<img width="1920" height="1080" alt="screenshot-2026-05-23-041934" src="https://github.com/user-attachments/assets/ef1a64d0-e5b2-4ddb-ac36-9e4dde8c7e75" />
<img width="1920" height="1080" alt="screenshot-2026-05-23-041609" src="https://github.com/user-attachments/assets/098b36ed-351e-40d4-a1fb-7d5c32997893" />
<img width="1920" height="1080" alt="screenshot-2026-05-23-041417" src="https://github.com/user-attachments/assets/f45f6443-5cce-444c-9db7-a8a120e09e53" />


## 📜 Credits & Licensing

This rice utilizes a modified version of the [Wings-Kvantum](https://github.com/L4ki/Wings-Plasma-Themes) theme by [L4ki], licensed under the **GPLv3 License**.

### Modifications Made:
- Removed the `window-normal` object layers within the core asset SVG 
(`Wings-Kvantum.svg`) to enforce a pure `#000000` 
pitch-black background canvas that matches the minimalist terminal aesthetics.

In accordance with the GPLv3 License, the modified theme assets contained 
within the `Kvantum/` folder remain fully open-source under the GPLv3.
