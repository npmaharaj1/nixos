{ config, ... }:

{
    wayland.windowManager.sway = {
        enable = true;
        checkConfig = false;
        wrapperFeatures = {
            base = true;
            gtk = true;
        };
        config = {

            modifier = "Mod4";
            terminal = "alacritty"; 
            startup = [
                { command = "swaymsg workspace 1"; }
                { command = "brave"; }
                { command = "alacritty --class default_alacritty"; }
                { command = "obsidian"; }
                { command = "thunderbird"; }
                { command = "vesktop"; }
                { command = "bitwarden"; }
                { command = "openrgb --startminimized"; }
                { command = "gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"; }   # for GTK4 apps
                { command = "gsettings set org.gnome.desktop.interface gtk-theme 'adw-gtk3'"; }   # for GTK3 apps
                { command = "exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway"; }
            ];

            output = {
                eDP-1 = {
                    mode = "1920x1200@60Hz";
                };

                HDMI-A-1 = {
                    mode = "4096x2160@60Hz";
                };

                "*" = {
                    bg = "/home/nishant/Projects/nixos/modules/home/wallpaper/civic.jpg fill";
                };

            };

            # Assign workspace to output
            workspaceOutputAssign = [
                { workspace = "10"; output = "HDMI-A-1"; }
                { workspace = "10"; output = "eDP-1"; }
            ];

            # Automatic Workspace Assignments
            assigns = {
                "1" = [
                    { app_id = "default_alacritty"; }
                ];

                "2" = [
                    { app_id = "brave-browser"; }
                ];

                "3" = [
                    { app_id = "obsidian"; }
                ];

                "4" = [
                    { app_id = "thunderbird"; }
                ];

                "10" = [
                    { app_id = "vesktop"; }
                ];
            };

            keybindings = {
                "XF86AudioRaiseVolume" = "exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+";
                "XF86AudioLowerVolume" = "exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-";
                "XF86AudioMute" = "exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
                "XF86MonBrightnessUp" = "exec brightnessctl s +5%";
                "XF86MonBrightnessDown" = "exec brightnessctl s 5-%";

                # Key Shortcuts
                "${config.wayland.windowManager.sway.config.modifier}+Return" = "exec ${config.wayland.windowManager.sway.config.terminal}";
                "${config.wayland.windowManager.sway.config.modifier}+w" = "kill";
                "${config.wayland.windowManager.sway.config.modifier}+e" = "exec thunar";
                "${config.wayland.windowManager.sway.config.modifier}+d" = "exec wmenu-run";
                "${config.wayland.windowManager.sway.config.modifier}+f" = "fullscreen";
                "${config.wayland.windowManager.sway.config.modifier}+v" = "split vertical; layout splith";
                "${config.wayland.windowManager.sway.config.modifier}+Space" = "floating toggle";

                # Focus Window
                "${config.wayland.windowManager.sway.config.modifier}+h" = "focus left";
                "${config.wayland.windowManager.sway.config.modifier}+j" = "focus down";
                "${config.wayland.windowManager.sway.config.modifier}+k" = "focus up";
                "${config.wayland.windowManager.sway.config.modifier}+l" = "focus right";

                # Move Window
                "${config.wayland.windowManager.sway.config.modifier}+Mod1+h" = "move left";
                "${config.wayland.windowManager.sway.config.modifier}+Mod1+j" = "move down";
                "${config.wayland.windowManager.sway.config.modifier}+Mod1+k" = "move up";
                "${config.wayland.windowManager.sway.config.modifier}+Mod1+l" = "move right";

                # Focus Workspace
                "${config.wayland.windowManager.sway.config.modifier}+1" = "workspace number 1";
                "${config.wayland.windowManager.sway.config.modifier}+2" = "workspace number 2";
                "${config.wayland.windowManager.sway.config.modifier}+3" = "workspace number 3";
                "${config.wayland.windowManager.sway.config.modifier}+4" = "workspace number 4";
                "${config.wayland.windowManager.sway.config.modifier}+5" = "workspace number 5";
                "${config.wayland.windowManager.sway.config.modifier}+6" = "workspace number 6";
                "${config.wayland.windowManager.sway.config.modifier}+7" = "workspace number 7";
                "${config.wayland.windowManager.sway.config.modifier}+8" = "workspace number 8";
                "${config.wayland.windowManager.sway.config.modifier}+9" = "workspace number 9";
                "${config.wayland.windowManager.sway.config.modifier}+0" = "workspace number 10";

                # Move to Workspace
                "${config.wayland.windowManager.sway.config.modifier}+Shift+1" = "move container to workspace number 1; workspace 1";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+2" = "move container to workspace number 2; workspace 2";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+3" = "move container to workspace number 3; workspace 3";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+4" = "move container to workspace number 4; workspace 4";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+5" = "move container to workspace number 5; workspace 5";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+6" = "move container to workspace number 6; workspace 6";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+7" = "move container to workspace number 7; workspace 7";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+8" = "move container to workspace number 8; workspace 8";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+9" = "move container to workspace number 9; workspace 9";
                "${config.wayland.windowManager.sway.config.modifier}+Shift+0" = "move container to workspace number 10; workspace 10";
            };

            # Hide titlebar for each window
            window.titlebar = false;

            bars = [
                {
                    position = "bottom";
                    statusCommand = "/home/nishant/Projects/nixos/modules/home/swaywm/swaybar.sh";
                    fonts = {
                        names = [ "JetBrainsMonoNL Nerd Font Mono" ];
                        style = "Regular";
                    };
                    colors = {
                        background = "000000";
                        statusline = "ffffff";

                        focusedWorkspace = {
                            border = "#4c7899";
                            background = "#285577";
                            text = "#ffffff";
                        };

                        activeWorkspace = {
                            border = "#333333";
                            background = "#5f676a";
                            text = "#ffffff";
                        };

                        inactiveWorkspace = {
                            border = "#333333";
                            background = "#222222";
                            text = "#888888";
                        };

                        urgentWorkspace = {
                            border = "#333333";
                            background = "#222222";
                            text = "#888888";
                        };
                    };
                }
            ];

            # Mouse settings
            focus.followMouse = true;
            floating.modifier = "${config.wayland.windowManager.sway.config.modifier}";
            seat = {
                "seat0" = {
                    hide_cursor = "1000";
                };
            };
            input = {
                "1739:52981:SYNA2BA6:00_06CB:CEF5_Touchpad" = {
                    accel_profile = "flat";
                    click_method = "clickfinger";
                    clickfinger_button_map = "lrm";
                    drag = "enabled";
                    drag_lock = "enabled";
                    dwt = "enabled";
                    dwtp = "enabled";
                    middle_emulation = "disabled";
                    natural_scroll = "enabled";
                    tap = "enabled";
                    tap_button_map = "lrm";
                };
            };

        };
    };
}
