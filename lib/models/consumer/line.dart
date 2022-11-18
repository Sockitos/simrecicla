import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simtech/models/consumer/component.dart';

part 'line.freezed.dart';

@freezed
class Line with _$Line {
  const factory Line({
    @Default(0.0) double papel,
    @Default(0.0) double cartao,
    @Default(0.0) double ecal,
    @Default(0.0) double filmePlastico,
    @Default(0.0) double pet,
    @Default(0.0) double pead,
    @Default(0.0) double plasticosMistos,
    @Default(0.0) double metaisFerrosos,
    @Default(0.0) double metaisNaoFerrosos,
    @Default(0.0) double vidro,
    @Default(0.0) double eps,
  }) = _Line;
  const Line._();

  factory Line.fromValue(double value) => Line(
        papel: value,
        cartao: value,
        ecal: value,
        filmePlastico: value,
        pet: value,
        pead: value,
        plasticosMistos: value,
        metaisFerrosos: value,
        metaisNaoFerrosos: value,
        vidro: value,
        eps: value,
      );

  static const Line zero = Line();

  double sum() {
    return papel +
        cartao +
        ecal +
        filmePlastico +
        pet +
        pead +
        plasticosMistos +
        metaisFerrosos +
        metaisNaoFerrosos +
        vidro +
        eps;
  }

  Line operator +(Line other) {
    return Line(
      papel: papel + other.papel,
      cartao: cartao + other.cartao,
      ecal: ecal + other.ecal,
      filmePlastico: filmePlastico + other.filmePlastico,
      pet: pet + other.pet,
      pead: pead + other.pead,
      plasticosMistos: plasticosMistos + other.plasticosMistos,
      metaisFerrosos: metaisFerrosos + other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos + other.metaisNaoFerrosos,
      vidro: vidro + other.vidro,
      eps: eps + other.eps,
    );
  }

  Line operator -(Line other) {
    return Line(
      papel: papel - other.papel,
      cartao: cartao - other.cartao,
      ecal: ecal - other.ecal,
      filmePlastico: filmePlastico - other.filmePlastico,
      pet: pet - other.pet,
      pead: pead - other.pead,
      plasticosMistos: plasticosMistos - other.plasticosMistos,
      metaisFerrosos: metaisFerrosos - other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos - other.metaisNaoFerrosos,
      vidro: vidro - other.vidro,
      eps: eps - other.eps,
    );
  }

  Line operator *(Line other) {
    return Line(
      papel: papel * other.papel,
      cartao: cartao * other.cartao,
      ecal: ecal * other.ecal,
      filmePlastico: filmePlastico * other.filmePlastico,
      pet: pet * other.pet,
      pead: pead * other.pead,
      plasticosMistos: plasticosMistos * other.plasticosMistos,
      metaisFerrosos: metaisFerrosos * other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos * other.metaisNaoFerrosos,
      vidro: vidro * other.vidro,
      eps: eps * other.eps,
    );
  }

  Line operator /(Line other) {
    return Line(
      papel: papel / other.papel,
      cartao: cartao / other.cartao,
      ecal: ecal / other.ecal,
      filmePlastico: filmePlastico / other.filmePlastico,
      pet: pet / other.pet,
      pead: pead / other.pead,
      plasticosMistos: plasticosMistos / other.plasticosMistos,
      metaisFerrosos: metaisFerrosos / other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos / other.metaisNaoFerrosos,
      vidro: vidro / other.vidro,
      eps: eps / other.eps,
    );
  }

  Line addAll(double other) {
    return Line(
      papel: papel + other,
      cartao: cartao + other,
      ecal: ecal + other,
      filmePlastico: filmePlastico + other,
      pet: pet + other,
      pead: pead + other,
      plasticosMistos: plasticosMistos + other,
      metaisFerrosos: metaisFerrosos + other,
      metaisNaoFerrosos: metaisNaoFerrosos + other,
      vidro: vidro + other,
      eps: eps + other,
    );
  }

  Line mulAll(double other) {
    return Line(
      papel: papel * other,
      cartao: cartao * other,
      ecal: ecal * other,
      filmePlastico: filmePlastico * other,
      pet: pet * other,
      pead: pead * other,
      plasticosMistos: plasticosMistos * other,
      metaisFerrosos: metaisFerrosos * other,
      metaisNaoFerrosos: metaisNaoFerrosos * other,
      vidro: vidro * other,
      eps: eps * other,
    );
  }
}

extension ComponentLine on Component {
  Line toLine() {
    return Line(
      papel: papel ?? 0,
      cartao: cartao ?? 0,
      ecal: ecal ?? 0,
      filmePlastico: pebd ?? 0,
      pet: pet ?? 0,
      pead: pead ?? 0,
      plasticosMistos: plasticosMistos ?? 0,
      metaisFerrosos: metaisFerrosos ?? 0,
      metaisNaoFerrosos: metaisNaoFerrosos ?? 0,
      vidro: vidro ?? 0,
      eps: eps ?? 0,
    );
  }
}
