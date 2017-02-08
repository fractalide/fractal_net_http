{ edge, edges }:

edge {
  src = ./.;
  edges =  with edges; [];
  schema = with edges; ''
    struct NetHttpResponse {
      id @0 :UInt64;
      response @1 :Text;
      statusCode @2 :UInt32 = 200;
    }
  '';
}
