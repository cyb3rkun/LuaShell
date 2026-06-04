# 🌕 LuaShell

> A Hyprland rice inspired by the Moon and the Lua scripting language — minimal, dark, and precise.

<img width="1920" height="1080" alt="screenshot-2026-06-04-194213" src="https://github.com/user-attachments/assets/e9783925-98b9-406e-a289-8ddef3af6e30" />

---

## ✨ Overview

LuaShell is a dotfiles configuration for Hyprland built around a lunar aesthetic: pitch-black backgrounds, cool blue-white accents, and a clean interface that stays out of your way. The shell layer is powered by [Quickshell](https://quickshell.outfoxxed.me/) and written almost entirely in Lua and QML, keeping the config readable and hackable.

**Stack at a glance:**

| Component        | Tool              |
|------------------|-------------------|
| Compositor       | Hyprland          |
| Shell / Bar      | Quickshell        |
| Terminal         | WezTerm           |
| Shell            | Fish              |
| Editor           | Neovim            |
| Notifications    | Mako              |
| Launcher         | Hyprlauncher      |
| Logout           | Wlogout + Hyprshutdown |
| Fetch            | Fastfetch         |
| QT Theme         | Kvantum (Wings-Kvantum, modified) |
| Icons            | Tokyo Night SE    |
| File Manager     | Dolphin           |

---

## 📸 Screenshots
<img width="1920" height="1080" alt="screenshot-2026-06-04-194339" src="https://github.com/user-attachments/assets/0c7c528a-409f-407c-808e-f6221d6f86e9" />
<img width="1916" height="205" alt="screenshot-2026-06-04-194322" src="https://github.com/user-attachments/assets/b6515e8f-e12c-4ae8-8247-f6b7f4fd88e6" />

<img width="607" height="305" alt="screenshot-2026-06-04-195411" src="https://github.com/user-attachments/assets/2888638a-dcaf-46a9-a85d-998c85c1bb9d" />

---

## 📦 Dependencies

See [DEPS.md](DEPS.md) for the full list. Core requirements:

- `hyprland`
- `quickshell` + Qt6 modules (`qt6ct`, `qtmultimedia`, `qtimageformats`, `qt6-5compat`, `qt6svg`)
- `mako` (notifications)
- `hyprlauncher`, `hyprlock`, `hyprshutdown`, `pyprpaper`
- `wlogout`
- `kvantum` (for QT application theming)
- **Tokyo Night SE** icon pack → install to `/usr/share/icons/` or `~/.local/share/icons/`
- `wl-clipboard` (screenshots)

Optional but recommended:
- `wezterm` (the rice was designed around it)
- `fish` shell

---

## 🚀 Installation

This repo uses [GNU Stow](https://www.gnu.org/software/stow/) to symlink configs into place.

**1. Clone the repo**

```bash
git clone https://github.com/cyb3rkun/LuaShell ~/.config/LuaShell
cd ~/.config/LuaShell
```

**2. Install the core rice configs**

```bash
stow -vSt ~ hypr mako quickshell Kvantum assets colors scripts \
  kdeglobals lua-shell fastfetch wlogout
```

> ⚠️ Do **not** run `stow utils` — this directory is internal and not meant to be deployed directly.

**3. Optional personal configs** (skip if you have your own terminal/shell setup)

```bash
stow nvim wezterm fish
```

**4. Set up QT theming**

- Open `qt6ct` and set the icon theme to `Tokyo Night-SE`
- For Dolphin to respect the theme, ensure this env var is set:

```bash
export QT_QPA_PLATFORMTHEME=qt6ct
```

Add this to your shell profile or Hyprland env config.

---

## 🎨 Customization

### Terminal & Shell

The rice is designed around WezTerm and Fish, but any terminal/shell will work. To match the aesthetic in another terminal, set:

- **Font**: (the font used in the wezterm config)
- **Background color**: `#000000`

### Colors / Theme

The color palette lives in `lua-shell/.config/lua-shell/`. Edit the color variables there to retheme the Quickshell bar and other Lua-driven components.

### Wallpaper

Wallpapers are managed by `pyprpaper`. Drop your wallpapers into the assets folder and configure `pyprpaper` to point to them.

---

## 📜 Credits & License

- **Kvantum Theme**: Modified from [Wings-Kvantum](https://github.com/L4ki/Wings-Plasma-Themes) by L4ki (GPLv3). The `window-normal` layers were removed from `Wings-Kvantum.svg` to enforce a pure `#000000` background. Modified assets in `Kvantum/` remain GPLv3.
- **Icons**: [Tokyo Night SE](https://github.com/ljmill/tokyo-night-icons/) by ljmill
- Everything else is licensed under the [MIT License](LICENSE).

---

<p align="center">Made with 🌕 by cyb3rkun</p>
