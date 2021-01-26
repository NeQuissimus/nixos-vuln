{ }:
self: super: {
  sudo = super.sudo.overrideAttrs (x: rec {
    version = "1.9.5p1";
    src = self.fetchurl {
      url = "https://www.sudo.ws/dist/sudo-${version}.tar.gz";
      sha256 = "10kqdfbfpf3vk5ihz5gwynv4pxdf1lg6ircrlanyygb549yg7pad";
    };
  });
}
