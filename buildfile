./ : lib{benchmark} doc{LICENSE README.md CONTRIBUTING.md CONTRIBUTORS} manifest

lib{benchmark}: include/benchmark/hxx{*} src/{hxx cxx}{*}

cxx.poptions =+ "-I$src_root/include"
lib{benchmark}: cxx.export.poptions = "-I$src_root"

# Install headers into the nlohmann/ subdirectory of, say, /usr/include/
# recreating subdirectories.
#
include/nlohmann/hxx{*}: install         = include/nlohmann/
include/nlohmann/hxx{*}: install.subdirs = true

# TODO: port Google Benchmarks 
# Benhcmarks
#
#benchmarks/
#{
#  exe{json_benchmarks} : src/cxx{benchmarks}
#}

# Unit tests.
#
test/
{
 exe{*}: test = true
 exe{*}: install = false  
 
 for t: src/cxx{unit-*}
 {
   n = $name($t)        
   ./: exe{$n}
   exe{$n}: $t src/cxx{unit}
 }  
 
 cxx.poptions =+ "-I$src_base/thirdparty/catch"
 cxx.poptions =+ "-I$src_base/thirdparty/fifo_map"  
 
 # Include into distribution.
 #
 ./: data/file{**} thirdparty/file{**}
}
