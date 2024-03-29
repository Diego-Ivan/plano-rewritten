/* Plane.vala
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
    public class CartesianPlane : Object {
        public double x1 { get; set; }
        public double x2 { get; set; }
        public double y1 { get; set; }
        public double y2 { get; set; }

        private double rise { get; set; }
        private double run { get; set; }

        public string get_slope () {
            double slope;
            var unit = settings.unit;
            run = x2 - x1;
            rise = y2 - y1;
            slope = rise / run;

            var minified_slope = Utils.minify_number (slope);

            return minified_slope + " " + unit;
        }

        public string get_midpoint () {
            string midpoint;
            string midpoint_top = Utils.minify_number (run / 2);
            string midpoint_bottom = Utils.minify_number (rise / 2);
            midpoint = @"$midpoint_top, $midpoint_bottom";
            return midpoint;
        }
    }
}
