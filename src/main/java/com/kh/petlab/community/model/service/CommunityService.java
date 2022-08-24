package com.kh.petlab.community.model.service;

import java.util.List;


import com.kh.petlab.community.model.dto.CommunityPhoto;
import com.kh.petlab.member.model.dto.Attachment;

public interface CommunityService {

	int enroll(CommunityPhoto communityPhoto);

	List<CommunityPhoto> selectPhotoList(int cPage, int numPerPage);

	List<Attachment> selectAttachmentForPhoto(String attachGroupId);

	List<CommunityPhoto> selectPhotoListByLike();
	 

}
