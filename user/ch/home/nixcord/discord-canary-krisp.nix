{pkgs, ...}: let
  patch-krisp =
    pkgs.writers.writePython3 "krisp-patcher"
    {
      libraries = with pkgs.python3Packages; [capstone pyelftools];
      flakeIgnore = [
        "E501"
        "F403"
        "F405"
      ];
    }
    (builtins.readFile ./krisp-patcher.py);
  binaryName = "DiscordCanary";
  node_module = "\\$HOME/.config/discordcanary/${pkgs.discord-canary.version}/modules/discord_krisp/discord_krisp.node";
in
  pkgs.discord-canary.overrideAttrs (previousAttrs: {
    postInstall =
      previousAttrs.postInstall
      + ''
        wrapProgramShell $out/opt/${binaryName}/${binaryName} \
        --run "${patch-krisp} ${node_module}"
      '';
    passthru = removeAttrs previousAttrs.passthru ["updateScript"];
    meta =
      {
        nyx.bypassLicense = true;
      }
      // previousAttrs.meta;
  })
