package muratbekb95portfolio.streamingservicedatamanager.entities;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@MappedSuperclass
public class ParentEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name = "created_by", referencedColumnName = "id")
    private User created_by;

    @Column(name = "created_on")
    private Date created_on;

    @OneToOne
    @JoinColumn(name = "update_by", referencedColumnName = "id")
    private User update_by;

    @Column(name = "update_on")
    private Date update_on;
}
