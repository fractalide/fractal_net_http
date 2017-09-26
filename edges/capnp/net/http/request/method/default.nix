{ edge, edges }:

edge.capnp {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    enum NetHttpRequestMethod {
      get @0;
      patch @1;
      head @2;
      post @3;
      put @4;
      delete @5;
      connect @6;
      options @7;
      trace @8;
    }
  '';
}
