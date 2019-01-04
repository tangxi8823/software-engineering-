package com.utunan.mapper.questionbank;

import com.utunan.pojo.base.questionbank.Question;
import com.utunan.pojo.base.questionbank.Subject;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface QuestionIndexMapper {
	List<Subject> listSubject();
	Long countQuestionBySubject(@Param("subjectId") Long subjectId);
	Long countResolveQuestionBySubject(@Param("subjectId") Long subjectId, @Param("userId") Long userId);
	List<Question> listQuestionBySubject(@Param("subjectName") String subjectName);
	Long findSubjectIdByName(@Param("subjectName") String subjectName);
	List<Question> selectQuestionBySearchValue(@Param("keyWord") String keyWord);
	Long countAllQuestion();
}
