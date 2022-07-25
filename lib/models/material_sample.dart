import 'package:freezed_annotation/freezed_annotation.dart';

part 'material_sample.freezed.dart';

@freezed
class MaterialSample with _$MaterialSample {
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
  }) = MaterialSamplePM;
  const factory MaterialSample.pc({
    @Default(0) double papel,
    @Default(0) double cartao,
    @Default(0) double jornaisRevistas,
    @Default(0) double naoRecuperaveis,
  }) = MaterialSamplePC;
  const MaterialSample._();

  int length() => map(pm: (_) => 9, pc: (_) => 4);

  MaterialSample operator +(MaterialSample other) {
    if (runtimeType != other.runtimeType) throw Exception('Oopsie Daisy');
    return map(
      pm: (sample) {
        other as MaterialSamplePM;
        return MaterialSample.pm(
          ecal: sample.ecal + other.ecal,
          filmePlastico: sample.filmePlastico + other.filmePlastico,
          pet: sample.pet + other.pet,
          petOleo: sample.petOleo + other.petOleo,
          pead: sample.pead + other.pead,
          plasticosMistos: sample.plasticosMistos + other.plasticosMistos,
          metaisFerrosos: sample.metaisFerrosos + other.metaisFerrosos,
          metaisNaoFerrosos: sample.metaisNaoFerrosos + other.metaisNaoFerrosos,
          naoRecuperaveis: naoRecuperaveis + other.naoRecuperaveis,
        );
      },
      pc: (sample) {
        other as MaterialSamplePC;
        return MaterialSample.pc(
          papel: sample.papel + other.papel,
          cartao: sample.cartao + other.cartao,
          jornaisRevistas: sample.jornaisRevistas + other.jornaisRevistas,
          naoRecuperaveis: naoRecuperaveis + other.naoRecuperaveis,
        );
      },
    );
  }

  MaterialSample operator -(MaterialSample other) {
    if (runtimeType != other.runtimeType) throw Exception('Oopsie Daisy');
    return map(
      pm: (sample) {
        other as MaterialSamplePM;
        return MaterialSample.pm(
          ecal: sample.ecal - other.ecal,
          filmePlastico: sample.filmePlastico - other.filmePlastico,
          pet: sample.pet - other.pet,
          petOleo: sample.petOleo - other.petOleo,
          pead: sample.pead - other.pead,
          plasticosMistos: sample.plasticosMistos - other.plasticosMistos,
          metaisFerrosos: sample.metaisFerrosos - other.metaisFerrosos,
          metaisNaoFerrosos: sample.metaisNaoFerrosos - other.metaisNaoFerrosos,
          naoRecuperaveis: naoRecuperaveis - other.naoRecuperaveis,
        );
      },
      pc: (sample) {
        other as MaterialSamplePC;
        return MaterialSample.pc(
          papel: sample.papel - other.papel,
          cartao: sample.cartao - other.cartao,
          jornaisRevistas: sample.jornaisRevistas - other.jornaisRevistas,
          naoRecuperaveis: naoRecuperaveis - other.naoRecuperaveis,
        );
      },
    );
  }

  MaterialSample operator *(MaterialSample other) {
    if (runtimeType != other.runtimeType) throw Exception('Oopsie Daisy');
    return map(
      pm: (sample) {
        other as MaterialSamplePM;
        return MaterialSample.pm(
          ecal: sample.ecal * other.ecal,
          filmePlastico: sample.filmePlastico * other.filmePlastico,
          pet: sample.pet * other.pet,
          petOleo: sample.petOleo * other.petOleo,
          pead: sample.pead * other.pead,
          plasticosMistos: sample.plasticosMistos * other.plasticosMistos,
          metaisFerrosos: sample.metaisFerrosos * other.metaisFerrosos,
          metaisNaoFerrosos: sample.metaisNaoFerrosos * other.metaisNaoFerrosos,
          naoRecuperaveis: naoRecuperaveis * other.naoRecuperaveis,
        );
      },
      pc: (sample) {
        other as MaterialSamplePC;
        return MaterialSample.pc(
          papel: sample.papel * other.papel,
          cartao: sample.cartao * other.cartao,
          jornaisRevistas: sample.jornaisRevistas * other.jornaisRevistas,
          naoRecuperaveis: naoRecuperaveis * other.naoRecuperaveis,
        );
      },
    );
  }

  MaterialSample operator /(MaterialSample other) {
    if (runtimeType != other.runtimeType) throw Exception('Oopsie Daisy');
    return map(
      pm: (sample) {
        other as MaterialSamplePM;
        return MaterialSample.pm(
          ecal: sample.ecal / other.ecal,
          filmePlastico: sample.filmePlastico / other.filmePlastico,
          pet: sample.pet / other.pet,
          petOleo: sample.petOleo / other.petOleo,
          pead: sample.pead / other.pead,
          plasticosMistos: sample.plasticosMistos / other.plasticosMistos,
          metaisFerrosos: sample.metaisFerrosos / other.metaisFerrosos,
          metaisNaoFerrosos: sample.metaisNaoFerrosos / other.metaisNaoFerrosos,
          naoRecuperaveis: naoRecuperaveis / other.naoRecuperaveis,
        );
      },
      pc: (sample) {
        other as MaterialSamplePC;
        return MaterialSample.pc(
          papel: sample.papel / other.papel,
          cartao: sample.cartao / other.cartao,
          jornaisRevistas: sample.jornaisRevistas / other.jornaisRevistas,
          naoRecuperaveis: naoRecuperaveis / other.naoRecuperaveis,
        );
      },
    );
  }

  MaterialSample mulAll(double other) {
    return map(
      pm: (sample) {
        return MaterialSample.pm(
          ecal: sample.ecal * other,
          filmePlastico: sample.filmePlastico * other,
          pet: sample.pet * other,
          petOleo: sample.petOleo * other,
          pead: sample.pead * other,
          plasticosMistos: sample.plasticosMistos * other,
          metaisFerrosos: sample.metaisFerrosos * other,
          metaisNaoFerrosos: sample.metaisNaoFerrosos * other,
          naoRecuperaveis: naoRecuperaveis * other,
        );
      },
      pc: (sample) {
        return MaterialSample.pc(
          papel: sample.papel * other,
          cartao: sample.cartao * other,
          jornaisRevistas: sample.jornaisRevistas * other,
          naoRecuperaveis: naoRecuperaveis * other,
        );
      },
    );
  }

  MaterialSample divAll(double other) {
    return map(
      pm: (sample) {
        return MaterialSample.pm(
          ecal: sample.ecal / other,
          filmePlastico: sample.filmePlastico / other,
          pet: sample.pet / other,
          petOleo: sample.petOleo / other,
          pead: sample.pead / other,
          plasticosMistos: sample.plasticosMistos / other,
          metaisFerrosos: sample.metaisFerrosos / other,
          metaisNaoFerrosos: sample.metaisNaoFerrosos / other,
          naoRecuperaveis: naoRecuperaveis / other,
        );
      },
      pc: (sample) {
        return MaterialSample.pc(
          papel: sample.papel / other,
          cartao: sample.cartao / other,
          jornaisRevistas: sample.jornaisRevistas / other,
          naoRecuperaveis: naoRecuperaveis / other,
        );
      },
    );
  }

  double sum() {
    return map(
      pm: (sample) {
        return sample.ecal +
            sample.filmePlastico +
            sample.pet +
            sample.petOleo +
            sample.pead +
            sample.plasticosMistos +
            sample.metaisFerrosos +
            sample.metaisNaoFerrosos +
            sample.naoRecuperaveis;
      },
      pc: (sample) {
        return sample.papel +
            sample.cartao +
            sample.jornaisRevistas +
            sample.naoRecuperaveis;
      },
    );
  }

  MaterialSample max() {
    var max = 0.0;
    return map(
      pm: (sample) {
        var maxFilter = const MaterialSamplePM();
        if (sample.ecal >= max) {
          max = sample.ecal;
          maxFilter = const MaterialSamplePM(ecal: 1);
        }
        if (sample.filmePlastico >= max) {
          max = sample.filmePlastico;
          maxFilter = const MaterialSamplePM(filmePlastico: 1);
        }
        if (sample.pet >= max) {
          max = sample.pet;
          maxFilter = const MaterialSamplePM(pet: 1);
        }
        if (sample.petOleo >= max) {
          max = sample.petOleo;
          maxFilter = const MaterialSamplePM(petOleo: 1);
        }
        if (sample.pead >= max) {
          max = sample.pead;
          maxFilter = const MaterialSamplePM(pead: 1);
        }
        if (sample.plasticosMistos >= max) {
          max = sample.plasticosMistos;
          maxFilter = const MaterialSamplePM(plasticosMistos: 1);
        }
        if (sample.metaisFerrosos >= max) {
          max = sample.metaisFerrosos;
          maxFilter = const MaterialSamplePM(metaisFerrosos: 1);
        }
        if (sample.metaisNaoFerrosos >= max) {
          max = sample.metaisNaoFerrosos;
          maxFilter = const MaterialSamplePM(metaisNaoFerrosos: 1);
        }
        if (sample.naoRecuperaveis >= max) {
          max = sample.naoRecuperaveis;
          maxFilter = const MaterialSamplePM(naoRecuperaveis: 1);
        }
        return maxFilter;
      },
      pc: (sample) {
        var maxFilter = const MaterialSamplePC();
        if (sample.papel >= max) {
          max = sample.papel;
          maxFilter = const MaterialSamplePC(papel: 1);
        }
        if (sample.cartao >= max) {
          max = sample.cartao;
          maxFilter = const MaterialSamplePC(cartao: 1);
        }
        if (sample.jornaisRevistas >= max) {
          max = sample.jornaisRevistas;
          maxFilter = const MaterialSamplePC(jornaisRevistas: 1);
        }
        if (sample.naoRecuperaveis >= max) {
          max = sample.naoRecuperaveis;
          maxFilter = const MaterialSamplePC(naoRecuperaveis: 1);
        }
        return maxFilter;
      },
    );
  }

  MaterialSample filterByValue(double value) {
    var hasCandidate = false;
    return map(
      pm: (sample) {
        var filter = const MaterialSamplePM();
        if (sample.ecal >= value) {
          hasCandidate = true;
          filter = const MaterialSamplePM(ecal: 1);
        }
        if (sample.filmePlastico >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(filmePlastico: 1);
        }
        if (sample.pet >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(pet: 1);
        }
        if (sample.petOleo >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(petOleo: 1);
        }
        if (sample.pead >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(pead: 1);
        }
        if (sample.plasticosMistos >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(plasticosMistos: 1);
        }
        if (sample.metaisFerrosos >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(metaisFerrosos: 1);
        }
        if (sample.metaisNaoFerrosos >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(metaisNaoFerrosos: 1);
        }
        if (sample.naoRecuperaveis >= value) {
          if (hasCandidate) {
            return const MaterialSamplePM();
          }
          hasCandidate = true;
          filter = const MaterialSamplePM(naoRecuperaveis: 1);
        }
        return filter;
      },
      pc: (sample) {
        var filter = const MaterialSamplePC();
        if (sample.papel >= value) {
          hasCandidate = true;
          filter = const MaterialSamplePC(papel: 1);
        }
        if (sample.cartao >= value) {
          if (hasCandidate) {
            return const MaterialSamplePC();
          }
          hasCandidate = true;
          filter = const MaterialSamplePC(cartao: 1);
        }
        if (sample.jornaisRevistas >= value) {
          if (hasCandidate) {
            return const MaterialSamplePC();
          }
          hasCandidate = true;
          filter = const MaterialSamplePC(jornaisRevistas: 1);
        }
        if (sample.naoRecuperaveis >= value) {
          if (hasCandidate) {
            return const MaterialSamplePC();
          }
          hasCandidate = true;
          filter = const MaterialSamplePC(naoRecuperaveis: 1);
        }
        return filter;
      },
    );
  }

  MaterialSample replaceNans(double value) {
    return map(
      pm: (sample) => MaterialSamplePM(
        ecal: sample.ecal.isNaN ? value : sample.ecal,
        filmePlastico:
            sample.filmePlastico.isNaN ? value : sample.filmePlastico,
        pet: sample.pet.isNaN ? value : sample.pet,
        petOleo: sample.petOleo.isNaN ? value : sample.petOleo,
        pead: sample.pead.isNaN ? value : sample.pead,
        plasticosMistos:
            sample.plasticosMistos.isNaN ? value : sample.plasticosMistos,
        metaisFerrosos:
            sample.metaisFerrosos.isNaN ? value : sample.metaisFerrosos,
        metaisNaoFerrosos:
            sample.metaisNaoFerrosos.isNaN ? value : sample.metaisNaoFerrosos,
        naoRecuperaveis: naoRecuperaveis.isNaN ? value : naoRecuperaveis,
      ),
      pc: (sample) => MaterialSamplePC(
        papel: sample.papel.isNaN ? value : sample.papel,
        cartao: sample.cartao.isNaN ? value : sample.cartao,
        jornaisRevistas:
            sample.jornaisRevistas.isNaN ? value : sample.jornaisRevistas,
        naoRecuperaveis: naoRecuperaveis.isNaN ? value : naoRecuperaveis,
      ),
    );
  }
}
