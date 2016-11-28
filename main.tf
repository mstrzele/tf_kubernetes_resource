resource "null_resource" "default" {
  triggers {
    password      = "${var.password}"
    server        = "${var.server}"
    username      = "${var.username}"
    configuration = "${var.configuration}"
  }

  provisioner "local-exec" {
    command = <<EOF
cat <<eof | kubectl apply -f - --password='${var.password}' -s '${var.server}' --username='${var.username}'
${var.configuration}
eof
EOF
  }
}
