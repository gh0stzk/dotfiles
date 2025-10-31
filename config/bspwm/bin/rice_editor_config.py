#!/usr/bin/env python3
import os
import re
import subprocess

class RiceEditorConfig:
    def __init__(self, theme):
        self.theme = theme
        self.config_file = os.path.expanduser(f'~/.config/bspwm/rices/{self.theme}/theme-config.bash')
        self.picom_config_file = os.path.expanduser('~/.config/bspwm/config/picom.conf')
        self.alacritty_config_file = os.path.expanduser('~/.config/alacritty/fonts.toml')
        self.kitty_config_file = os.path.expanduser('~/.config/kitty/kitty.conf')
        self.bspwm_config_file = os.path.expanduser('~/.config/bspwm/bspwmrc')
        self.zshrc_file = os.path.expanduser('~/.zshrc')

    def get_current_theme(self):
        rice_file = os.path.expanduser('~/.config/bspwm/.rice')
        try:
            with open(rice_file, 'r') as f:
                return f.read().strip()
        except FileNotFoundError:
            return "default"

    def read_variable(self, var_name, default_value):
        try:
            with open(self.config_file, 'r') as f:
                for line in f:
                    if f'{var_name}' in line :
                        match = re.search(rf'{var_name}\s*=\s*"([^"]+)"', line)
                        if match:
                            return match.group(1)
        except FileNotFoundError:
            raise FileNotFoundError(f"Configuration file not found: {self.config_file}")
        except Exception as e:
            raise Exception(f"Error reading variable {var_name}: {e}")
        return default_value

    def write_variable(self, var_name, value):
        try:
            with open(self.config_file, 'r') as f:
                content = f.readlines()

            for i, line in enumerate(content):
                if line.startswith(f'{var_name}=') :
                    content[i] = f'{var_name}="{value}"\n'
                    break

            with open(self.config_file, 'w') as f:
                f.writelines(content)
        except FileNotFoundError:
            raise FileNotFoundError(f"Configuration file not found: {self.config_file}")
        except Exception as e:
            raise Exception(f"Error writing variable {var_name}: {e}")

    def get_border_width(self):
        try:
            return int(self.read_variable('BORDER_WIDTH', 1))
        except (FileNotFoundError, ValueError, Exception) as e:
            print(f"Error getting border width: {e}")
            return 1

    def set_border_width(self, width):
        try:
            self.write_variable('BORDER_WIDTH', width)
            subprocess.run(['bspc', 'config', 'border_width', str(width)], check=True)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting border width: {e}")

    def get_border_color(self, color_var):
        try:
            return self.read_variable(color_var, '#000000')
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting border color {color_var}: {e}")
            return '#000000'

    def set_border_color(self, color_var, bspc_config_key, color):
        try:
            self.write_variable(color_var, color)
            subprocess.run(['bspc', 'config', bspc_config_key, color], check=True)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting border color {color_var}: {e}")

    def get_corner_radius(self):
        try:
            return int(self.read_variable('P_CORNER_R', 6))
        except (FileNotFoundError, ValueError, Exception) as e:
            print(f"Error getting corner radius: {e}")
            return 6

    def set_corner_radius(self, radius):
        try:
            self.write_variable('P_CORNER_R', radius)
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if 'corner-radius =' in line:
                    lines[i] = f'corner-radius = {radius}\n'
                    break
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting corner radius: {e}")

    def get_shadows_state(self):
        try:
            return self.read_variable('P_SHADOWS', 'false') == 'true'
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting shadows state: {e}")
            return False

    def set_shadows_state(self, state):
        try:
            self.write_variable('P_SHADOWS', 'true' if state else 'false')
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if '#-shadow-switch' in line:
                    match = re.match(r'(\s*)shadow\s*=\s*(true|false);(\s*)#-shadow-switch', line)
                    if match:
                        lines[i] = f'{match.group(1)}shadow = {'true' if state else 'false'};{match.group(3)}#-shadow-switch\n'
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting shadows state: {e}")

    def get_shadow_color(self):
        try:
            return self.read_variable('SHADOW_C', '#000000')
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting shadow color: {e}")
            return '#000000'

    def set_shadow_color(self, color):
        try:
            self.write_variable('SHADOW_C', color)
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('shadow-color =') :
                    lines[i] = f'shadow-color = "{color}";\n'
                    break
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting shadow color: {e}")

    def get_fading_state(self):
        try:
            return self.read_variable('P_FADE', 'false') == 'true'
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting fading state: {e}")
            return False

    def set_fading_state(self, state):
        try:
            self.write_variable('P_FADE', 'true' if state else 'false')
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if '#-fade-switch' in line:
                    match = re.match(r'(\s*)fade\s*=\s*(true|false);(\s*)#-fade-switch', line)
                    if match:
                        lines[i] = f'{match.group(1)}fade = {'true' if state else 'false'};{match.group(3)}#-fade-switch\n'
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting fading state: {e}")

    def get_blur_state(self):
        try:
            return self.read_variable('P_BLUR', 'false') == 'true'
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting blur state: {e}")
            return False

    def set_blur_state(self, state):
        try:
            self.write_variable('P_BLUR', 'true' if state else 'false')
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if '#-blur-switch' in line:
                    match = re.match(r'(\s*)blur-background\s*=\s*(true|false);(\s*)#-blur-switch', line)
                    if match:
                        lines[i] = f'{match.group(1)}blur-background = {'true' if state else 'false'};{match.group(3)}#-blur-switch\n'
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting blur state: {e}")

    def get_animations_state(self):
        try:
            return self.read_variable('P_ANIMATIONS', '#') == '@'
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting animations state: {e}")
            return False

    def set_animations_state(self, state):
        try:
            self.write_variable('P_ANIMATIONS', '@' if state else '#')
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if 'include "picom-animations.conf"' in line:
                    match = re.match(r'(\s*)([@#])include\s*"picom-animations\.conf"', line)
                    if match:
                        lines[i] = f'{match.group(1)}{"@" if state else "#"}include "picom-animations.conf"\n'
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting animations state: {e}")

    def get_terminal_opacity(self):
        try:
            return float(self.read_variable('P_TERM_OPACITY', 1.0))
        except (FileNotFoundError, ValueError, Exception) as e:
            print(f"Error getting terminal opacity: {e}")
            return 1.0

    def set_terminal_opacity(self, opacity):
        try:
            self.write_variable('P_TERM_OPACITY', opacity)
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if '#-term-opacity-switch' in line:
                    match = re.match(r'(\s*)opacity\s*=\s*[0-9.]+;(\s*)#-term-opacity-switch', line)
                    if match:
                        lines[i] = f'{match.group(1)}opacity = {opacity};{match.group(2)}#-term-opacity-switch\n'
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting terminal opacity: {e}")

    def get_font_size(self):
        try:
            return int(self.read_variable('term_font_size', 10))
        except (FileNotFoundError, ValueError, Exception) as e:
            print(f"Error getting font size: {e}")
            return 10

    def set_font_size(self, size):
        try:
            self.write_variable('term_font_size', size)
            with open(self.alacritty_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('size ='):
                    match = re.match(r'(\s*size\s*=\s*)(\d+)', line)
                    if match:
                        lines[i] = f'{match.group(1)}{size}\n'
                    break
            with open(self.alacritty_config_file, 'w') as f:
                f.writelines(lines)

            with open(self.kitty_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('font_size'):
                    match = re.match(r'(font_size\s+)(\d+)', line)
                    if match:
                        lines[i] = f'{match.group(1)}{size}\n'
                    break
            with open(self.kitty_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting font size: {e}")

    def get_font_name(self):
        try:
            return self.read_variable('term_font_name', 'monospace')
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting font name: {e}")
            return 'monospace'

    def set_font_name(self, name):
        try:
            self.write_variable('term_font_name', name)
            with open(self.alacritty_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('family ='):
                    match = re.match(r'(\s*family\s*=\s*)"([^"]+)"' , line)
                    if match:
                        lines[i] = f'{match.group(1)}"{name}"\n'
                    break
            with open(self.alacritty_config_file, 'w') as f:
                f.writelines(lines)

            with open(self.kitty_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('font_family'):
                    match = re.match(r'(font_family\s+)(.+)' , line)
                    if match:
                        lines[i] = f'{match.group(1)}{name}\n'
                    break
            with open(self.kitty_config_file, 'w') as f:
                f.writelines(lines)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting font name: {e}")

    def get_wall_engine(self):
        try:
            return self.read_variable('ENGINE', 'Theme')
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting wall engine: {e}")
            return 'Theme'

    def set_wall_engine(self, engine, value=None):
        try:
            self.write_variable('ENGINE', engine)
            if engine == "CustomDir":
                self.write_variable('CUSTOM_DIR', value)
            elif engine == "CustomImage":
                self.write_variable('CUSTOM_WALL', value)
            elif engine == "CustomAnimated":
                self.write_variable('CUSTOM_ANIMATED', value)

            command = ""
            if engine == "Theme":
                command = f'''
                pkill xwinwrap;
                [ -f /tmp/wall_refresh.pid ] && kill $(cat /tmp/wall_refresh.pid) 2>/dev/null;
                rm -f /tmp/wall_refresh.pid;
                feh -z --no-fehbg --bg-fill ~/.config/bspwm/rices/{self.theme}/walls
                '''
            elif engine == "CustomDir":
                command = f'''
                pkill xwinwrap;
                [ -f /tmp/wall_refresh.pid ] && kill $(cat /tmp/wall_refresh.pid) 2>/dev/null;
                rm -f /tmp/wall_refresh.pid;
                feh -z --no-fehbg --bg-fill "{value}"
                '''
            elif engine == "CustomImage":
                command = f'''
                pkill xwinwrap;
                [ -f /tmp/wall_refresh.pid ] && kill $(cat /tmp/wall_refresh.pid) 2>/dev/null;
                rm -f /tmp/wall_refresh.pid;
                feh --no-fehbg --bg-fill "{value}"
                '''
            elif engine == "CustomAnimated":
                command = f'''
                pkill xwinwrap;
                [ -f /tmp/wall_refresh.pid ] && kill $(cat /tmp/wall_refresh.pid) 2>/dev/null;
                rm -f /tmp/wall_refresh.pid;
                AnimatedWall --start "{value}"
                '''
            elif engine == "Slideshow":
                command = f'''
                pkill xwinwrap;
                [ -f /tmp/wall_refresh.pid ] && kill $(cat /tmp/wall_refresh.pid) 2>/dev/null;
                rm -f /tmp/wall_refresh.pid;
                bash -c '
                    while true; do
                        feh -z --no-fehbg --bg-fill ~/.config/bspwm/rices/{self.theme}/walls;
                        sleep 900
                    done & echo $! > /tmp/wall_refresh.pid
                '
                '''
            subprocess.run(command, shell=True)
        except (FileNotFoundError, Exception) as e:
            print(f"Error setting wall engine: {e}")

    def get_custom_dir(self):
        try:
            return self.read_variable("CUSTOM_DIR", "")
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting custom directory: {e}")
            return ""

    def get_custom_wall(self):
        try:
            return self.read_variable("CUSTOM_WALL", "")
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting custom wallpaper: {e}")
            return ""

    def get_custom_animated(self):
        try:
            return self.read_variable("CUSTOM_ANIMATED", "")
        except (FileNotFoundError, Exception) as e:
            print(f"Error getting custom animated wallpaper: {e}")
            return ""

    def get_picom_backend(self):
        try:
            with open(self.picom_config_file, 'r') as f:
                for line in f:
                    if line.strip().startswith('backend ='):
                        match = re.search(r'backend\s*=\s*"(\w+)"', line)
                        if match:
                            return match.group(1)
        except FileNotFoundError:
            pass
        return "xrender"

    def set_picom_backend(self, backend):
        try:
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('backend ='):
                    lines[i] = f'backend = "{backend}";\n'
                    break
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except FileNotFoundError:
            pass

    def get_vsync_state(self):
        try:
            with open(self.picom_config_file, 'r') as f:
                for line in f:
                    if line.strip().startswith('vsync ='):
                        match = re.search(r'vsync\s*=\s*(true|false);', line)
                        if match:
                            return match.group(1) == "true"
        except FileNotFoundError:
            pass
        return False

    def set_vsync_state(self, state):
        try:
            with open(self.picom_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('vsync ='):
                    lines[i] = f'vsync = {"true" if state else "false"};\n'
                    break
            with open(self.picom_config_file, 'w') as f:
                f.writelines(lines)
        except FileNotFoundError:
            pass

    def get_window_gap(self):
        try:
            with open(self.bspwm_config_file, 'r') as f:
                for line in f:
                    if line.strip().startswith('bspc config window_gap'):
                        match = re.search(r'bspc config window_gap (\d+)\s*', line)
                        if match:
                            return int(match.group(1))
        except FileNotFoundError:
            pass
        return 0

    def set_window_gap(self, gap):
        try:
            with open(self.bspwm_config_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if line.strip().startswith('bspc config window_gap'):
                    lines[i] = f'bspc config window_gap {gap}\n'
                    break
            with open(self.bspwm_config_file, 'w') as f:
                f.writelines(lines)
            subprocess.run(['bspc', 'config', 'window_gap', str(gap)], check=True)
        except FileNotFoundError:
            pass

    def get_pixel_art_state(self):
        try:
            with open(self.zshrc_file, 'r') as f:
                for line in f:
                    if "$HOME/.local/bin/colorscript -r" in line:
                        return not line.strip().startswith("#")
        except FileNotFoundError:
            pass
        return False

    def set_pixel_art_state(self, state):
        try:
            with open(self.zshrc_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if "$HOME/.local/bin/colorscript -r" in line:
                    if state:
                        lines[i] = line.lstrip("#")
                    else:
                        if not line.strip().startswith("#"):
                            lines[i] = f"#{line}"
                    break
            with open(self.zshrc_file, 'w') as f:
                f.writelines(lines)
        except FileNotFoundError:
            pass

    def get_fzf_tab_state(self):
        try:
            with open(self.zshrc_file, 'r') as f:
                for line in f:
                    if "disable-fzf-tab" in line:
                        return not line.strip().startswith("#")
        except FileNotFoundError:
            pass
        return False

    def set_fzf_tab_state(self, state):
        try:
            with open(self.zshrc_file, 'r') as f:
                lines = f.readlines()
            for i, line in enumerate(lines):
                if "disable-fzf-tab" in line:
                    if state:
                        lines[i] = line.lstrip("#")
                    else:
                        if not line.strip().startswith("#"):
                            lines[i] = f"#{line}"
                    break
            with open(self.zshrc_file, 'w') as f:
                f.writelines(lines)
        except FileNotFoundError:
            pass
