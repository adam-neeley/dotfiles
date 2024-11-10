let
  adam = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIIb8wD5wQcbtDiDF5iJl3p48NvAQQixtJw+8YK7C1VaV adam@iron";
in {
  "emacs.age".publicKeys = [ adam ];
}
