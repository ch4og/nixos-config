{creds, ...}: {
  servers = [
    {
      tag = "nextdns-direct";
      address = "45.90.28.29";
      detour = "vless-out";
    }
    {
      tag = "nextdns";
      address = "https://dns.nextdns.io/${creds.nextdns}";
      address_resolver = "nextdns-direct";
      address_strategy = "ipv4_only";
      detour = "vless-out";
    }
    {
      tag = "block";
      address = "rcode://success";
    }
  ];
  final = "nextdns";
  strategy = "ipv4_only";
  disable_cache = true;
  disable_expire = false;
}
