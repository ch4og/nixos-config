{
  config,
  pkgs,
  ...
}: {
  systemd.services.libvirtd.path = let
    env = pkgs.buildEnv {
      name = "qemu-hook-env";
      paths = with pkgs; [
        bash
        libvirt
        kmod
        systemd
        ripgrep
        sd
        libhugetlbfs
        findutils
        procps
      ];
    };
  in [env];

  system.activationScripts.generate-ssdt.text = "echo 'U1NEVKEAAAAB9EJPQ0hTAEJYUENTU0RUAQAAAElOVEwYEBkgoA8AFVwuX1NCX1BDSTAGABBMBi5f
U0JfUENJMFuCTwVCQVQwCF9ISUQMQdAMCghfVUlEABQJX1NUQQCkCh8UK19CSUYApBIjDQELcBcL
cBcBC9A5C1gCCywBCjwKPA0ADQANTElPTgANABQSX0JTVACkEgoEAAALcBcL0Dk=' | ${pkgs.coreutils}/bin/base64 -d > /etc/libvirt/SSDT1.dat";
  system.activationScripts.libvirtd-hook.text = "ln -sf /etc/libvirt/hooks/qemu /var/lib/libvirt/hooks";

  system.activationScripts.define-vm.text = "${pkgs.libvirt}/bin/virsh define ${./windows-gpu.xml}";

  environment.systemPackages = with pkgs; [
    libhugetlbfs
    virt-manager
    dconf
    libguestfs
  ];
  environment.etc = {
    "libvirt/virtio-win.iso".source = pkgs.virtio-win.src;
    "libvirt/hooks/qemu".source = ./qemu;
    "libvirt/hooks/qemu.d/windows-gpu/prepare/begin/start.sh".source = ./start.sh;
    "libvirt/hooks/qemu.d/windows-gpu/release/end/stop.sh".source = ./stop.sh;
  };
}
