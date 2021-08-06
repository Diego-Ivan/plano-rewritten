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
        public double x1 { set; get; }
        public double x2 { set; get; }
        public double y1 { set; get; }
        public double y2 { set; get; }

        private double rise { set; get; }
        private double run { set; get; }

        public double get_slope () {
            run = x2 - x1;
            rise = y2 - y1;
            double slope = rise/run;
            return slope;
        }

        public string get_midpoint () {
            string midpoint;
            midpoint = @"$(run/2), $(rise/2)";
            return midpoint;
        }
    }
}
