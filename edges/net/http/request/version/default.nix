{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    struct NetHttpRequestVersion {
      main @0 :UInt8;
      sub @1 :UInt8;
    }
  '';
}
