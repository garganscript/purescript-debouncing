{
  description = "purescript-debounce development environment";
  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";
  inputs.easy-ps = {
    url = "github:justinwoo/easy-purescript-nix";
  };

  outputs =
    { self
    , flake-utils
    , nixpkgs
    , easy-ps
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        easy-ps-pkgs = easy-ps.packages.${system};
      in
      {
        devShell = pkgs.mkShell {
          packages = with pkgs; [
            # See https://github.com/NixOS/nixpkgs/issues/59209.
            bashInteractive
          ];
          buildInputs = with pkgs; [
            bun
            nodejs
            easy-ps-pkgs.purs-0_15_15
          ];
        };
      }
    );
}
