{ ... }:

let
  common = {
    security.sudo = {
      enable = true;
      wheelNeedsPassword = false;
    };
    users.users.nequissimus = {
      extraGroups = [ "wheel" ];
      isNormalUser = true;
      name = "nequissimus";
    };
  };
in {
  name = "cve-2021-3156";

  nodes = {
    vulnerable = common // {
      nixpkgs.overlays = [ (import ./sudo-1.9.5p1.nix { }) ];
    };

    fixed = common;
  };

  testScript = ''
    start_all()

    assert "sudoedit:" in vulnerable.fail("su nequissimus -c 'sudoedit -s /' 2>&1")
    assert "usage:" in fixed.fail("su nequissimus -c 'sudoedit -s /' 2>&1")
  '';
}
