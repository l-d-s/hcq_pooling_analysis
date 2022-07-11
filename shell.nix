{ pkgs ? import
#      <nixos> {}
#    Not sure if this is quite the right version, but I think it should be OK:
     (builtins.fetchTarball {
         url = "https://github.com/NixOS/nixpkgs/archive/c9a97ff47bb0db44f4a504015a5d1cedb3094c85.tar.gz";
         sha256 = "1za6cm5krllx9cfd09zmfvki82ybfwnbn1hwda1vdnklgg0wdkfk";
         }) {}
}:

    let
    
    includedPackages = with pkgs.rPackages; [
                tidyverse
                devtools
                here

                languageserver # for vscode

                cowplot
                lemon
                svglite
                ggbeeswarm
                ggrepel
                patchwork
                
                haven # for reading Stata files
                table1
                naniar # missing data
                kableExtra

                gt # colored tables

                mice

                rms # for alternative spline parametrization

                brms
                tidybayes
                bayesplot
                
                beepr

                meta # Begg and Egger tests
                ];
    
    RstudioWithPackages =
        pkgs.rstudioWrapper.override{
            packages = includedPackages;
        };
        
    RWithPackages =
        pkgs.rWrapper.override{
            packages = includedPackages;
        };
    in

    pkgs.runCommand "matching_figure" {
        buildInputs = with pkgs; [
            RstudioWithPackages 
            RWithPackages
            # libintl 
            # libiconv
            pandoc
            cmdstan # command-line interface to Stan
            libnotify
            ];
        shellHook = ''
            mkdir -p "$(pwd)/_libs"
            export R_LIBS_USER="$(pwd)/_libs"
            export CMDSTAN="$(dirname "$(dirname `which stan`)")"/opt/cmdstan
            '';
        } 
        # Is there any easy way to import the script?
        ''
        mkdir $out
        Rscript --vanilla ./matching_misspecification_plots.R $out
        ''
