{
    description            = "frege-data-science-dev-shell";
    inputs.flake-utils.url = "github:numtide/flake-utils";
    inputs.nixpkgs.url     = "github:NixOS/nixpkgs/release-22.05";

    outputs = 
    {
        self,
        nixpkgs,
        flake-utils 
    }:
    flake-utils.lib.eachSystem
    [
        "x86_64-darwin" 
        "aarch64-darwin" 
        "x86_64-linux" 
    ]
    (system:
        let pkgs = import nixpkgs { inherit system; };
    in
    {
        devShell = pkgs.mkShell
        {
            buildInputs =
            [
                (pkgs.openjdk11.override { enableJavaFX = true; })
            ];

            FREGE_LS_EXTRA_CLASSPATH = "/Users/tricktron/.m2/repository/org/frege-lang/fregefx/0.8.2-SNAPSHOT/fregefx-0.8.2-SNAPSHOT.jar";
        };
    });
}
