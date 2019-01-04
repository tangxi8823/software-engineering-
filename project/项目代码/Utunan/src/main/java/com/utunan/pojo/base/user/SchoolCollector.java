package com.utunan.pojo.base.user;

import com.utunan.pojo.base.school.Direction;

public class SchoolCollector {

    //院校信息收藏列表Id
    private Long schoolCollectorId;
    //用户Id
    private User user;
    //研究方向Id
    private Direction direction;

    public Long getSchoolCollectorId() {
        return schoolCollectorId;
    }

    public void setSchoolCollectorId(Long schoolCollectorId) {
        this.schoolCollectorId = schoolCollectorId;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Direction getDirection() {
        return direction;
    }

    public void setDirection(Direction direction) {
        this.direction = direction;
    }

    @Override
    public String toString() {
        return "SchoolCollector{" +
                "schoolCollectorId=" + schoolCollectorId +
                ", user=" + user +
                ", direction=" + direction +
                '}';
    }
}
