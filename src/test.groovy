static void main(String... args) {

    def fff = ["0.0.5", "0.1.11", "0.0.30-0", "0.0.29-0", "0.2.0", "0.1.300"].sort { a, b ->
        try {
            def aTemp = a.replaceAll("-0", "").split("\\.")
            def bTemp = b.replaceAll("-0", "").split("\\.")
            if (aTemp.length != 3 || bTemp.length != 3) return a <=> b
            if (aTemp[0] != bTemp[0]) return bTemp[0] as Integer <=> aTemp[0] as Integer
            if (aTemp[1] != bTemp[1]) return bTemp[1] as Integer <=> aTemp[1] as Integer
            if (aTemp[2] != bTemp[2]) return bTemp[2] as Integer <=> aTemp[2] as Integer
        } catch (Exception unused) {
            return a <=> b
        }
    }

    println(fff)

}
