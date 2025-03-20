{ pkgs ? import <nixpkgs> {}, displayrUtils }:

pkgs.rPackages.buildRPackage {
  name = "RProtoBuf";
  version = displayrUtils.extractRVersion (builtins.readFile ./DESCRIPTION); 
  src = ./.;
  description = ''
    Protocol Buffers are a way of encoding structured data in an
    efficient yet extensible format. Google uses Protocol Buffers for almost all
    of its internal 'RPC' protocols and file formats.  Additional documentation
    is available in two included vignettes one of which corresponds to our 'JSS'
    paper (2016, <doi:10.18637/jss.v071.i02>. Either version 2 or 3 of the
    'Protocol Buffers' 'API' is supported.
  '';
  propagatedBuildInputs = with pkgs.rPackages; [ 
    RCurl
    Rcpp
  ];
}
