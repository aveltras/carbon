{ haskellNix ? import (builtins.fetchTarball "https://github.com/input-output-hk/haskell.nix/archive/2e38dc1cd7ffc1e473e95e998c22ff031ea93f79.tar.gz") {}
, nixpkgsSrc ? haskellNix.sources.nixpkgs-2009
, nixpkgsArgs ? haskellNix.nixpkgsArgs
, pkgs ? import nixpkgsSrc nixpkgsArgs
}:

(pkgs.haskell-nix.project {
  compiler-nix-name = "ghc8103";
  # index-state = "2021-01-19T00:00:00Z";
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "carbon";
    src = ./.;
  };
}).shellFor {
  packages = ps: with ps; [
    carbon-blaze-html
    carbon-lucid
    carbon-svg
    carbon-tools
    examples
  ];
  
  withHoogle = false;
  exactDeps = true;

  tools = {
    cabal-install = "latest";
    haskell-language-server = "latest";
    ghcid = "latest";
  };

  buildInputs = with pkgs; [
    nodejs
  ];
}
