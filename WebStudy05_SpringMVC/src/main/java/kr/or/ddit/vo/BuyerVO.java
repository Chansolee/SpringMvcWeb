package kr.or.ddit.vo;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.groups.Default;

import kr.or.ddit.validate.DeleteGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of ="buyerId")
public class BuyerVO implements Serializable {
   
   @NotBlank(groups = {Default.class, DeleteGroup.class})
   private String buyerId;
   @NotBlank
   private String buyerName;
   @NotBlank
   private String buyerLgu;
   private String buyerBank;
   private String buyerBankno;
   private String buyerBankname;
   private String buyerZip;
   private String buyerAdd1;
   private String buyerAdd2;
   @NotBlank
   private String buyerComtel;
   @NotBlank
   private String buyerFax;
   @Email
   @NotBlank
   private String buyerMail;
   private String buyerCharger;
   private String buyerTelext;
   
//   해당 거래처와의 거래 품목수.
   private int prodCount;
//   해당 거래처와의 거래 품목 리스트
   private List<ProdVO> prodList;
}