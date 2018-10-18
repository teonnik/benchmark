./ : lib{benchmark} doc{LICENSE README.md CONTRIBUTING.md CONTRIBUTORS} manifest
cxx.poptions =+ "-I$src_root/include"

lib{benchmark}: include/benchmark/hxx{*} src/{hxx cxx}{* -benchmark_main}
lib{benchmark}: cxx.export.poptions = "-I$src_root"
lib{benchmark_main}: lib{benchmark} src/cxx{benchmark_main}

include/benchmark/hxx{*}: install = include/benchmark/
