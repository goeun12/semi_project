package com.project.aloneBab.notice.model.service;

import java.util.ArrayList;

import com.project.aloneBab.common.PageInfo;
import com.project.aloneBab.notice.model.vo.Notice;

public interface NoticeService {

	int noticeListCount();

	ArrayList<Notice> noticeList(PageInfo pi, String boardGenre);

	Notice noticeSelect(int boardNo);

	ArrayList<Notice> noticeListMin(int BoardNo);

	int noticeWrite(Notice n);

	int noticeUpdate(Notice no);

	int noticeDelete(int boardNo);

}
