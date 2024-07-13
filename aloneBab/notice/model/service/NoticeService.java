package com.project.aloneBab.notice.model.service;

import java.util.ArrayList;

import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.member.model.vo.Member;
import com.project.aloneBab.notice.model.vo.Notice;

public interface NoticeService {

	int noticeListCount(String key);

	ArrayList<Notice> noticeList(PageInfo pi);

	Notice noticeSelect(int boardNo, Member loginUser);

	ArrayList<Notice> noticeListMin(int boardNo);

	int noticeWrite(Notice n);

	int noticeUpdate(Notice no);

	int noticeDelete(int boardNo);

	ArrayList<Notice> noticeSearchList(PageInfo pi, String key);

	Notice noticeCommon();


}