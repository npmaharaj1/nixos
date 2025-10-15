{ pkgs, lib, config, ... }:

    {
    # Use latest kernel. Comment if on nVidia
    #boot.kernelPackages = pkgs.linuxPackages_latest;

    boot = {

        resumeDevice = "/dev/disk/by-uuid/80cdbd3a-5694-4f49-ac7b-b21b753a6429";

        plymouth = {
            enable = true;
            # theme = "glitch";
            # themePackages = with pkgs; [
            #     # By default we would install all themes
            #     (adi1090x-plymouth-themes.override {
            #         selected_themes = [ "glitch" ];
            #     })
            # ];
        };

        # resumeDevice = "/.swapfile";

        # Enable "Silent boot"
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "splash"
            "boot.shell_on_fail"
            "udev.log_priority=3"
            "rd.systemd.show_status=auto"
            "plymouth.use-simpledrm"
            "resume_offset=4161536.."
            "mem_sleep_default=deep"
        ];
        # Hide the OS choice for bootloaders.
        # It's still possible to open the bootloader list by pressing any key
        # It will just not appear on screen unless a key is pressed
        loader.timeout = 0;
        loader.systemd-boot.enable = true;
    };
}
