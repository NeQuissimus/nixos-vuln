{ }:
let
  loadNixpkgs = import ./common/load_nixpkgs.nix;

  nixpkgs_latest = {
    commit = "c46b679be03303111d3b14d4e65495766c6b01e9";
    sha256 = "1ia0hn5mh0nbshq3hsza4qnqp0hl16p1gj2xaihcgy0pz28prwhk";
  };

  pkgs = loadNixpkgs nixpkgs_latest.commit nixpkgs_latest.sha256;
in with pkgs; {
  cve-2021-3156 = nixosTest ./cve/2021/3156.nix;
}
