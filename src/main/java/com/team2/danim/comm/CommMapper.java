package com.team2.danim.comm;

import java.util.List;

public interface CommMapper {
	public List<Comm_picture> getCommPicture();


	public int upload(Comm_picture cp);

	public List<Comm_picture> getCommPicture2(Comm_picture cp);

	public int delPicture(Comm_picture cp);

	public int updatePicture(Comm_picture cp);

	public List<Comm_picture> searchTitle(Comm_picture cp);

	public List<Comm_picture> searchWriter(Comm_picture cp);

	public List<Comm_picture> searchTxt(Comm_picture cp);

	public int viewPlus(Comm_picture cp);

	public int goodPlus(Comm_picture cp);

	public int pictureReplyUpload(Comm_picture_reply cpr);

	public List<Comm_picture_reply> getReply(Comm_picture_reply cpr);

}
