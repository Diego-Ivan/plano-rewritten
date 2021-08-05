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

namespace PlanoRewritten {
	[GtkTemplate (ui = "/com/github/diegoivanme/plano/window.ui")]
	public class Window : Adw.ApplicationWindow {
		CartesianPlane plane = new CartesianPlane ();
		[GtkChild] unowned Entry entryX1;
		[GtkChild] unowned Entry entryY1;
		[GtkChild] unowned Entry entryX2;
		[GtkChild] unowned Entry entryY2;
		[GtkChild] unowned Entry resultSlope;
		[GtkChild] unowned Entry resultMidpoint;

		public Window (Gtk.Application app) {
			Object (application: app);

			Gtk.CssProvider provider = new Gtk.CssProvider ();
			provider.load_from_resource ("/com/github/diegoivanme/plano/style.css");

			Gtk.StyleContext.add_provider_for_display (
				Gdk.Display.get_default (),
				provider,
				Gtk.STYLE_PROVIDER_PRIORITY_USER
			);
		}

		construct {
			var gtk_settings = Gtk.Settings.get_default ();
			gtk_settings.bind_property (
				"dark-theme",
				gtk_settings,
				"gtk-application-prefer-dark-theme",
				GLib.BindingFlags.SYNC_CREATE
			);
		}

		[GtkCallback]
		void btn_calculate_clicked () {
			if (try_set_entry_values_to_plane ()) {
				resultSlope.set_value (plane.get_slope ());
				resultMidpoint.set_text (plane.get_midpoint ());
			}
		}

		[GtkCallback]
		void btn_clear_entries_clicked () {
			debug ("Cleaning entries...");
			entryX1.clear ();
			entryY1.clear ();
			entryX2.clear ();
			entryY2.clear ();
			resultSlope.clear ();
			resultMidpoint.clear ();
		}

		[GtkCallback]
		void btn_switch_theme_clicked () {
		    message (Application.settings.dark_theme.to_string ());
		}

		bool try_set_entry_values_to_plane () {
			bool output = true;
			if (entryX1.try_parse_content ())
				plane.x1 = entryX1.get_value ();
			else
				output = false;

			if (entryX2.try_parse_content ())
				plane.x2 = entryX2.get_value ();
			else
				output = false;

			if (entryY1.try_parse_content ())
				plane.y1 = entryY1.get_value ();
			else
				output = false;

			if (entryY2.try_parse_content ())
				plane.y2 = entryY2.get_value ();
			else
				output = false;

			return output;
		}
	}
}
