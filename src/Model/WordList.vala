using Gee;

public class WordList {

	private ArrayList words;
	private int year;
	private int type;

	public WordList (string word_list, int year, int type) {
		words = parse_word_list (word_list);
		this.year = year;
		this.type = type;
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
}
