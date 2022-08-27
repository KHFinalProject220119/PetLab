package com.kh.petlab.community.model.service;



import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.community.model.dao.CommunityDao;
import com.kh.petlab.community.model.dto.Community;
import com.kh.petlab.community.model.dto.CommunityFreeBoard;
import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.member.model.dto.Attachment;


@Service
@Transactional(rollbackFor = Exception.class)
public class CommunityServiceImpl implements CommunityService {

	
	 @Autowired private CommunityDao communityDao;
	 
	 
	  @Transactional(readOnly = true)
	  
	  @Override public List<CommunityPhoto> selectPhotoList(int cPage, int numPerPage) { int
	  offset = (cPage - 1) * numPerPage; int limit = numPerPage; RowBounds
	  rowBounds = new RowBounds(offset, limit); return
	  communityDao.selectPhotoList(rowBounds);
	  }
	  
	 @Override
	 public int enroll(CommunityPhoto communityPhoto) {
		 //community insert
		 int result = communityDao.enroll(communityPhoto);
		 
		 // 첨부파일 insert
			/*
			 * Attachment attachment = communityPhoto.getAttachment(); if(attachment !=
			 * null) {
			 * 
			 * result = communityDao.attachmentEnroll(attachment); }
			 */
			
			return result;
		 
	}

	@Override
	public List<Attachment> selectAttachmentForPhoto(String attachGroupId) {
		return communityDao.selectAttachmentForPhoto(attachGroupId);
	}

	@Override
	public List<CommunityPhoto> selectPhotoListByLike() {
		// TODO Auto-generated method stub
		return   communityDao.selectPhotoListByLike();
	}
	
	 @Override
	 public int freebEnroll(CommunityFreeBoard communityFreeBoard) {
		 //community insert
		 int result = communityDao.freebEnroll(communityFreeBoard);
		 
		 // 첨부파일 insert
			/*
			 * Attachment attachment = communityPhoto.getAttachment(); if(attachment !=
			 * null) {
			 * 
			 * result = communityDao.attachmentEnroll(attachment); }
			 */
			
			return result;
		 
	}
	 
		@Transactional(readOnly = true)
		@Override
		public List<CommunityFreeBoard> selectFreeBoardList(int cPage, int numPerPage) {
			int offset = (cPage -1) * numPerPage;
			int limit = numPerPage;
			RowBounds rowBounds = new RowBounds(offset, limit);
			return communityDao.selectFreeBoardList(rowBounds);
		}
		
		@Override
		public CommunityFreeBoard selectOneFreeBoard(int no) {
			CommunityFreeBoard board = communityDao.selectOneFreeBoard(no);
			List<Attachment> attachments = communityDao.selectAttchmentListByFreeBoardNo(no);
			board.setAttachments(attachments);
			return board;
		}
		
		@Override
		public CommunityFreeBoard selectOneFreeBoardCollection(int no) {
			return communityDao.selectOneFreeBoardCollection(no);
		}
		
		@Override
		public Attachment selectOneAttachment(int attachNo) {
			return communityDao.selectOneAttachment(attachNo);
		}

		@Override
		public int selectTotalContent() {
			// TODO Auto-generated method stub
			return 0;
		}

}
