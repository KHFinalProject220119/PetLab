package com.kh.petlab.community.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.petlab.community.model.dto.Community;
import com.kh.petlab.community.model.dto.CommunityDknowBoard;
import com.kh.petlab.community.model.dto.CommunityFreeBoard;
import com.kh.petlab.community.model.dto.CommunityMknowBoard;
import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.member.model.dto.Attachment;

@Mapper
public interface CommunityDao {
	
	List<CommunityPhoto> selectPhotoList(RowBounds rowBounds);

	int enroll(CommunityPhoto communityPhoto);

	int attachmentEnroll(Attachment attachment);

	List<CommunityPhoto> selectPhotoList();

	List<Attachment> selectAttachmentForPhoto(String attachGroupId);

	List<CommunityPhoto> selectPhotoListByLike();

	List<CommunityPhoto> selectPhotoListForIndex();
	
	Attachment selectPhotoAttachListForIndex(String attachGroudpId);
	
	
	int freebEnroll(CommunityFreeBoard communityFreeBoard);

	List<CommunityFreeBoard> selectFreeBoardList(RowBounds rowBounds);

	CommunityFreeBoard selectOneFreeBoard(int no);
	
	List<Attachment> selectAttchmentListByFreeBoardNo(int no);

	CommunityFreeBoard selectOneFreeBoardCollection(int no);
	
	
	int doctorKhowEnroll(CommunityDknowBoard communityDknowBoard);

	List<CommunityDknowBoard> selectDknowBoardList(RowBounds rowBounds);
	
	List<Attachment> selectAttchmentListByDknowBoardNo(int no);
	
	CommunityDknowBoard selectOneDknowBoardCollection(int no);

	
	Attachment selectOneAttachment(int attachNo);

	CommunityDknowBoard selectOneDknowBoard(int no);

	int memberKhowEnroll(CommunityMknowBoard communityMknowBoard);

	List<CommunityMknowBoard> selectMknowBoardList(RowBounds rowBounds);

	List<Attachment> selectAttchmentListByMknowBoardNo(int no);

	CommunityMknowBoard selectOneMknowBoardCollection(int no);

	CommunityMknowBoard selectOneMknowBoard(int no);



}
