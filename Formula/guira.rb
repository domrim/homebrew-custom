class Guira < Formula
  desc "RA-Oberfläche für den Teilnehmerservice der DFN-PKI"
  homepage "https://blog.pki.dfn.de/tag/guira-releases/"
  url "https://pki.pca.dfn.de/guira/guira-3.8.zip"
  sha256 "db9d89af6528c955fe166a28ca768fb7fb08c10054469321fc52988732ac4a60"
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
