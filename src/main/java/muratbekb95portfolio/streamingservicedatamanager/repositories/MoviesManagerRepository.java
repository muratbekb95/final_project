package muratbekb95portfolio.streamingservicedatamanager.repositories;

import muratbekb95portfolio.streamingservicedatamanager.entities.Movie;
import org.springframework.data.jpa.repository.JpaRepository;

public interface MoviesManagerRepository extends JpaRepository<Movie, Long> {
}
