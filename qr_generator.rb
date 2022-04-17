require 'rqrcode'

content = ARGV[0]
color = ARGV[1] ? "#{ARGV[1]}" : 'black'

qr_code = RQRCode::QRCode.new(content)

png = qr_code.as_png(
  color: color,
  fill: "white",
  size: 300
)

IO.binwrite("qr_code.png", png.to_s)
