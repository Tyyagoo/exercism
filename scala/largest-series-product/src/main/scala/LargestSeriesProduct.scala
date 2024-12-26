object Series {
  def largestProduct(span: Int, digits: String): Option[Int] = {
    if (span < 0 || span > digits.length || digits.exists(!_.isDigit)) None
    else {
      digits.sliding(span, 1)
        .map(_.map(_.asDigit).product)
        .maxOption
    }
  }
}