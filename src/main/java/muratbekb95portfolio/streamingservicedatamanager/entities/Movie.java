package muratbekb95portfolio.streamingservicedatamanager.entities;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "movies")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class Movie extends ParentEntity {

    @Column(name = "title")
    private String title;

    @JsonProperty("info")
    private String info;
}
