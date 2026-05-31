{config, sops, ...} :
{

  services.syncthing = {
    enable = true;
    overrideDevices = true; # set to false if want to persist the devices added via webgui
    settings = {
      devices = {
        homelab = {
          addresses = [
            "dynamic"
          ];
            # id = "$(cat ${config.sops.secrets.homelab_device_id.path})";
            id = "E7ZTTEN-OE4ESBS-XIUWAQ5-LHFR33Q-EYEVBKC-5USEYFX-QNIGNPW-XPLFHA2";
          };
        };
      folders = {
        "/home/vedant/Notes" = {
          devices = [
            "homelab"
          ];
          id = "hp9uq-dawgd";
        };
        "/home/vedant/Notes Archive" = {
          devices = [
            "homelab"
          ];
          id = "ixebz-fubup";
        };
      };
    };
  };
}