{pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        kdePackages.dolphin
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
