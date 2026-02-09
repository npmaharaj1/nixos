{ pkgs, lib, config, ... }:

    {
    # Use latest kernel. Comment if on nVidia
    #boot.kernelPackages = pkgs.linuxPackages_latest;

    boot = {

        plymouth = {
            enable = true;
        };

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
