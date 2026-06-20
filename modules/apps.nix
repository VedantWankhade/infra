{pkgs,...} :{
    programs.wireshark = {
      enable = true;
      dumpcap.enable = true;
  };
  users.extraGroups.wireshark.members = [ "vedant" ];
    environment.systemPackages = with pkgs; [    
      wireshark
  ];

}