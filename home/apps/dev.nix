{pkgs, ...}:
{
    home.packages = with pkgs; [
        bruno
        netcat-gnu
    ];

    programs.vscode = {
        enable = true;
    };
}
