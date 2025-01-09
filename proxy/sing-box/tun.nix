[
  {
    type = "tun";
    tag = "tun-in";
    interface_name = "sing0";
    address = ["172.19.0.1/28"];
    mtu = 9000;
    auto_route = true;
    strict_route = false;
    stack = "gvisor";
    endpoint_independent_nat = true;
    sniff = true;
    sniff_override_destination = true;
  }
]
