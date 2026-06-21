{pkgs, inputs, ...}:
{
    home.packages = with pkgs; [
        kdePackages.dolphin
        kdePackages.ark
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}
