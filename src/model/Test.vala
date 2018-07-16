/*
* Copyright (c) 2018 Peter van der Velde (https://vandervelde.cc)
*
* This program is free software; you can redistribute it and/or
* modify it under the terms of the GNU General Public
* License as published by the Free Software Foundation; either
* version 2 of the License, or (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
* General Public License for more details.
*
* You should have received a copy of the GNU General Public
* License along with this program; if not, write to the
* Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
* Boston, MA 02110-1301 USA
*
* Authored by: Peter van der Velde <petervandervelde2@gmail.com>
*/
using Gee;


public class Test {

	private WordList word_list;
	private int test_type;
	private int order;
	private int year;
	private string course;

	/**
	 * The {@code Test} class.
	 *
	 * @since 1.0.0
	 */
	public Test (string word_list, string name, int year, string course, int test_type, int order, int id) {
		this.word_list = new WordList (word_list, year, course, name, id);
		this.test_type = test_type;
		this.order = order;
	}

}
