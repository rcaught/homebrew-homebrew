class HostsOverride < Formula
  desc "Override hosts file entries for the lifetime of the process"
  homepage "https://github.com/rcaught/hosts-override"
  url "https://github.com/rcaught/hosts-override.git",
      :tag      => "0.5.0",
      :revision => "02b63e305fdd956d0aa7b71af6b8def9991b45eb"
  head "https://github.com/rcaught/hosts-override.git"

  depends_on "go" => :build

  def install
    ENV["GOPATH"] = buildpath
    ENV["GOOS"] = "darwin"
    ENV["GOARCH"] = "amd64"
    path = buildpath/"src/github.com/rcaught/hosts-override"

    (path).install buildpath.children

    cd path do
      system "go", "build", "-o", "hosts-override", "."
      bin.install "hosts-override"
    end
  end

  test do
    system "#{bin}/hosts-override", "-h"
  end
end
