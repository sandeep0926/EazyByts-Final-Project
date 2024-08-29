package com.fitness.app.Repository;

import com.fitness.app.Model.UserActivity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserActivityRepository extends JpaRepository<UserActivity, Long> {

    @Query(value = "SELECT * FROM user_activity WHERE id = :id", nativeQuery = true)
    UserActivity getUserActivitiesByActivity_Id(long id);
}
