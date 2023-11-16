class Guira < Formula
  desc "RA-Oberfläche für den Teilnehmerservice der DFN-PKI"
  homepage "https://blog.pki.dfn.de/tag/guira-releases/"
  url "https://pki.pca.dfn.de/guira/guira-3.9.1.zip"
  sha256 "457cbd8aa86ff91a173ae86ea44cc8d55967ffe2528ccea81f3fcdff6f836161"
  license ""

  depends_on "openjdk"

  def install
    prefix.install "guira.jar"
    libexec.install Dir["lib/*"]
    bin.install "guira-macosx.command" => "guira"

    inreplace bin/"guira" do |s|
      s.gsub!("./lib", libexec)
      s.sub!(/^dir=.*$/, "dir=#{opt_prefix}")
    end

    inreplace libexec/"guira-env.txt" do |s|
      s.gsub!("./lib", libexec)
    end
  end
end
