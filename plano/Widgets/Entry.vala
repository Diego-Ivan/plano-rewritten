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

namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/entry.ui")]
    public class Entry : Gtk.Entry {
        private double value;
        public double get_value () { return double.parse (text); }

        public bool try_parse_content () {
            if (get_text () == "" || !double.try_parse (get_text())) 
                return false;
            
            value = double.parse (get_text ());
            return true;
        }

        public void clear () {
            remove_css_class ("error");
            set_text ("");
            debug ("Content set to ''");
        }

        [GtkCallback]
        void on_content_changed () {
            if (!double.try_parse (text))
                add_css_class ("error");
            else
                remove_css_class ("error");
        }
    }
}
