class StringUtils {
  static const NAIRA = "NGN";

  static formatMoney(double value) {
    return "$NAIRA$value";
  }
}
