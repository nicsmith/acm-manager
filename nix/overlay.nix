final: prev: {
  devShell = final.callPackage ./dev.nix {};
  go = prev.go_1_26.overrideAttrs (old: {
    version = "1.26.3";
    src = final.fetchurl {
      url = "https://go.dev/dl/go1.26.3.src.tar.gz";
      hash = "sha256-HGRoddCqh5kTMYTtV895/yS97+jIggRwYCqdPW2Rkrg=";
    };
  });

  kubernetes-code-generator = prev.kubernetes-code-generator.overrideAttrs (old: rec {
    version = "0.36.1";
    src = prev.fetchFromGitHub {
      owner = "kubernetes";
      repo = "code-generator";
      tag = "v${version}";
      hash = "sha256-722zoY4tECQhANUbRf3XQUqDsbDmzWma87Pjeznf3e8=";
    };
    vendorHash = "sha256-zFtIcmC3h9R+X7W4a0w5AD/v2i3MgTR7ZrcmSOuO55g=";
  });

  kubernetes-controller-tools = prev.kubernetes-controller-tools.overrideAttrs (old: rec {
    version = "0.21.0";
    src = prev.fetchFromGitHub {
      owner = "kubernetes-sigs";
      repo = "controller-tools";
      tag = "v${version}";
      hash = "sha256-4IkVnD87/sHZKixDaF9Qz95cdChPfOkEowBQwu7kq9Y=";
    };
    vendorHash = "sha256-LNjd0PDVa4GMY1rFJ5PFiWAEeA5MMraIIzZmYgkdgJc=";
  });
}
