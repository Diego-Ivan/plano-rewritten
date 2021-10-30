/* window.vala
 *
 * Copyright 2021 DiegoIvan
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
 */

namespace Plano {
    [GtkTemplate (ui = "/com/github/diegoivanme/plano/window.ui")]
	public class Window : Adw.ApplicationWindow {
		CartesianPlane plane = new CartesianPlane ();
		[GtkChild] unowned Entry entry_x1;
		[GtkChild] unowned Entry entry_y1;
		[GtkChild] unowned Entry entry_x2;
		[GtkChild] unowned Entry entry_y2;
		[GtkChild] unowned Gtk.Entry result_slope;
		[GtkChild] unowned Gtk.Entry result_midpoint;

		public Window (Gtk.Application app) {
			Object (application: app);

			set_default_size (
				settings.get_int ("window-width"),
				settings.get_int ("window-height")
			);
		}

		[GtkCallback]
		void btn_calculate_clicked () {
			if (try_set_entry_values_to_plane ()) {
				result_slope.set_text (plane.get_slope ());
				result_midpoint.set_text (plane.get_midpoint ());
			}
		}

		[GtkCallback]
		void btn_clear_entries_clicked () {
			debug ("Cleaning entries");
			entry_x1.clear ();
			entry_y1.clear ();
			entry_x2.clear ();
			entry_y2.clear ();
			result_slope.set_text ("");
			result_midpoint.set_text ("");
		}

		[GtkCallback]
		bool on_close_request () {
			settings.set_int ("window-height", get_height ());
            settings.set_int ("window-width", get_width ());
			return false;
		}

		bool try_set_entry_values_to_plane () {
			bool output = true;
			if (entry_x1.try_parse_content ())
				plane.x1 = entry_x1.get_value ();
			else
				output = false;

			if (entry_x2.try_parse_content ())
				plane.x2 = entry_x2.get_value ();
			else
				output = false;

			if (entry_y1.try_parse_content ())
				plane.y1 = entry_y1.get_value ();
			else
				output = false;

			if (entry_y2.try_parse_content ())
				plane.y2 = entry_y2.get_value ();
			else
				output = false;

			return output;
		}
	}
}
