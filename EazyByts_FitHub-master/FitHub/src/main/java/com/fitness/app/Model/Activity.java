package com.fitness.app.Model;

import jakarta.persistence.*;
import lombok.*;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import java.util.HashSet;
import java.util.Set;

@Entity
@EntityScan
@Builder
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@Table(name="activity")
public class Activity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String type;
    private int duration;

    @OneToMany(mappedBy = "activity", cascade = CascadeType.ALL)
    private Set<UserActivity> userActivities = new HashSet<>();
}
