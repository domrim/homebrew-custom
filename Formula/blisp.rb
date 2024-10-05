# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class Blisp < Formula
  desc "ISP tool & library for Bouffalo Labs RISC-V Microcontrollers and SoCs"
  homepage ""
  url "https://github.com/pine64/blisp/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "288a8165f7dce604657f79ee8eea895cc2fa4e4676de5df9853177defd77cf78"
  license "MIT"

  depends_on "cmake" => :build
  depends_on "libserialport" => :build
  depends_on "argtable3" => :build
  depends_on "pkgconfig" => :build

  def install
    system "cmake", "-DBLISP_USE_SYSTEM_LIBRARIES=ON", "-DBLISP_BUILD_CLI=ON" "-S", ".", "-B", "build", *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    output = shell_output("#{bin}/blisp write --chip=bl60x --reset --port COMX name_of_firmware.bin 2>&1", 4)
    assert_match "Failed to open device", output

    output = shell_output("#{bin}/blisp write --chip=bl70x name_of_firmware.bin 2>&1", 3)
    assert_match "Device not found", output

    assert_match version.to_s, shell_output("#{bin}/blisp --version")
    assert_match "Writes firmware to SPI Flash", shell_output("#{bin}/blisp write --help")
  end
end
