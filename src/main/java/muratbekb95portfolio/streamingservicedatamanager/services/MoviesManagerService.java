package muratbekb95portfolio.streamingservicedatamanager.services;

import lombok.Data;
import muratbekb95portfolio.streamingservicedatamanager.entities.Movie;
import muratbekb95portfolio.streamingservicedatamanager.repositories.MoviesManagerRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Data
@Service
public class MoviesManagerService {
    private final MoviesManagerRepository repository;

    public void createMovie(Movie movie) {
        repository.save(movie);
    }

    public Movie getMovie(Long id) {
        return repository.findById(id).orElse(null);
    }

    public List<Movie> getMovies() {
        return repository.findAll();
    }
}
