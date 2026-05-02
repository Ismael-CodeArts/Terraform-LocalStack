resource "aws_s3_bucket" "recurso_del_modulo" {
  bucket = var.nombre_del_bucket

  tags = {
    Origen = "Modulo-Tarea-4"
  }
}
