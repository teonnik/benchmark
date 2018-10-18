./ : lib{benchmark} lib{benchmark_main} doc{LICENSE README.md CONTRIBUTING.md CONTRIBUTORS} manifest
cxx.poptions =+ "-I$src_root/include"

lib{benchmark}: include/benchmark/hxx{*} src/{hxx cxx}{* -benchmark_main}
lib{benchmark}: cxx.export.poptions = "-I$src_root/include"
lib{benchmark_main}: src/cxx{benchmark_main} lib{benchmark}

include/benchmark/hxx{*}: install = include/benchmark/
