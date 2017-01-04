{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    @0xa8ac6fef929f35b5;

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
