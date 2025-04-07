{
  description = ''
    alan-strohm's devShell for working on the golang s2 geometry library.

    I'm hoping I can avoid accidentally creating a pull request with this by:
    1) Adding it to a 'nix' branch.
    2) Rebasing any branches off 'nix' and back to 'master' before creating
    pull requests for them.

    If someone else is reading this, I probably failed. I'm sorry. :(
  '';

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "https://flakehub.com/f/NixOS/nixpkgs/*";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in
        {
          devShell = pkgs.mkShell {
            buildInputs = with pkgs; [
              go_1_22
              golangci-lint
            ];
          };
        }
      );
}
