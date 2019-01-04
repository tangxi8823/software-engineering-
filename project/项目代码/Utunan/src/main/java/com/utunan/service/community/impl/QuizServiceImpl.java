package com.utunan.service.community.impl;

import com.github.pagehelper.PageHelper;
import com.utunan.mapper.community.QuizMapper;
import com.utunan.pojo.base.community.Quiz;
import com.utunan.pojo.base.community.Tag;
import com.utunan.pojo.base.user.User;
import com.utunan.service.community.QuizService;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.Date;
import java.util.List;

@Service("quizService")
public class QuizServiceImpl implements QuizService {
	@Autowired
	private QuizMapper quizMapper;

	@Override
	public List<Quiz> listQuiz(String orderBy, int pageNum, int pageSize){
		PageHelper.startPage(pageNum,pageSize);
		//按发表时间的提问列表
		List<Quiz> quizList = quizMapper.listQuiz(orderBy);
		//限制问题标题、内容展示字数
		condenseQuiz(quizList);
		return quizList;
	}

	@Override
	public List<Quiz> listQuizByTag(String orderBy, String tagName, int pageNum, int pageSize){
		//某标签的quizId
		List<Long> quizId=quizMapper.selectQuizIdByTagName(tagName);
		PageHelper.startPage(pageNum,pageSize);
		//按发表时间的提问列表
		List<Quiz> quizList = quizMapper.listQuizByTag(quizId, orderBy);
		//限制问题标题、内容展示字数
		condenseQuiz(quizList);
		return quizList;
	}

	/*
	 * @author  张正扬
	 * @description 向quiz表插入问题
	 * @date  15:47 2018/11/22
	 * @param  title,content
	 * @return  null
	 */
	
	@Override
	public void saveQuiz(Long qid,User user,String title,String content){
	    Quiz quiz=new Quiz();
	    quiz.setQuizId(qid);
	    quiz.setUser(user);
	    quiz.setQuizTitle(title);
	    quiz.setQuizContent(content);
	    quiz.setReleaseTime(new Date());
	    quiz.setPraiseCount(Long.parseLong("0"));
	    quiz.setAnswerCount(Long.parseLong("0"));
	    quizMapper.toInsert(quiz);
	}
	
	/*
	 * @author  张正扬
	 * @description 从quiz表取出刚刚插入的问题
	 * @date  15:47 2018/11/22
	 * @param  null
	 * @return  Quiz对象
	 */
	
	@Override
	public Quiz getQuiz(){
	    Quiz q= quizMapper.getQuiz1();
	    return q;
	}
	
	/*
	 * @author  王碧云
	 * @description 根据quizId查找Quiz
	 * @date  12:36 2018/11/24
	 * @param  [quizId]
	 * @return  com.utunan.pojo.base.community.Quiz
	 */
	@Override
	public Quiz findQuizById(Long quizId) {
		return this.quizMapper.findQuizById(quizId);
	}
	/*
	 * @author  王碧云
	 * @description 根据quizId查评论数量
	 * @date  15:06 2018/11/25/025
	 * @param  [quizId]
	 * @return  java.lang.Long
	 */
	@Override
	public Long countAnswerByQuizId(Long quizId) {
		return this.quizMapper.countAnswerByQuizId(quizId);
	}
	
	/**
	 * @author  孙程程
	 * @description 根据quizId查标签列表
	 * @date  16:19 2018/11/28
	 * @param  quizId
	 * @return  java.util.List<com.utunan.pojo.base.community.Tag>
	 */
	@Override
	public List<Tag> selectTagByQuizId(Long quizId){
		return this.quizMapper.selectTagByQuizId(quizId);
	}

	/**
	 * @author  唐溪
	 * @description 限制问题标题、内容展示字数
	 * @date   18:55 2018/11/25
	 * @param
	 * @return  void
	 */
		@Override
		public void condenseQuiz(List<Quiz> quizList) {
			for(int i=0;i<quizList.size();i++){
				Quiz q=quizList.get(i);
				if(q.getQuizContent().length()>95)
					q.setQuizContent(q.getQuizContent().substring(0,95)+" ...");
				if(q.getQuizTitle().length()>30)
					q.setQuizTitle(q.getQuizTitle().substring(0,30)+" ...");
			}
		}

	/*
	 * @author  张正扬
	 * @description  更新点赞计数
	 * @date  21:32 2018/11/27
	 * @param  [quizId]
	 * @return  void
	 */
	@Override
	public void praiseQuiz(Long quizId) {
		this.quizMapper.updatePraiseCount(quizId);
	}
	
	/**
	 * @author  孙程程
	 * @description 通过quizId查找用户
	 * @date  20:15 2018/11/28
	 * @param  quizId
	 * @return  com.utunan.pojo.base.user.User
	 */
	@Override
	public User findUserByQuizId(Long quizId){
		return this.quizMapper.findUserByQuizId(quizId);

	}

	@Override
	public Long getMaxQid(){
		return this.quizMapper.getMax();
	}

	@Override
	public void addAnswerCount(Long qid){
		 this.quizMapper.addAnswerCount(qid);
	}

	@Override
	public void delPraiseQuiz(Long quizId) {
		this.quizMapper.delPraiseQuiz(quizId);
	}

	@Override
	public List<Quiz> quizListTop10() {
		List<Quiz> quizs= quizMapper.quizListTop10();
		condenseQuiz(quizs);
		return quizs;
	}

	//获取点赞数

	@Override
	public Long getCountPrise(Long quizId) {
		return this.quizMapper.getCountPrise(quizId);
	}

	//根据quizId删除提问及回答评论
	@Override
	public void delQuiz(Long quizId) {
		this.quizMapper.delQuiz(quizId);
	}


}


