{ }:
let
  nixpkgs = builtins.fetchTarball {
    url =
      "https://github.com/NixOS/nixpkgs/archive/c46b679be03303111d3b14d4e65495766c6b01e9.tar.gz";
    sha256 = "1ia0hn5mh0nbshq3hsza4qnqp0hl16p1gj2xaihcgy0pz28prwhk";
  };

  pkgs = import nixpkgs { };
in { cve-2021-3156 = pkgs.nixosTest ./cve/2021/3156.nix; }
