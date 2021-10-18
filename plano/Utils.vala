namespace Plano.Utils {
    public string minify_number (double number) {
        int decimals = settings.get_int ("decimals");
        string temp_value = "" + number.to_string ();
        string string_value = "";

        int counter = -1;
        for (int i = 0; i < temp_value.length; ++i) {
            // checking the condition
            if (counter > decimals) {
                break;
            }
            else if (temp_value.get_char (i) == '.') {
                counter = 1;
            }
            else if (counter >= 1) {
                counter++;
            }

            // converting the number into string
            string_value += temp_value.get_char (i).to_string ();
            message (string_value);
        }
        return string_value;
    }
}
