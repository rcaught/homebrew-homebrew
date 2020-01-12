class Mapr < Formula
  desc "Apply a command to values of structured data, with optional key filtering."
  homepage "https://github.com/rcaught/mapr"
  url "https://github.com/rcaught/mapr.git"
  head "https://github.com/rcaught/mapr.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = "amd64"
    path = buildpath/"src/github.com/rcaught/mapr"

    (path).install buildpath.children

    cd path do
      system "go", "build", "-o", "mapr", "."
      bin.install "mapr"
    end
  end

  test do
    system "#{bin}/mapr", "-h"
  end
end
