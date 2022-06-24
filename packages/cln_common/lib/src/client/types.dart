abstract class Serializable {
  Map<String, dynamic> toJSON();

  T as<T>() => this as T;
}
