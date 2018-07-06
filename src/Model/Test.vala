using Gee;

public class Test {

	private WordList word_list;
	private int test_type;
	private int order;

	public Test (string word_list, int type, int year, int test_type, int order) {
		this.word_list = new WordList (word_list, type, year);
		this.test_type = test_type;
		this.order = order;
	}

}
