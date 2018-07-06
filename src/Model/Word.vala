
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
}
