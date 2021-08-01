namespace PlanoRewritten {
    public class Entry : Gtk.Entry {
        public bool can_content_be_parsed () {
            if (get_text () == "") {
                debug ("Entry content was empty, returning false");
                return false;
            }
            debug (@"Returning $(double.try_parse (get_text())) for $(get_text())");
            return double.try_parse (get_text ());
        }
        
        public void set_value (double value) {
            set_text (value.to_string ());
        }

        public double get_value () {
            return double.parse (get_text ());         
        }
        
        public void clear () {
            remove_error_class ();
            set_text ("");
            debug ("Content set to ''");
        }

        public void set_error_class () {
            get_style_context ().add_class (Gtk.STYLE_CLASS_ERROR);
            debug ("Added error class");
        }

        public void remove_error_class () {
            get_style_context ().remove_class (Gtk.STYLE_CLASS_ERROR);
            debug ("Error class removed");
        }
    }
}