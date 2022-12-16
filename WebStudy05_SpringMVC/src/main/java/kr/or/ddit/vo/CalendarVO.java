package kr.or.ddit.vo;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@EqualsAndHashCode(of ="testId")
@ToString
public class CalendarVO {
	
	private String testAllday;
	private String testBackgroundcolor;
	private String testDescription;
	private String testEnd;
	private String testStart;
	private String testTextcolor;
	@NotBlank(groups = { InsertGroup.class })
	private String testTitle;
	@NotBlank(groups = { InsertGroup.class })
	private String testType;
	private String testUsername;
	private Integer testId;
}
