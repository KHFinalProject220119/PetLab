package com.kh.petlab.adminnotice.model.service;

import java.util.List;

import com.kh.petlab.adminnotice.model.dto.AdminNoticeAttachment;
import com.kh.petlab.adminnotice.model.dto.AdminNotice;

public interface AdminNoticeService {

	List<AdminNotice> selectAdminNoticeList(int cPage, int numPerPage);

	int selectTotalContent();

	int insertAdminNotice(AdminNotice board);

	AdminNotice selectOneAdminNotice(int no);

	AdminNotice selectOneAdminNoticeCollection(int no);

	AdminNoticeAttachment selectOneAttachment(int attachNo);

	int deleteAttachment(int attachNo);

	int updateAdminNotice(AdminNotice board);

}
