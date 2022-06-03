import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_sample.freezed.dart';
part 'material_sample.g.dart';

@freezed
class MaterialSample with _$MaterialSample {
  const factory MaterialSample({
    @Default(0) double ecal,
    @Default(0) double filmePlastico,
    @Default(0) double pet,
    @Default(0) double petOleo,
    @Default(0) double pead,
    @Default(0) double plasticosMistos,
    @Default(0) double metaisFerrosos,
    @Default(0) double metaisNaoFerrosos,
    @Default(0) double naoRecuperaveis,
  }) = _MaterialSample;
  const MaterialSample._();

  factory MaterialSample.fromJson(Map<String, dynamic> json) =>
      _$MaterialSampleFromJson(json);

  MaterialSample operator +(MaterialSample other) {
    return MaterialSample(
      ecal: ecal + other.ecal,
      filmePlastico: filmePlastico + other.filmePlastico,
      pet: pet + other.pet,
      petOleo: petOleo + other.petOleo,
      pead: pead + other.pead,
      plasticosMistos: plasticosMistos + other.plasticosMistos,
      metaisFerrosos: metaisFerrosos + other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos + other.metaisNaoFerrosos,
      naoRecuperaveis: naoRecuperaveis + other.naoRecuperaveis,
    );
  }

  MaterialSample operator -(MaterialSample other) {
    return MaterialSample(
      ecal: ecal - other.ecal,
      filmePlastico: filmePlastico - other.filmePlastico,
      pet: pet - other.pet,
      petOleo: petOleo - other.petOleo,
      pead: pead - other.pead,
      plasticosMistos: plasticosMistos - other.plasticosMistos,
      metaisFerrosos: metaisFerrosos - other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos - other.metaisNaoFerrosos,
      naoRecuperaveis: naoRecuperaveis - other.naoRecuperaveis,
    );
  }

  MaterialSample operator *(MaterialSample other) {
    return MaterialSample(
      ecal: ecal * other.ecal,
      filmePlastico: filmePlastico * other.filmePlastico,
      pet: pet * other.pet,
      petOleo: petOleo * other.petOleo,
      pead: pead * other.pead,
      plasticosMistos: plasticosMistos * other.plasticosMistos,
      metaisFerrosos: metaisFerrosos * other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos * other.metaisNaoFerrosos,
      naoRecuperaveis: naoRecuperaveis * other.naoRecuperaveis,
    );
  }

  MaterialSample operator /(MaterialSample other) {
    return MaterialSample(
      ecal: ecal / other.ecal,
      filmePlastico: filmePlastico / other.filmePlastico,
      pet: pet / other.pet,
      petOleo: petOleo / other.petOleo,
      pead: pead / other.pead,
      plasticosMistos: plasticosMistos / other.plasticosMistos,
      metaisFerrosos: metaisFerrosos / other.metaisFerrosos,
      metaisNaoFerrosos: metaisNaoFerrosos / other.metaisNaoFerrosos,
      naoRecuperaveis: naoRecuperaveis / other.naoRecuperaveis,
    );
  }

  MaterialSample mulAll(double other) {
    return MaterialSample(
      ecal: ecal * other,
      filmePlastico: filmePlastico * other,
      pet: pet * other,
      petOleo: petOleo * other,
      pead: pead * other,
      plasticosMistos: plasticosMistos * other,
      metaisFerrosos: metaisFerrosos * other,
      metaisNaoFerrosos: metaisNaoFerrosos * other,
      naoRecuperaveis: naoRecuperaveis * other,
    );
  }

  MaterialSample divAll(double other) {
    return MaterialSample(
      ecal: ecal / other,
      filmePlastico: filmePlastico / other,
      pet: pet / other,
      petOleo: petOleo / other,
      pead: pead / other,
      plasticosMistos: plasticosMistos / other,
      metaisFerrosos: metaisFerrosos / other,
      metaisNaoFerrosos: metaisNaoFerrosos / other,
      naoRecuperaveis: naoRecuperaveis / other,
    );
  }

  double sum() {
    return ecal +
        filmePlastico +
        pet +
        petOleo +
        pead +
        plasticosMistos +
        metaisFerrosos +
        metaisNaoFerrosos +
        naoRecuperaveis;
  }
}
