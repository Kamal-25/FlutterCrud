abstract class CrudRepository<T, I> {

  T save(T data);
  T findById(I id);
  List<T> findAll();
  void deleteById(I id);

}