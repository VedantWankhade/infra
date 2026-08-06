{pkgs, ...}:
{
    home.packages = with pkgs; [
        bruno
        netcat-gnu
        python314Packages.jupyterlab
    ];

    programs.vscode = {
        enable = true;
    };
}
