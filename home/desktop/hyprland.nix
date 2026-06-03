{pkgs, ...}: {
  programs.kitty.enable = true; # required for the default Hyprland config
  wayland.windowManager.hyprland.enable = true; # enable Hyprland

  # Optional, hint Electron apps to use Wayland:
      home.sessionVariables.NIXOS_OZONE_WL = "1";
     xdg.configFile."hypr/hyprland.lua".source = ../../dotfiles/config/hypr/hyprland.lua;
     xdg.configFile."hypr/hyprpaper.conf".source = ../../dotfiles/config/hypr/hyprpaper.conf;
home.file.".local/share/wallpapers/dystopia-yellow.jpg".source = ../../dotfiles/local/share/wallpapers/dystopia-yellow.jpg;
    services.hyprpolkitagent.enable = true;
    services.hyprpaper.enable = true;
    services.hyprlauncher.enable = true;
}
