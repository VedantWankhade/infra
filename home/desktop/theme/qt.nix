# TO DO: THIS IS NOT WORKING

{ pkgs, ... }: {
  # Install the theme packages you want
  home.packages = with pkgs; [
    kdePackages.breeze # For Qt6/Plasma 6 applications
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
  ];

  # Control Qt application styling
  qt = {
    enable = true;
    platformTheme.name = "qt6ct";  # set QT_QPA_PLATFORMTHEME env var

    kvantum = {
      enable = true;
    };
  };

}