package com.kh.petlab.community.model.service;

import java.util.List;

import com.kh.petlab.community.model.dto.CommunityDknowBoard;
import com.kh.petlab.community.model.dto.CommunityFreeBoard;
import com.kh.petlab.community.model.dto.CommunityMknowBoard;
import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.member.model.dto.Attachment;

public interface CommunityService {

	int enroll(CommunityPhoto communityPhoto);

	List<CommunityPhoto> selectPhotoList(int cPage, int numPerPage);

	List<Attachment> selectAttachmentForPhoto(String attachGroupId);

	List<CommunityPhoto> selectPhotoListByLike();
	
	List<CommunityPhoto> selectPhotoListForIndex();
	

	int freebEnroll(CommunityFreeBoard communityFreeBoard);

	List<CommunityFreeBoard> selectFreeBoardList(int cPage, int numPerPage);

	int selectTotalContent();

	CommunityFreeBoard selectOneFreeBoard(int no);

	CommunityFreeBoard selectOneFreeBoardCollection(int no);

	Attachment selectOneAttachment(int attachNo);


	int doctorKhowEnroll(CommunityDknowBoard communityDknowBoard);

	List<CommunityDknowBoard> selectDknowBoardList(int cPage, int numPerPage);


	CommunityDknowBoard selectOneDknowBoard(int no);

	CommunityDknowBoard selectOneDknowBoardCollection(int no);

	List<CommunityMknowBoard> selectMknowBoardList(int cPage, int numPerPage);

	int memberKhowEnroll(CommunityMknowBoard communityMknowBoard);

	CommunityMknowBoard selectOneMknowBoard(int no);

	CommunityMknowBoard selectOneMknowBoardCollection(int no);

}
