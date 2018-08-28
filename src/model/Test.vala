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


public class Test {

	private WordList word_list;

	private bool repeat;
	private int current_word_iter;
	private string last_word;
	private string last_anwser;

	/**
	 * The {@code Test} class.
	 *
	 * @since 1.0.0
	 */
	public Test (string word_list, string name, int year, string course, string test_type, string order, int id) {
		this.word_list = new WordList (word_list, year, course, name, id);

		current_word_iter = 0;

		switch (order) {
			case "L - R":
				break;
			case "R - L": // reverse the words with the anwsers
				Gee.ArrayList<Word> rl_words = new Gee.ArrayList<Word> ();

				foreach (Word word in ((Word[]) this.word_list.words.to_array ())) {
					rl_words.add (new Word (word.get_anwser (), word.get_word ()));
				}
				this.word_list.words = rl_words;
				break;
			case "Both":
				Word[] t_words = ((Word[]) this.word_list.words.to_array ());
				foreach (Word word in t_words) {
					((Gee.ArrayList<Word>) this.word_list.words).add (new Word (word.get_anwser (), word.get_word ()));
				}
				break;
			case "Random":
				// TODO:
				// this
				break;
		}

	}

	public string get_current_word () {
		Word[] w = (Word[]) word_list.words.to_array ();
		string cw = w[current_word_iter].get_word ();
		return cw;
	}

	public string get_current_anwser () {
		Word[] w = (Word[]) word_list.words.to_array ();
		string ca = w[current_word_iter].get_anwser ();
		return ca;
	}

	public bool check_anwser (string anwser) {
		Word[] w = (Word[]) word_list.words.to_array ();
		string ca = w[current_word_iter].get_anwser ();

		if (ca.down () != anwser.strip ().down ()) {
			((Word[]) word_list.words.to_array ())[current_word_iter].got_wrong ();
			if (repeat) {
				((Gee.ArrayList<Word>) this.word_list.words).add (new Word (get_current_word (), get_current_anwser ()));
			}
			current_word_iter++;
			return false;
		}
		((Word[]) word_list.words.to_array ())[current_word_iter].got_right ();
		current_word_iter++;
		return true;
	}

	public int get_index () {
		return current_word_iter;
	}

	public int get_length () {
		return word_list.words.size;
	}

}
