let adamIron = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJlJu6pRT8mhMXRupWAycW36bx9UGNHoctGr3wr0ogP2 adam@iron"; in {
  "gptel.age".publicKeys = [ adamIron ];
}
