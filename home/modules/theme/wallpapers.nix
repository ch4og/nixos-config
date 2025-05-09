{pkgs, ...}: {
  main = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/zy/wallhaven-zywljw.png";
    hash = "sha256-G+QkfP5QFkLiEZf6yN22KDRJpQ+zhwNbwRfZioZGXOw=";
  };

  secondary = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/v9/wallhaven-v9ojz3.jpg";
    hash = "sha256-ggCu6MjqD3pnQX2y6hYScrWzjzmRhXAiG3JNHgjuLIk=";
  };

  third = pkgs.fetchurl {
    url = "https://w.wallhaven.cc/full/ex/wallhaven-expj3o.jpg";
    hash = "sha256-gjaSNpHQph1PugY0VywD/LrVYu0FUDz4+sdMnmiW/oQ=";
  };
}
