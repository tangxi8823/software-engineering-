package com.utunan.mapper.user;

import com.utunan.pojo.base.school.Direction;
import com.utunan.pojo.base.user.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Mapper
@Repository
public interface DirectionCollectorMapper {
    List<Direction> selectAllByUser(User user);
    int deleteDirectionCollector(@Param("userId")Long userId,@Param("directionId") String directionId);
}
