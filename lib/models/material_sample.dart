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

  MaterialSample filterByValue(double value) {
    var hasCandidate = false;
    var sample = const MaterialSample();
    if (ecal >= value) {
      hasCandidate = true;
      sample = const MaterialSample(ecal: 1);
    }
    if (filmePlastico >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(filmePlastico: 1);
    }
    if (pet >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(pet: 1);
    }
    if (petOleo >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(petOleo: 1);
    }
    if (pead >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(pead: 1);
    }
    if (plasticosMistos >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(plasticosMistos: 1);
    }
    if (metaisFerrosos >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(metaisFerrosos: 1);
    }
    if (metaisNaoFerrosos >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(metaisNaoFerrosos: 1);
    }
    if (naoRecuperaveis >= value) {
      if (hasCandidate) {
        return const MaterialSample();
      }
      hasCandidate = true;
      sample = const MaterialSample(naoRecuperaveis: 1);
    }
    return sample;
  }

  MaterialSample replaceNans(double value) => MaterialSample(
        ecal: ecal.isNaN ? value : ecal,
        filmePlastico: filmePlastico.isNaN ? value : filmePlastico,
        pet: pet.isNaN ? value : pet,
        petOleo: petOleo.isNaN ? value : petOleo,
        pead: pead.isNaN ? value : pead,
        plasticosMistos: plasticosMistos.isNaN ? value : plasticosMistos,
        metaisFerrosos: metaisFerrosos.isNaN ? value : metaisFerrosos,
        metaisNaoFerrosos: metaisNaoFerrosos.isNaN ? value : metaisNaoFerrosos,
        naoRecuperaveis: naoRecuperaveis.isNaN ? value : naoRecuperaveis,
      );
}
