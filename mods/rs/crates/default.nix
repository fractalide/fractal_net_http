{ buildRustCode, fetchzip, release, verbose }:
let
    aho_corasick_0_6_3_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "aho-corasick";
      version = "0.6.3";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/aho-corasick/0.6.3/download";
        sha256 = "1cpqzf6acj8lm06z3f1cg41wn6c2n9l3v49nh0dvimv4055qib6k";
        name = "aho-corasick-0.6.3.tar.gz";
      };
      libName = "aho_corasick";
      crateBin = [ {  name = "aho-corasick-dot"; } ];
      inherit dependencies features release verbose;
    };
    all_crates_1_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "all_crates";
      version = "1.1.1";
      fractalType = "crate";
      src = ./.;
      inherit dependencies features release verbose;
    };
    ascii_0_7_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "ascii";
      version = "0.7.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/ascii/0.7.1/download";
        sha256 = "0fy9rh316vcc4v0k8d1p2gi3a3wpiwj5bm2mw0yqzs8xvz6yd1ax";
        name = "ascii-0.7.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    bitflags_0_7_0_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "bitflags";
      version = "0.7.0";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/bitflags/0.7.0/download";
        sha256 = "1hr72xg5slm0z4pxs2hiy4wcyx3jva70h58b7mid8l0a4c8f7gn5";
        name = "bitflags-0.7.0.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    chrono_0_2_25_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "chrono";
      version = "0.2.25";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/chrono/0.2.25/download";
        sha256 = "0gsvqk8cnmm43qj3xyngqvfqh50cbdbqas7ik0wjgnvknirmmca7";
        name = "chrono-0.2.25.tar.gz";
      };
      libName = "chrono";
      inherit dependencies features release verbose;
    };
    chunked_transfer_0_3_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "chunked_transfer";
      version = "0.3.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/chunked_transfer/0.3.1/download";
        sha256 = "0bgk8axxlaawwqapm52r12lqiqj97qdl2wjn78w7x7x6lm76si3j";
        name = "chunked_transfer-0.3.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    conv_0_3_3_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "conv";
      version = "0.3.3";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/conv/0.3.3/download";
        sha256 = "08rl72k1a48xah0ar5l9v1bw19pp8jdw2pdkd3vvj9ijsyyg9yik";
        name = "conv-0.3.3.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    custom_derive_0_1_7_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "custom_derive";
      version = "0.1.7";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/custom_derive/0.1.7/download";
        sha256 = "160q3pzri2fgrr6czfdkwy1sbddki2za96r7ivvyii52qp1523zs";
        name = "custom_derive-0.1.7.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    encoding_0_2_33_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding";
      version = "0.2.33";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding/0.2.33/download";
        sha256 = "16ls6avhv5ll28zajl5q1jbiz1g80c4ygnw13zzqmij14wsp5329";
        name = "encoding-0.2.33.tar.gz";
      };
      libName = "encoding";
      inherit dependencies features release verbose;
    };
    encoding_index_japanese_1_20141219_5_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding-index-japanese";
      version = "1.20141219.5";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding-index-japanese/1.20141219.5/download";
        sha256 = "1pmfaabps0x6v6cd4fbk9ssykhkmc799dma2y78fhk7gvyr5gyl4";
        name = "encoding-index-japanese-1.20141219.5.tar.gz";
      };
      libPath = "lib.rs";
      libName = "encoding_index_japanese";
      inherit dependencies features release verbose;
    };
    encoding_index_korean_1_20141219_5_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding-index-korean";
      version = "1.20141219.5";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding-index-korean/1.20141219.5/download";
        sha256 = "1b756n7gcilkx07y7zjrikcg0b8v8yd6mw8w01ji8sp3k1cabcf2";
        name = "encoding-index-korean-1.20141219.5.tar.gz";
      };
      libPath = "lib.rs";
      libName = "encoding_index_korean";
      inherit dependencies features release verbose;
    };
    encoding_index_simpchinese_1_20141219_5_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding-index-simpchinese";
      version = "1.20141219.5";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding-index-simpchinese/1.20141219.5/download";
        sha256 = "0rb4xd8cqymhqffqqxdk18mf9n354vs50ar66jrysb1z6ymcvvpy";
        name = "encoding-index-simpchinese-1.20141219.5.tar.gz";
      };
      libPath = "lib.rs";
      libName = "encoding_index_simpchinese";
      inherit dependencies features release verbose;
    };
    encoding_index_singlebyte_1_20141219_5_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding-index-singlebyte";
      version = "1.20141219.5";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding-index-singlebyte/1.20141219.5/download";
        sha256 = "07df3jrfwfmzi2s352lvcpvy5dqpy2s45d2xx2dz1x7zh3q5284d";
        name = "encoding-index-singlebyte-1.20141219.5.tar.gz";
      };
      libPath = "lib.rs";
      libName = "encoding_index_singlebyte";
      inherit dependencies features release verbose;
    };
    encoding_index_tradchinese_1_20141219_5_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding-index-tradchinese";
      version = "1.20141219.5";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding-index-tradchinese/1.20141219.5/download";
        sha256 = "0lb12nbv29cy41gx26yz3v4kfi8h1xbn1ppja8szgqi2zm1wlywn";
        name = "encoding-index-tradchinese-1.20141219.5.tar.gz";
      };
      libPath = "lib.rs";
      libName = "encoding_index_tradchinese";
      inherit dependencies features release verbose;
    };
    encoding_index_tests_0_1_4_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "encoding_index_tests";
      version = "0.1.4";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/encoding_index_tests/0.1.4/download";
        sha256 = "0z09kwh4z76q00cfr081rgjbnai4s2maq2vk88lgrq9d6bkf93f6";
        name = "encoding_index_tests-0.1.4.tar.gz";
      };
      libPath = "index_tests.rs";
      libName = "encoding_index_tests";
      inherit dependencies features release verbose;
    };
    kernel32_sys_0_2_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "kernel32-sys";
      version = "0.2.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/kernel32-sys/0.2.2/download";
        sha256 = "1lrw1hbinyvr6cp28g60z97w32w8vsk6pahk64pmrv2fmby8srfj";
        name = "kernel32-sys-0.2.2.tar.gz";
      };
      libName = "kernel32";
      build = "build.rs";
      buildDependencies = [ winapi_build_0_1_1_ ];      inherit dependencies features release verbose;
    };
    lazy_static_0_2_8_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "lazy_static";
      version = "0.2.8";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/lazy_static/0.2.8/download";
        sha256 = "1xbpxx7cd5kl60g87g43q80jxyrsildhxfjc42jb1x4jncknpwbl";
        name = "lazy_static-0.2.8.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    libc_0_2_30_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "libc";
      version = "0.2.30";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/libc/0.2.30/download";
        sha256 = "1c4gi6r5gbpbw3dmryc98x059awl4003cfz5kd6lqm03gp62wlkw";
        name = "libc-0.2.30.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    log_0_3_8_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "log";
      version = "0.3.8";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/log/0.3.8/download";
        sha256 = "1c43z4z85sxrsgir4s1hi84558ab5ic7jrn5qgmsiqcv90vvn006";
        name = "log-0.3.8.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    magenta_0_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "magenta";
      version = "0.1.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/magenta/0.1.1/download";
        sha256 = "1s4l6lf2r1rhxii2y2mjpc2p0zydpfmi6rs0w30j4l01w85bx1vv";
        name = "magenta-0.1.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    magenta_sys_0_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "magenta-sys";
      version = "0.1.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/magenta-sys/0.1.1/download";
        sha256 = "19r43rcl6dmafrzfn0d8vl11dzsvls3jhd9346c78k0zjslpr4r4";
        name = "magenta-sys-0.1.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    matches_0_1_6_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "matches";
      version = "0.1.6";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/matches/0.1.6/download";
        sha256 = "1zlrqlbvzxdil8z8ial2ihvxjwvlvg3g8dr0lcdpsjclkclasjan";
        name = "matches-0.1.6.tar.gz";
      };
      libPath = "lib.rs";
      libName = "matches";
      inherit dependencies features release verbose;
    };
    memchr_1_0_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "memchr";
      version = "1.0.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/memchr/1.0.1/download";
        sha256 = "071m5y0zm9p1k7pzqm20f44ixvmycf71xsrpayqaypxrjwchnkxm";
        name = "memchr-1.0.1.tar.gz";
      };
      libName = "memchr";
      inherit dependencies features release verbose;
    };
    num_0_1_40_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "num";
      version = "0.1.40";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/num/0.1.40/download";
        sha256 = "0b29c25n9mpf6a921khj7a6y3hz5va4vgwppcd2if975qq1shakg";
        name = "num-0.1.40.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    num_integer_0_1_35_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "num-integer";
      version = "0.1.35";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/num-integer/0.1.35/download";
        sha256 = "0xybj8isi9b6wc646d5rc043i8l8j6wy0vrl4pn995qms9fxbbcc";
        name = "num-integer-0.1.35.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    num_iter_0_1_34_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "num-iter";
      version = "0.1.34";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/num-iter/0.1.34/download";
        sha256 = "02cld7x9dzbqbs6sxxzq1i22z3awlcd6ljkgvhkfr9rsnaxphzl9";
        name = "num-iter-0.1.34.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    num_traits_0_1_40_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "num-traits";
      version = "0.1.40";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/num-traits/0.1.40/download";
        sha256 = "1fr8ghp4i97q3agki54i0hpmqxv3s65i2mqd1pinc7w7arc3fplw";
        name = "num-traits-0.1.40.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    rand_0_3_16_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "rand";
      version = "0.3.16";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/rand/0.3.16/download";
        sha256 = "1sxwqaqr5kmmhh6qzanz1mmg10gr952mbi1kvzbp3krqhvnnsi0n";
        name = "rand-0.3.16.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    redox_syscall_0_1_31_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "redox_syscall";
      version = "0.1.31";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/redox_syscall/0.1.31/download";
        sha256 = "0kipd9qslzin4fgj4jrxv6yz5l3l71gnbd7fq1jhk2j7f2sq33j4";
        name = "redox_syscall-0.1.31.tar.gz";
      };
      libName = "syscall";
      inherit dependencies features release verbose;
    };
    regex_0_2_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "regex";
      version = "0.2.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/regex/0.2.2/download";
        sha256 = "1f1zrrynfylg0vcfyfp60bybq4rp5g1yk2k7lc7fyz7mmc7k2qr7";
        name = "regex-0.2.2.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    regex_syntax_0_4_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "regex-syntax";
      version = "0.4.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/regex-syntax/0.4.1/download";
        sha256 = "01yrsm68lj86ad1whgg1z95c2pfsvv58fz8qjcgw7mlszc0c08ls";
        name = "regex-syntax-0.4.1.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    rustc_serialize_0_3_24_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "rustc-serialize";
      version = "0.3.24";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/rustc-serialize/0.3.24/download";
        sha256 = "0rfk6p66mqkd3g36l0ddlv2rvnp1mp3lrq5frq9zz5cbnz5pmmxn";
        name = "rustc-serialize-0.3.24.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    thread_local_0_3_4_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "thread_local";
      version = "0.3.4";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/thread_local/0.3.4/download";
        sha256 = "1y6cwyhhx2nkz4b3dziwhqdvgq830z8wjp32b40pjd8r0hxqv2jr";
        name = "thread_local-0.3.4.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    time_0_1_38_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "time";
      version = "0.1.38";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/time/0.1.38/download";
        sha256 = "1ws283vvz7c6jfiwn53rmc6kybapr4pjaahfxxrz232b0qzw7gcp";
        name = "time-0.1.38.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    tiny_http_0_5_8_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "tiny_http";
      version = "0.5.8";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/tiny_http/0.5.8/download";
        sha256 = "054mgyxqrby7a73hv6cs5svpz67nfqy5ssr4zazgadc3h6phpb6m";
        name = "tiny_http-0.5.8.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    unreachable_1_0_0_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "unreachable";
      version = "1.0.0";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/unreachable/1.0.0/download";
        sha256 = "1am8czbk5wwr25gbp2zr007744fxjshhdqjz9liz7wl4pnv3whcf";
        name = "unreachable-1.0.0.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    url_0_2_38_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "url";
      version = "0.2.38";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/url/0.2.38/download";
        sha256 = "0yl7846as9amypyriiappic347fqf39vilsdwzvrvcp2p4mfnzyj";
        name = "url-0.2.38.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    utf8_ranges_1_0_0_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "utf8-ranges";
      version = "1.0.0";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/utf8-ranges/1.0.0/download";
        sha256 = "0rzmqprwjv9yp1n0qqgahgm24872x6c0xddfym5pfndy7a36vkn0";
        name = "utf8-ranges-1.0.0.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    uuid_0_1_18_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "uuid";
      version = "0.1.18";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/uuid/0.1.18/download";
        sha256 = "0jqkbhasrych5g3wqh5cmpym40562dvf4fwsz1a7ksa67ypz2szq";
        name = "uuid-0.1.18.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    void_1_0_2_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "void";
      version = "1.0.2";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/void/1.0.2/download";
        sha256 = "0h1dm0dx8dhf56a83k68mijyxigqhizpskwxfdrs1drwv2cdclv3";
        name = "void-1.0.2.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    winapi_0_2_8_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "winapi";
      version = "0.2.8";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/winapi/0.2.8/download";
        sha256 = "0a45b58ywf12vb7gvj6h3j264nydynmzyqz8d8rqxsj6icqv82as";
        name = "winapi-0.2.8.tar.gz";
      };
      inherit dependencies features release verbose;
    };
    winapi_build_0_1_1_ = { dependencies?[], features?[] }: buildRustCode {
      crateName = "winapi-build";
      version = "0.1.1";
      fractalType = "crate";
      src = fetchzip {
        url = "https://crates.io/api/v1/crates/winapi-build/0.1.1/download";
        sha256 = "1lxlpi87rkhxcwp2ykf1ldw3p108hwm24nywf3jfrvmff4rjhqga";
        name = "winapi-build-0.1.1.tar.gz";
      };
      libName = "build";
      inherit dependencies features release verbose;
    };

in
rec {
  aho_corasick_0_6_3 = aho_corasick_0_6_3_ {
    dependencies = [ memchr_1_0_1 ];
  };
  all_crates_1_1_1 = all_crates_1_1_1_ {
    dependencies = [ regex_0_2_2 tiny_http_0_5_8 ];
  };
  ascii_0_7_1 = ascii_0_7_1_ {};
  bitflags_0_7_0 = bitflags_0_7_0_ {};
  chrono_0_2_25 = chrono_0_2_25_ {
    dependencies = [ num_0_1_40 time_0_1_38 ];
  };
  chunked_transfer_0_3_1 = chunked_transfer_0_3_1_ {};
  conv_0_3_3 = conv_0_3_3_ {
    dependencies = [ custom_derive_0_1_7 ];
  };
  custom_derive_0_1_7 = custom_derive_0_1_7_ {
    features = [ "std" ];
  };
  encoding_0_2_33 = encoding_0_2_33_ {
    dependencies = [ encoding_index_japanese_1_20141219_5 encoding_index_korean_1_20141219_5 encoding_index_simpchinese_1_20141219_5 encoding_index_singlebyte_1_20141219_5 encoding_index_tradchinese_1_20141219_5 ];
  };
  encoding_index_japanese_1_20141219_5 = encoding_index_japanese_1_20141219_5_ {
    dependencies = [ encoding_index_tests_0_1_4 ];
  };
  encoding_index_korean_1_20141219_5 = encoding_index_korean_1_20141219_5_ {
    dependencies = [ encoding_index_tests_0_1_4 ];
  };
  encoding_index_simpchinese_1_20141219_5 = encoding_index_simpchinese_1_20141219_5_ {
    dependencies = [ encoding_index_tests_0_1_4 ];
  };
  encoding_index_singlebyte_1_20141219_5 = encoding_index_singlebyte_1_20141219_5_ {
    dependencies = [ encoding_index_tests_0_1_4 ];
  };
  encoding_index_tradchinese_1_20141219_5 = encoding_index_tradchinese_1_20141219_5_ {
    dependencies = [ encoding_index_tests_0_1_4 ];
  };
  encoding_index_tests_0_1_4 = encoding_index_tests_0_1_4_ {};
  kernel32_sys_0_2_2 = kernel32_sys_0_2_2_ {
    dependencies = [ winapi_0_2_8 winapi_build_0_1_1 ];
  };
  lazy_static_0_2_8 = lazy_static_0_2_8_ {};
  libc_0_2_30 = libc_0_2_30_ {
    features = [ "use_std" ];
  };
  log_0_3_8 = log_0_3_8_ {
    features = [ "use_std" ];
  };
  magenta_0_1_1 = magenta_0_1_1_ {
    dependencies = [ conv_0_3_3 magenta_sys_0_1_1 ];
  };
  magenta_sys_0_1_1 = magenta_sys_0_1_1_ {
    dependencies = [ bitflags_0_7_0 ];
  };
  matches_0_1_6 = matches_0_1_6_ {};
  memchr_1_0_1 = memchr_1_0_1_ {
    dependencies = [ libc_0_2_30 ];
    features = [ "use_std" ];
  };
  num_0_1_40 = num_0_1_40_ {
    dependencies = [ num_integer_0_1_35 num_iter_0_1_34 num_traits_0_1_40 ];
    features = [ "bigint" "complex" "rational" "rustc-serialize" ];
  };
  num_integer_0_1_35 = num_integer_0_1_35_ {
    dependencies = [ num_traits_0_1_40 ];
  };
  num_iter_0_1_34 = num_iter_0_1_34_ {
    dependencies = [ num_integer_0_1_35 num_traits_0_1_40 ];
  };
  num_traits_0_1_40 = num_traits_0_1_40_ {};
  rand_0_3_16 = rand_0_3_16_ {
    dependencies = [ libc_0_2_30 magenta_0_1_1 ];
  };
  redox_syscall_0_1_31 = redox_syscall_0_1_31_ {};
  regex_0_2_2 = regex_0_2_2_ {
    dependencies = [ aho_corasick_0_6_3 memchr_1_0_1 regex_syntax_0_4_1 thread_local_0_3_4 utf8_ranges_1_0_0 ];
  };
  regex_syntax_0_4_1 = regex_syntax_0_4_1_ {};
  rustc_serialize_0_3_24 = rustc_serialize_0_3_24_ {};
  thread_local_0_3_4 = thread_local_0_3_4_ {
    dependencies = [ lazy_static_0_2_8 unreachable_1_0_0 ];
  };
  time_0_1_38 = time_0_1_38_ {
    dependencies = [ kernel32_sys_0_2_2 libc_0_2_30 redox_syscall_0_1_31 winapi_0_2_8 ];
  };
  tiny_http_0_5_8 = tiny_http_0_5_8_ {
    dependencies = [ ascii_0_7_1 chrono_0_2_25 chunked_transfer_0_3_1 encoding_0_2_33 log_0_3_8 rustc_serialize_0_3_24 url_0_2_38 ];
  };
  unreachable_1_0_0 = unreachable_1_0_0_ {
    dependencies = [ void_1_0_2 ];
  };
  url_0_2_38 = url_0_2_38_ {
    dependencies = [ matches_0_1_6 rustc_serialize_0_3_24 uuid_0_1_18 ];
  };
  utf8_ranges_1_0_0 = utf8_ranges_1_0_0_ {};
  uuid_0_1_18 = uuid_0_1_18_ {
    dependencies = [ rand_0_3_16 rustc_serialize_0_3_24 ];
  };
  void_1_0_2 = void_1_0_2_ {
    features = [ "std" ];
  };
  winapi_0_2_8 = winapi_0_2_8_ {};
  winapi_build_0_1_1 = winapi_build_0_1_1_ {};
  aho_corasick = aho_corasick_0_6_3;
  all_crates = all_crates_1_1_1;
  ascii = ascii_0_7_1;
  bitflags = bitflags_0_7_0;
  chrono = chrono_0_2_25;
  chunked_transfer = chunked_transfer_0_3_1;
  conv = conv_0_3_3;
  custom_derive = custom_derive_0_1_7;
  encoding = encoding_0_2_33;
  encoding_index_japanese = encoding_index_japanese_1_20141219_5;
  encoding_index_korean = encoding_index_korean_1_20141219_5;
  encoding_index_simpchinese = encoding_index_simpchinese_1_20141219_5;
  encoding_index_singlebyte = encoding_index_singlebyte_1_20141219_5;
  encoding_index_tradchinese = encoding_index_tradchinese_1_20141219_5;
  encoding_index_tests = encoding_index_tests_0_1_4;
  kernel32_sys = kernel32_sys_0_2_2;
  lazy_static = lazy_static_0_2_8;
  libc = libc_0_2_30;
  log = log_0_3_8;
  magenta = magenta_0_1_1;
  magenta_sys = magenta_sys_0_1_1;
  matches = matches_0_1_6;
  memchr = memchr_1_0_1;
  num = num_0_1_40;
  num_integer = num_integer_0_1_35;
  num_iter = num_iter_0_1_34;
  num_traits = num_traits_0_1_40;
  rand = rand_0_3_16;
  redox_syscall = redox_syscall_0_1_31;
  regex = regex_0_2_2;
  regex_syntax = regex_syntax_0_4_1;
  rustc_serialize = rustc_serialize_0_3_24;
  thread_local = thread_local_0_3_4;
  time = time_0_1_38;
  tiny_http = tiny_http_0_5_8;
  unreachable = unreachable_1_0_0;
  url = url_0_2_38;
  utf8_ranges = utf8_ranges_1_0_0;
  uuid = uuid_0_1_18;
  void = void_1_0_2;
  winapi = winapi_0_2_8;
  winapi_build = winapi_build_0_1_1;
}
