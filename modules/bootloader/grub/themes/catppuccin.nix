{pkgs, ...}: {
    boot.loader.grub.theme = pkgs.catppuccin-grub.override {
    flavor = "mocha";
  };

}