{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixcord.homeManagerModules.nixcord
  ];
  programs.nixcord = {
    enable = true;
    discord = {
      package = pkgs.discord-krisp;
      vencord.enable = true;
      openASAR.enable = false;
    };
    vesktop = {
      enable = true;
    };
    config = {
      themeLinks = [
        "https://luckfire.github.io/amoled-cord/src/amoled-cord.css"
        "https://raw.githubusercontent.com/DiscordStyles/RadialStatus/deploy/RadialStatus.theme.css"
      ];
      plugins = {
        alwaysTrust.enable = true;
        callTimer.enable = false;
        clearURLs.enable = true;
        copyEmojiMarkdown.enable = true;
        disableCallIdle.enable = true;
        dontRoundMyTimestamps.enable = true;
        fakeNitro.enable = true;
        fixImagesQuality.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendsSince.enable = true;
        gameActivityToggle.enable = true;
        imageZoom.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        mutualGroupDMs.enable = true;
        noDevtoolsWarning.enable = true;
        noOnboardingDelay.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        openInApp.enable = true;
        pictureInPicture.enable = true;
        relationshipNotifier.enable = true;
        roleColorEverywhere.enable = true;
        serverInfo.enable = true;
        shikiCodeblocks.enable = true;
        showHiddenChannels.enable = true;
        spotifyCrack.enable = true;
        validUser.enable = true;
        voiceChatDoubleClick.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        spotifyControls = {
          enable = true;
          hoverControls = true;
        };
        USRBG = {
          enable = true;
          voiceBackground = false;
        };
      };
    };
  };
}
