package model;

import java.util.ArrayList;
import java.util.List;

public interface Dao<T> {
    List<T> getAll();
}
