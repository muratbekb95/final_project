package muratbekb95portfolio.streamingservicedatamanager.controllers;

import lombok.Data;
import muratbekb95portfolio.streamingservicedatamanager.entities.Movie;
import muratbekb95portfolio.streamingservicedatamanager.services.MoviesManagerService;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Data
@RestController
@RequestMapping("/movies-manager")
public class MoviesManagerController {
    private final MoviesManagerService moviesManagerService;

    @PostMapping
    public void createMovie(@RequestBody Movie movie) {
        moviesManagerService.createMovie(movie);
    }

    @GetMapping("/{id}")
    public Movie getMovie(@PathVariable("id") Long id) {
        return moviesManagerService.getMovie(id);
    }

    @GetMapping("/list")
    public List<Movie> getMovies() {
        return moviesManagerService.getMovies();
    }
}