{pkgs, ...}: 

{
  users.users.vedant = {
    isNormalUser = true;
    description = "Vedant";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
        # can add user level packages here or in home manager
    ];
  };   
}