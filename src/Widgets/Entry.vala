/* Entry.vala
 *
 * Copyright 2021 DiegoIvan <diegoivan.mae@gmail.com>
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 * SPDX-License-Identifier: GPL-3.0-or-later
 */

namespace PlanoRewritten {
    public class Entry : Gtk.Entry {
        private double value;
        public double get_value () { return value; }

        public bool try_parse_content () {
            if (get_text () == "" || !double.try_parse (get_text())) {
                debug ("Entry content was empty or non-valid value, returning false");
                set_error_class ();
                return false;
            }
            remove_error_class ();
            value = double.parse (get_text ());
            return true;
        }

        public void set_value (double _value) {
            value = _value;
            set_text (value.to_string ());
        }

        
        public void clear () {
            remove_error_class ();
            set_text ("");
            debug ("Content set to ''");
        }

        private void set_error_class () {
            get_style_context ().add_class (Gtk.STYLE_CLASS_ERROR);
            debug ("Added error class");
        }

        public void remove_error_class () {
            get_style_context ().remove_class (Gtk.STYLE_CLASS_ERROR);
            debug ("Error class removed");
        }
    }
}
