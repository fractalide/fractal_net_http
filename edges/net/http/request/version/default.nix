{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    @0xf220a4a15c2c5e34;

    struct NetHttpRequestVersion {
      main @0 :UInt8;
      sub @1 :UInt8;
    }
  '';
}
