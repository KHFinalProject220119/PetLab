package com.kh.petlab.community.model.service;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.petlab.community.model.dao.CommunityDao;
import com.kh.petlab.community.model.dto.Community;
import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.member.model.dto.Attachment;

@Service
@Transactional(rollbackFor = Exception.class)
public class CommunityServiceImpl implements CommunityService {

	
	 @Autowired private CommunityDao communityDao;
	/* 
	 * @Transactional(readOnly = true)
	 * 
	 * @Override public List<Photo> selectPhotoList(int cPage, int numPerPage) { int
	 * offset = (cPage - 1) * numPerPage; int limit = numPerPage; RowBounds
	 * rowBounds = new RowBounds(offset, limit); return
	 * communityDao.selectPhotoList(rowBounds);
	 * 
	 * }
	 */
	 
	 @Override
	public int enroll(CommunityPhoto communityPhoto) {
		 //community insert
		 int result = communityDao.enroll(communityPhoto);
		 
		 // 첨부파일 insert
		 Attachment attachment = communityPhoto.getAttachment();
			if(attachment != null) {

				result = communityDao.attachmentEnroll(attachment);
			}
			
			return result;
		 
	}
	

}
