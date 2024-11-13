class Guira < Formula
  desc "RA-Oberfläche für den Teilnehmerservice der DFN-PKI"
  homepage "https://blog.pki.dfn.de/tag/guira-releases/"
  url "https://pki.pca.dfn.de/guira/guira-4.1.zip"
  sha256 "7d000dd450ca57e63229588e849b4f7d3bd6aa699e5e6c192636dcf7b75e5c60"

  depends_on "openjdk"

  def install
    prefix.install "guira.jar"
    libexec.install Dir["lib/*"]
    bin.install "guira-macosx.command" => "guira"

    inreplace bin/"guira" do |s|
      s.gsub!("./lib", libexec)
      s.sub!(/^dir=.*$/, "dir=#{opt_prefix}")
      s.sub!(/^# JAVA_HOME=.*$/, "JAVA_HOME=#{HOMEBREW_PREFIX}/opt/openjdk")
    end

    inreplace libexec/"guira-env.txt" do |s|
      s.gsub!("./lib", libexec)
    end
  end
end
