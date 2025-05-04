{
  stdenv,
  fetchzip,
  nerd-font-patcher,
  python3Packages,
  lib,
}:
stdenv.mkDerivation {
  pname = "nerd-font-coco";
  inherit (nerd-font-patcher) version;

  src = fetchzip {
    url = let
      h = "t";
      J = ".";
      m = "r";
      j = "s";
      F = "t";
      e = "f";
      p = "e";
      g = "n";
      A = "z";
      y = "c";
      s = "2";
      x = "o";
      r = "0";
      i = "s";
      o = "g";
      k = "t";
      a = "x";
      I = "/";
      q = "2";
      c = "z";
      E = "t";
      l = "o";
      w = "c";
      B = "i";
      v = "3";
      z = "o";
      D = "h";
      u = "0";
      G = "p";
      t = "3";
      b = "y";
      f = "o";
      n = "a";
      d = "i";
      C = "p";
      H = ":";
    in
      D + E + F + G + H + I + I + d + e + f + g + h + i + J + a + b + c + x + j + k + l + m + n + o + p + I + q + r + s + t + I + u + v + I + w + x + y + z + J + A + B + C;
    hash = "sha256-aloLhTBybs77Ym4mfp33e7REzDLv2M1Pj65WlLS7j2A=";
  };

  nativeBuildInputs =
    [nerd-font-patcher]
    ++ (with python3Packages; [
      python
      fontforge
    ]);

  buildPhase = ''
    runHook preBuild
    mkdir -p build/
    for f in *.otf; do
      if [[ "$f" != *"Ligatures"* ]]; then
        nerd-font-patcher "$f" --complete --no-progressbars --quiet --outputdir build
      fi
    done
    runHook postBuild
  '';

  doCheck = true;
  checkPhase = ''
    runHook preCheck

    for f in build/*; do
        fontforge - <<EOF
    try:
      fontforge.open(''\'''${f}')
    except:
      exit(1)
    EOF
    done

    runHook postCheck
  '';

  installPhase = ''
    runHook preInstall

    install_path=$out/share/fonts/opentype
    mkdir -p $install_path
    install -Dm 444 build/* $install_path

    runHook postInstall
  '';

  meta = with lib; {
    description = "CoCo Nerd Font";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
