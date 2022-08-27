package com.kh.petlab.store.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;
import com.kh.petlab.store.model.dto.ProductdesAttachment;




@Mapper
public interface StoreDao {
	
	//상품 목록 조회
	List<Product> selectProductList(RowBounds rowBounds);
	//썸네일띄우기
	List<ProductAttachment> selectattToyList();
	List<ProductAttachment> selectattBagList();
	List<ProductAttachment> selectattBrushList();
	List<ProductAttachment> selectattPadList();
	List<ProductAttachment> selectattShamList();
	List<ProductAttachment> selectattFeedingList();
	List<ProductAttachment> selectattSnackList();
	List<ProductAttachment> selectattFeedList();
	
	@Select("select count(*) from product")
	int selectTotalContent();
	
	
	//상품등록
	int insertProduct(Product product);

	//상품첨부파일 등록
	int insertAttachment(ProductAttachment attach);
	int insertdesAttachment(ProductdesAttachment att);

	
	//상품 삭제
	int deleteProduct(int no);
	
	
	
	//상품 수정
	@Select("select * from product where product_no = #{productNo}")
	Product selectOneProduct(int no);
	
	@Select("select * from product_attachment where product_no = #{productNo}")
	List<ProductAttachment> selectAttachmentListByProductNo(int no);
	
	@Select("select * from product_des_attachment where product_no = #{productNo}")
	List<ProductdesAttachment> selectdesAttachmentListByProductNo(int no);
	
	@Select("select * from product_attachment where product_att_no = #{No}")
	ProductAttachment selectOneAttachment(int attachNo);
	
	@Select("select * from product_des_attachment where product_att_no = #{No}")
	ProductdesAttachment selectOnedesAttachment(int attachNo);
	
	
	//상품 상세
	Product selectOneProductCollection(int no);
	Product selectOneProductdesCollection(int no);

	int deleteAttachment(int no);
	int deletedesAttachment(int no);
	
	@Update("update product set product_name = #{productName}, product_price = #{productPrice}, "
			+ "product_des = #{productDes} "
			+ "where product_no = #{productNo}")
	int updateProduct(Product product);
	
	List<Product> selectProductLists();
	List<ProductAttachment> selectAttachLists(int productNo);
	
	
	
	
	
	
	
	
}
