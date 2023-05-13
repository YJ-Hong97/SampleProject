package com.sample.myapp.goods;

public class EmojiVo {
	private int emojis_code;
	private int emojis_type;

	public int getEmojis_code() {
		return emojis_code;
	}

	public void setEmojis_code(int emojis_code) {
		this.emojis_code = emojis_code;
	}

	public int getEmojis_type() {
		return emojis_type;
	}

	public void setEmojis_type(int emojis_type) {
		this.emojis_type = emojis_type;
	}

	@Override
	public String toString() {
		return "EmojiVo [emojis_code=" + emojis_code + ", emojis_type=" + emojis_type + "]";
	}

}
