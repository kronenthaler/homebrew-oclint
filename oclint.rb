class Oclint < Formula
  desc "OCLint static code analysis tool for C, C++, and Objective-C"
  homepage "http://oclint.org"
  version '0.15'
  sha256 'd56e64fc966b3373a785be807cb53f86eb1d8890e5728ebce3ba389c39fc436b'
  url "https://github.com/kronenthaler/homebrew-oclint/releases/download/#{version}/oclint-#{version}.tar.gz"
  head "https://github.com/kronenthaler/homebrew-oclint.git"

  def install
    clang_version = '9.0.0'

    include.install Dir['include/c++'] unless File.directory? "#{include}/c++"
    "#{include}/c++".install Dir['include/c++/v1'] unless File.directory? "#{include}/c++/v1"
    lib.install Dir['lib/clang'] unless File.directory? "#{lib}/clang"
    "#{lib}/clang".install Dir['lib/clang/#{clang_version}'] unless File.directory? "#{lib}/clang/#{clang_version}"
    lib.install Dir['lib/oclint']
    bin.install Dir['bin/*']
  end

  test do
    system "#{bin}/oclint", "-version"
  end
end
