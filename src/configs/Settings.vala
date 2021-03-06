/*
* Copyright (C) 2018  Peter van der Velde <petervandervelde2@gmail.com>
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

namespace Socratest.Configs {

    /**
     * The {@code Settings} class is responsible for defining all
     * the texts that are displayed in the application and must be translated.
     *
     * @see Granite.Services.Settings
     * @since 1.0.0
     */
    public class Settings : Granite.Services.Settings {

        /**
         * This static property represents the {@code Settings} type.
         */
        private static Settings? instance;

        /**
         * This property will represent the location x of the screen.
         * Variable of type {@code int} as declared.
         */
        public int window_x { get; set; }

        /**
         * This property will represent the location y of the screen.
         * Variable of type {@code int} as declared.
         */
        public int window_y { get; set; }

        /**
         * This property will represent the width of the window.
         * Variable of type {@code int} as declared.
         */
        public int window_width { get; set; }


        /**
         * This property will represent the height of the window.
         * Variable of type {@code int} as declared.
         */
        public int window_heigth { get; set; }

        /**
         * This property will represent the order of the words in a test.
         * Variable of type {@code int} as declared.
         */
        public string test_word_order { get; set; }

        /**
         * This property will represent the kind of test it will be, abc like or standard typed out.
         * Variable of type {@code int} as declared.
         */
        public string type_of_test { get; set; }

        /**
         * This property will represent wether or not a student would like to repeat wrong ansewerd questions.
         * Variable of type {@code int} as declared.
         */
        public bool repeat { get; set; }

        /**
         * Constructs a new {@code Settings} object
         * and sets the default exit folder.
         */
        private Settings () {
            base (Constants.ID);
        }

        /**
         * Returns a single instance of this class.
         *
         * @return {@code Settings}
         */
        public static unowned Settings get_instance () {
            if (instance == null) {
                instance = new Settings ();
            }

            return instance;
        }
    }
}
