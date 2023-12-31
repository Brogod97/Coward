package kr.co.coward.contest.model.vo;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class ContestAttend {
	private int attendNo;
	private int memberNo;
	private int contestNo;
	private String description;
	private String githubAddress;
	private String pptFile;
	private String skill;
	private int dueDate;
	private List<String> skillList;

}
