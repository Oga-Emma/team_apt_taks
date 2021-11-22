class StringUtils {
  static const NAIRA = "₦";

  static formatMoney(double value) {
    return "$NAIRA$value";
  }
}
