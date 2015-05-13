{ stdenv, fetchgit, liblo, git, python, pkgconfig, x11, cairo, libjpeg}:

stdenv.mkDerivation rec {
  name = "ntk-1.3.0";
  src = fetchgit {
    url = "git://git.tuxfamily.org/gitroot/non/non.git";
    rev = "18a299cac788ce148d5b6d3f7d34f53ba4d91229";
    sha256 = "0g04majw49cymdxwz9qbak3g75q1m6fqb94b1fghqfgzxi949677";
  };

  buildInputs = 
    [ liblo git python pkgconfig x11 cairo libjpeg ];

#  unpackPhase = "git submodule update --init";

  configurePhase = ''
    cd lib/ntk
    python waf configure --prefix=$out
  '';

  buildPhase = "python waf";

  installPhase = "python waf install";

  meta = with stdenv.lib; {
    description = "FLTK fork designed to provide features for the non family of audio tools.";
    homepage = http://non.tuxfamily.org/;
    license = licenses.gpl2;
    platforms = platforms.linux;
    #maintainers = [ maintainers.goibhniu ];
  };
}
