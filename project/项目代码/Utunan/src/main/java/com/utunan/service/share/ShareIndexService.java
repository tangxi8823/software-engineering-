package com.utunan.service.share;

import com.utunan.pojo.base.school.Direction;
import com.utunan.pojo.base.school.School;
import com.utunan.pojo.base.share.File;
import com.utunan.pojo.base.share.FileGreat;
import com.utunan.pojo.base.share.UserDownload;
import com.utunan.pojo.base.user.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ShareIndexService {
    /**
     * @author  孙程程
     * @description 最新文件
     * @date  18:00 2018/12/10
     * @param  pageNum, pageSize
     * @return  java.util.List<com.utunan.pojo.base.share.File>
     */
    List<File> listFileByTime(int pageNum, int pageSize);

	/**
	 * @author  孙程程
	 * @description 热门文件
	 * @date  18:00 2018/12/10
	 * @return  java.util.List<com.utunan.pojo.base.share.File>
	 */
    List<File> listHotFile();

    /**
     * @author  孙程程
     * @description 学校省份
     * @date  11:31 2018/12/11
     * @return  java.util.List<java.lang.String>
     */
	List<String> listSchoolProvince();
	/**
	 * @author  孙程程
	 * @description 学校
	 * @date  11:31 2018/12/11
	 * @return  java.util.List<com.utunan.pojo.base.school.School>
	 */
	List<School> listSchool();

	/**
	 * @author  孙程程
	 * @description 筛选文件
	 * @date  16:27 2018/12/11
	 * @return  java.util.List<com.utunan.pojo.base.share.File>
	 */
	List<File> selectFile(String[] fileTypes, String fileSchool, List<String> keyWords, int pageNum, int pageSize);

	/**
	 * @author  孙程程
	 * @description 根据fileId查文件
	 * @date  9:06 2018/12/13
	 * @param  fileId
	 * @return  com.utunan.pojo.base.share.File
	 */
	File findFileById(Long fileId);

	/**
	 * @author  孙程程
	 * @description 以文件标题为搜索条件，搜索相关文件
	 * @date  8:58 2018/12/17
	 * @param  keyWords
	 * @return  java.util.List<com.utunan.pojo.base.share.File>
	 */
	List<File> selectFileByTitle(List<String> keyWords);

	/**
	 * @author  孙程程
	 * @description 更新用户积分
	 * @date  15:34 2018/12/18
	 * @param  userId, userIntegral
	 * @return  void
	 */
	void updateUserIntegral(Long userId, Long userIntegral);

	/**
	 * @author  孙程程
	 * @description 向用户下载表插入数据
	 * @date  15:34 2018/12/18
	 * @param  userId, fileId
	 * @return  void
	 */
	void insertUserDownload(Long userId, Long fileId);

	/**
	 * @author  孙程程
	 * @description 判断用户是否下载过该文件
	 * @date  15:44 2018/12/18
	 * @param  userId, fileId
	 * @return  com.utunan.pojo.base.share.UserDownload
	 */
	UserDownload findUserDownload(Long userId, Long fileId);

	/**
	 * @author  孙程程
	 * @description 根据用户Id查找用户
	 * @date  16:34 2018/12/18
	 * @param  userId
	 * @return  com.utunan.pojo.base.user.User
	 */
	User findUserById(Long userId);

	/**
	 * @author  孙程程
	 * @description 更新文件下载次数
	 * @date  20:59 2018/12/18
	 * @param  fileId
	 * @return  void
	 */
	void updateFileDownloadNumber(Long fileId, Long downloadNumber);

	/**
	 * @author  孙程程
	 * @description 查询用户点赞表是否存在相关信息
	 * @date  8:26 2018/12/19
	 * @param  userId, fileId, type
	 * @return  com.utunan.pojo.base.share.FileGreat
	 */
	FileGreat findFileGreat(Long userId, Long fileId, Long operate);

	/**
	 * @author  孙程程
	 * @description 向用户点赞表插入数据
	 * @date  8:51 2018/12/19
	 * @param  userId, fileId, type
	 * @return  void
	 */
	void insertFileGreat(Long userId, Long fileId, Long operate);

	/**
	 * @author  孙程程
	 * @description 从用户点赞表删除信息
	 * @date  9:07 2018/12/19
	 * @param  userId, fileId, type
	 * @return  void
	 */
	void deleteFileGreat(Long userId, Long fileId, Long operate);

	/**
	 * @author  孙程程
	 * @description 更新文件点赞数量
	 * @date  8:45 2018/12/19
	 * @param  fileId, upNumber
	 * @return  void
	 */
	void updateFileUpNumber(Long fileId, Long upNumber);

	/**
	 * @author  孙程程
	 * @description 更新文件踩数量
	 * @date  8:44 2018/12/19
	 * @param  fileId, downNumber
	 * @return  void
	 */
	void updateFileDownNumber(Long fileId, Long downNumber);

	/**
	 * @author  孙程程
	 * @description 根据学校名称查学校地区
	 * @date  16:37 2018/12/26
	 * @param  school
	 * @return  java.lang.String
	 */
	String findProvinceBySchool(String school);

}
