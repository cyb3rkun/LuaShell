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


## 📜 Credits & Licensing

This rice utilizes a modified version of the [Wings-Kvantum](https://github.com/L4ki/Wings-Plasma-Themes) theme by [L4ki], licensed under the **GPLv3 License**.

### Modifications Made:
- Removed the `window-normal` object layers within the core asset SVG 
(`Wings-Kvantum.svg`) to enforce a pure `#000000` 
pitch-black background canvas that matches the minimalist terminal aesthetics.

In accordance with the GPLv3 License, the modified theme assets contained 
within the `Kvantum/` folder remain fully open-source under the GPLv3.
