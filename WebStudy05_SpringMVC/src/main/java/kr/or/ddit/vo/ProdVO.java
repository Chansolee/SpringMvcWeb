package kr.or.ddit.vo;
import java.io.File;
import java.io.IOException;
import java.io.Serializable;
import java.util.Set;
import java.util.UUID;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString(exclude = { "prodDetail" }) // 이것만 빼줌
@EqualsAndHashCode(of = { "prodId" })
@Data
@AllArgsConstructor // all생성자
@NoArgsConstructor // 기본생성자

public class ProdVO implements Serializable {

	@NotBlank(groups = {UpdateGroup.class})
	private String prodId;
	@NotBlank(groups = {InsertGroup.class})
	private String prodName;
	@NotBlank
	private String prodLgu;

	private String lprodNm;
	@NotBlank
	private String prodBuyer;
	@NotNull
	@Min(0)
	private Integer prodCost;
	@NotNull
	@Min(0)
	private Integer prodPrice;
	@NotNull
	@Min(0)
	private Integer prodSale;
	@NotBlank
	private String prodOutline;
	@JsonIgnore
	private transient String prodDetail;
	@NotBlank(groups = {DeleteGroup.class})
	private String prodImg;
	
	private MultipartFile prodImage;
	
	public void setProdImage(MultipartFile prodImage) {
		if(prodImage!=null && !prodImage.isEmpty()) {
			this.prodImage = prodImage;
			this.prodImg = UUID.randomUUID().toString();
			
		}
	
	}
	public void saveTo(File saveFolder) throws IOException {
		if(prodImage==null) return;
		File saveFile = new File(saveFolder, this.prodImg);
		prodImage.transferTo(saveFile);
		
	}
	
	@NotNull
	private Integer prodTotalstock;
	private String prodInsdate;
	@NotNull
	private Integer prodProperstock;
	private String prodSize;
	private String prodColor;
	private String prodDelivery;
	private String prodUnit;
	private Integer prodQtyin;
	private Integer prodQtysale;
	private Integer prodMileage;
	
	private BuyerVO buyer; // has A
	
//	private LprodVO lprod;
	
	private Set<MemberVO> memberList;
	
	private Integer memCount;

}
