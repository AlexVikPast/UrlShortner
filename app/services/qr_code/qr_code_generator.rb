class QrCode::QrCodeGenerator
  def self.generate_qr_code(text)
    qrcode = RQRCode::QRCode.new(text)
    svg = qrcode.as_svg(
      color: "000",
      shape_rendering: "crispEdges",
      module_size: 5,
      standalone: true,
      use_path: true,
      offset: 5
    )
  end
end