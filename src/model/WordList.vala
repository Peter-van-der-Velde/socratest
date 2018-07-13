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


public class WordList {

	private int id;
	private ArrayList words;
	private int year;
	private string name;
	private string course;
	private string text;

	public WordList (string word_list, int year, string course, string name, int id) {
		words = parse_word_list (word_list);
		this.year = year;
		this.course = course;
		this.name = name;
		this.text = word_list;
		this.id = id;
	}

	private ArrayList parse_word_list (string word_list) {
		var words = new ArrayList<Word> ();
		string[] word_anwsers = word_list.split ("\n");
		foreach (string word_anwser_string in word_anwsers) {
			string[] word_anwser_arr = word_anwser_string.split ("=");
			if (word_anwser_arr.length < 2)
				continue;
			string word = word_anwser_arr[0].strip ();
			string anwser = word_anwser_arr[1].strip ();
			words.add (new Word (word, anwser));
		}
		return words;
	}

	public int get_year () {
		return year;
	}

	public string get_course () {
		return course;
	}

	public string get_name () {
		return name;
	}

	public string get_text () {
		return text;
	}

	public int get_id () {
		return id;
	}

}
