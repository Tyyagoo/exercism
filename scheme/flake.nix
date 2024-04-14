{
  description = "λ";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      overlays = [ ];
      allSystems = [ "x86_64-linux" ];
      forAllSystems = f: nixpkgs.lib.genAttrs allSystems (system: f {
        pkgs = import nixpkgs { inherit system overlays; };
      });
      runPkg = pkgs: pkg: "${pkgs.${pkg}}/bin/${pkg}";
    in {
      devShells = forAllSystems ({ pkgs }: with pkgs; {
        default = mkShell {
          name = "scheme";
          packages =  [chez];
        };
      });
  };
}
