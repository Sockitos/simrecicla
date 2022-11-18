import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_sample.freezed.dart';

enum RMaterial {
  ecal('ECAL'),
  filmePlastico('Filme plástico'),
  pet('PET'),
  petOleo('PET Óleo'),
  pead('PEADs'),
  plasticosMistos('Plásticos Mistos'),
  metaisFerrosos('Metais Ferrosos'),
  metaisNaoFerrosos('Metais não Ferrosos'),
  papel('Papel'),
  cartao('Cartão'),
  jornaisRevistas('Jornais e Revistas'),
  naoRecuperaveis('Não recuperáveis');

  const RMaterial(this.name);
  final String name;
}

@freezed
class MaterialSample with _$MaterialSample {
  const factory MaterialSample({
    @Default(<RMaterial, double>{}) Map<RMaterial, double> materials,
    @Default(0) double naoRecuperaveis,
  }) = _MaterialSample;
  const factory MaterialSample.pm({
    @Default(0) double ecal,
    @Default(0) double filmePlastico,
    @Default(0) double pet,
    @Default(0) double petOleo,
    @Default(0) double pead,
    @Default(0) double plasticosMistos,
    @Default(0) double metaisFerrosos,
    @Default(0) double metaisNaoFerrosos,
    @Default(0) double naoRecuperaveis,
  }) = _MaterialSamplePM;
  const factory MaterialSample.pc({
    @Default(0) double papel,
    @Default(0) double cartao,
    @Default(0) double jornaisRevistas,
    @Default(0) double naoRecuperaveis,
  }) = _MaterialSamplePC;
  const MaterialSample._();

  Map<RMaterial, double> get materials => map(
        (sample) => sample.materials,
        pm: (pm) => {
          RMaterial.ecal: pm.ecal,
          RMaterial.filmePlastico: pm.filmePlastico,
          RMaterial.pet: pm.pet,
          RMaterial.petOleo: pm.petOleo,
          RMaterial.pead: pm.pead,
          RMaterial.plasticosMistos: pm.plasticosMistos,
          RMaterial.metaisFerrosos: pm.metaisFerrosos,
          RMaterial.metaisNaoFerrosos: pm.metaisNaoFerrosos,
        },
        pc: (pc) => {
          RMaterial.papel: pc.papel,
          RMaterial.cartao: pc.cartao,
          RMaterial.jornaisRevistas: pc.jornaisRevistas,
        },
      );

  double getValue(RMaterial material) => materials[material] ?? 0;

  MaterialSample operator +(MaterialSample other) {
    return MaterialSample(
      materials: {
        for (final m in {...materials.keys, ...other.materials.keys})
          m: (materials[m] ?? 0) + (other.materials[m] ?? 0),
      },
      naoRecuperaveis: naoRecuperaveis + other.naoRecuperaveis,
    );
  }

  MaterialSample operator -(MaterialSample other) {
    return MaterialSample(
      materials: {
        for (final m in {...materials.keys, ...other.materials.keys})
          m: (materials[m] ?? 0) - (other.materials[m] ?? 0),
      },
      naoRecuperaveis: naoRecuperaveis - other.naoRecuperaveis,
    );
  }

  MaterialSample operator *(MaterialSample other) {
    return MaterialSample(
      materials: {
        for (final m in {...materials.keys, ...other.materials.keys})
          m: (materials[m] ?? 0) * (other.materials[m] ?? 0),
      },
      naoRecuperaveis: naoRecuperaveis * other.naoRecuperaveis,
    );
  }

  MaterialSample mulAll(double other) {
    return MaterialSample(
      materials: {
        for (final m in materials.entries) m.key: m.value * other,
      },
      naoRecuperaveis: naoRecuperaveis * other,
    );
  }

  MaterialSample divAll(double other) {
    return MaterialSample(
      materials: {
        for (final m in materials.entries) m.key: m.value / other,
      },
      naoRecuperaveis: naoRecuperaveis / other,
    );
  }

  MaterialSample replaceNans(double value) {
    return MaterialSample(
      materials: {
        for (final m in materials.entries)
          m.key: m.value.isNaN ? value : m.value,
      },
      naoRecuperaveis: naoRecuperaveis.isNaN ? value : naoRecuperaveis,
    );
  }

  double sum() {
    return materials.values.fold<double>(0, (p, e) => p + e) + naoRecuperaveis;
  }

  RMaterial max() {
    var maxValue = naoRecuperaveis;
    var max = RMaterial.naoRecuperaveis;
    for (final m in materials.entries) {
      if (m.value > maxValue) {
        maxValue = m.value;
        max = m.key;
      }
    }
    return max;
  }

  RMaterial? getCandidate(double threshold) {
    RMaterial? candidate;
    for (final m in materials.entries) {
      if (m.value > threshold) {
        if (candidate != null) return null;
        candidate = m.key;
      }
    }
    if (naoRecuperaveis > threshold) {
      if (candidate != null) return null;
      candidate = RMaterial.naoRecuperaveis;
    }
    return candidate;
  }
}
