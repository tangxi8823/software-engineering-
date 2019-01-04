package com.utunan.service.community.impl;

import com.github.pagehelper.PageHelper;
import com.utunan.mapper.community.AnswerMapper;
import com.utunan.pojo.base.community.Answer;
import com.utunan.pojo.base.community.Quiz;
import com.utunan.pojo.base.user.User;
import com.utunan.service.community.AnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * @author 张正扬
 * @description: TODO
 * @date 2018/11/22 17:05
 */
@Service("AnswerService")
public class AnswerServiceImpl implements AnswerService {
    @Autowired
    private AnswerMapper answerMapper;

    /*
     * @author  张正扬
     * @description 向comment表插入回答
     * @date  15:47 2018/11/22
     * @param  content
     * @return  null
     */

    @Override
    public void saveAnswer(Long aid, Quiz quiz, String content, User user){
        Answer answer =new Answer();
        answer.setAnswerId(aid);
        answer.setQuiz(quiz);
        answer.setUser(user);
        answer.setAnswerContent(content);
        answer.setAnswerTime(new Date());
        int i=0;
        long j=(long) i;
        answer.setPraiseCount(j);
        answerMapper.toInsert(answer);
    }
    /*
     * @author  王碧云
     * @description 根据quiaId返回评论列表
     * @date  15:35 2018/11/25/025
     * @param  []
     * @return  java.util.List<com.utunan.pojo.base.community.Answer>
     */
    @Override
    public List<Answer> findAnswerListByQuizId(int pageNum,int pageSize,Long quizId) {
        PageHelper.startPage(pageNum,pageSize);
        return this.answerMapper.findAnswerListByQuizId(quizId);
    }

    /*
     * @author  王碧云
     * @description 根据commentId返回子评论列表
     * @date  21:12 2018/11/25/025
     * @param  [commentId]
     * @return  java.util.List<com.utunan.pojo.base.community.Answer>
     */
    @Override
    public List<Answer> findChildAnswerListByAnswerId(Long answerId) {
        return this.answerMapper.findChildAnswerListByAnswerId(answerId);
    }

    /*
     * @author  王碧云
     * @description 根据热度返回评论列表
     * @date  11:15 2018/11/26/026
     * @param  [quizId]
     * @return  java.util.List<com.utunan.pojo.base.community.Answer>
     */
    @Override
    public List<Answer> findAnswerListByPraiseCount(int pageNum,int pageSize,Long quizId) {
        PageHelper.startPage(pageNum,pageSize);
        return this.answerMapper.findAnswerListByPraiseCount(quizId);
    }

    /*
     * @author  王碧云
     * @description 根据quizId获取父级为null的评论数
     * @date  21:38 2018/11/26/026
     * @param  [quizId]
     * @return  java.lang.Long
     */
   // @Override
//    public Long countAnswerByQuizId(Long quizId) {
//        return this.answerMapper.countAnswerByQuizId(quizId);
//    }

    /*
     * @author  张正扬
     * @description 向comment表插入回答
     * @date  15:47 2018/11/22
     * @param  content
     * @return  null
     */

    @Override
    public void saveAnswer1(Long aid,Long quizId,Long answerId,String content,User user){
        Answer answer =new Answer();
        answer.setAnswerId(aid);
        answer.setParentAnswer(answerId);
        answer.setUser(user);
        answer.setAnswerContent(content);
        answer.setAnswerTime(new Date());
        answer.setPraiseCount(Long.parseLong("0"));
        answer.setQuizId(quizId);
        answerMapper.toInsert1(answer);
    }



    @Override
    public Long getMaxAid() {
        return this.answerMapper.getMaxAid();
    }

    @Override
    public void praiseAnswer(Long num){
        this.answerMapper.updatePraiseCount(num);
    }

    @Override
    public Long findchildAnswerCount(Long answerId) {
        return this.answerMapper.findchildAnswerCount(answerId);
    }


    @Override
    public List<Answer> findChildAnswerListByCount(Long answerId) {
        return this.answerMapper.findChildAnswerListByCount(answerId);
    }

    @Override
    public void delPraiseAnswer(Long answerId) {
       this.answerMapper.delPraiseAnswer(answerId);
    }

    //查询刚插入的评论信息
    @Override
    public Answer getAnswer(Long aid) {
        return this.answerMapper.getAnswer(aid);
    }

    //根据answerId删除回答及评论
    @Override
    public void delAnswer(Long answerId) {
        this.answerMapper.delAnswer(answerId);
    }

    //登录用户删除评论
    @Override
    public void delComment(Long answerId, Long parentanswerId) {
        this.answerMapper.delComment(answerId,parentanswerId);
    }

    //获取当前回答数

    @Override
    public Long gettal(Long quizId) {
        return this.answerMapper.gettal(quizId);
    }
}
