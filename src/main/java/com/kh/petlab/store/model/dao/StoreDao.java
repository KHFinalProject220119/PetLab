package com.kh.petlab.store.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.apache.ibatis.session.RowBounds;

import com.kh.petlab.store.model.dto.Product;
import com.kh.petlab.store.model.dto.ProductAttachment;



@Mapper
public interface StoreDao {
	
	//상품 목록 조회
	List<Product> selectProductList(RowBounds rowBounds);
	
	@Select("select count(*) from product")
	int selectTotalContent();
	
	
	//상품등록
	int insertProduct(Product product);

	//상품첨부파일 등록
	int insertAttachment(ProductAttachment attach);
	
	//상품 삭제
	int deleteProduct(int no);
	
	
	
	//상품 수정
	@Select("select * from product where product_no = #{productNo}")
	Product selectOneProduct(int no);
	
	@Select("select * from product_attachment where product_no = #{productNo}")
	List<ProductAttachment> selectAttachmentListByProductNo(int no);
	
	//상품 상세
	Product selectOneProductCollection(int no);

	int deleteAttachment(int no);
	
	@Update("update product set product_name = #{productName}, product_price = #{productPrice}, "
			+ "product_des = #{productDes} "
			+ "where product_no = #{productNo}")
	int updateProduct(Product product);
	
}
