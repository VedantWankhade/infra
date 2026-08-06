{pkgs, ... }:
{
    home.packages = with pkgs; [
        go
        python314
    ];
}
