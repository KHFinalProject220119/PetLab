package com.kh.petlab.community.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import com.kh.petlab.community.model.dto.Community;
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
}
