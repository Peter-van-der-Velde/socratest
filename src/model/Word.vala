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


public class Word {
	private string word;
	private string anwser;
	private bool anwsered_corectly;
	private int amount_of_tries;

	public Word (string word, string anwser) {
		this.word = word;
		this.anwser = anwser;
		anwsered_corectly = false;
		amount_of_tries = 0;
	}

	public string get_word () {
		return word;
	}

	public string get_anwser () {
		return anwser;
	}

	public int get_amount_of_tries () {
		return amount_of_tries;
	}

	public void got_right () {
		anwsered_corectly = true;
	}

	public void got_wrong () {
		amount_of_tries++;
	}
}
