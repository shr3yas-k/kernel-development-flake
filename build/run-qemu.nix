{
  writeShellScriptBin,
}:
{
  kernel,
  initramfs,
  memory ? "1G",
}:
writeShellScriptBin "runvm" ''
  sudo qemu-system-x86_64 \
    -enable-kvm \
    -m ${memory} \
    -kernel ${kernel}/bzImage \
    -initrd ${initramfs}/initrd.gz \
    -nographic -append "console=ttyS0" \
    -s
''
