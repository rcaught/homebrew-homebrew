class HostsOverride < Formula
  desc "Override hosts file entries for the lifetime of the process"
  homepage "https://github.com/rcaught/hosts-override"
  url "https://github.com/rcaught/hosts-override.git",
      :tag      => "0.6.1",
      :revision => "6d18160e9c08c385c5dcad334e802127dff180c3"
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
