package kr.or.ddit.vo;

import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@EqualsAndHashCode(of = { "lprodId" })
@Data
@AllArgsConstructor // all생성자
@NoArgsConstructor // 기본생성자
public class LprodVO implements Serializable{

	private Integer lprodId;
	private String lprodGu;
	private String lprodNm;
	
}
