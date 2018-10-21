./ : lib{benchmark} \
    liba{benchmark_main} \
    test/ \
    doc{LICENSE README.md CONTRIBUTING.md CONTRIBUTORS} \
    manifest

lib{benchmark}: include/benchmark/hxx{*} src/{hxx cxx}{* -benchmark_main}

# This library provides the main() definition for cases where we don't have
# BENCHMARK_MAIN() in our code. It is a static library that is linked in the
# whole archive mode.
#
liba{benchmark_main}: src/cxx{benchmark_main} lib{benchmark}
liba{benchmark_main}: bin.whole = true

cxx.poptions =+ "-I$src_root/include"
lib{benchmark}: cxx.export.poptions = "-I$src_root/include"

# Additional system libraries.
#
if ($cxx.target.class == 'windows')
  cxx.libs += ($cxx.target.system == 'mingw32' ? -lshlwapi : shlwapi.lib)
else
{
  cxx.coptions += "-Wno-deprecated-declarations"
  cxx.libs += -lpthread
}

include/benchmark/hxx{*}: install = include/benchmark/

