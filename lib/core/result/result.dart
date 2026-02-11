import 'package:dartz/dartz.dart';
import '../network/failure/failure.dart';

typedef Result<T> = Either<Failure, T>;
