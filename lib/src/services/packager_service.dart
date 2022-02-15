import 'package:flutter/material.dart';
import 'package:simtech/src/constants/colors.dart';
import 'package:simtech/src/data/packager_data.dart';
import 'package:simtech/src/models/answer.dart';
import 'package:simtech/src/models/enums.dart';
import 'package:simtech/src/models/package_impact.dart';
import 'package:simtech/src/models/question.dart';
import 'package:tuple/tuple.dart';

enum Rating { a, b, c, d, e, f }

extension RatingDetails on Rating {
  Color get color {
    switch (this) {
      case Rating.a:
        return AppColors.ratingA;
      case Rating.b:
        return AppColors.ratingB;
      case Rating.c:
        return AppColors.ratingC;
      case Rating.d:
        return AppColors.ratingD;
      case Rating.e:
        return AppColors.ratingE;
      case Rating.f:
        return AppColors.ratingF;
    }
  }

  double get potential {
    switch (this) {
      case Rating.a:
        return 1;
      case Rating.b:
        return 0.9;
      case Rating.c:
        return 0.85;
      case Rating.d:
        return 0.75;
      case Rating.e:
        return 0.7;
      case Rating.f:
        return 0;
    }
  }
}

class PackagerService {
  static List<Question> getQuestions() {
    return questions.map(Question.fromJson).toList();
  }

  static Rating getRating({
    required PMaterial material,
    required List<Answer> answers,
  }) {
    var sum = 17;
    for (final a in answers) {
      sum += a.getValue(material) ?? 0;
    }
    if (sum >= 17) {
      return Rating.a;
    } else if (sum >= 15) {
      return Rating.b;
    } else if (sum >= 13) {
      return Rating.c;
    } else if (sum >= 10) {
      return Rating.d;
    } else if (sum >= 8) {
      return Rating.e;
    } else {
      return Rating.f;
    }
  }

  static bool validateQuestion({
    required Map<int, Answer> answers,
    required Question question,
  }) {
    final requirement = question.requirement;
    if (requirement == null) return true;

    final answer = answers[requirement.question];
    if (answer == null) return false;

    return requirement.answers.contains(answer.id);
  }

  static bool validateAnswers({
    required Map<int, Answer> answers,
    required PMaterial? material,
  }) {
    if (material == null) return false;
    final questions = getQuestions();

    final requiredQuestions = questions
        .where((q) => validateQuestion(answers: answers, question: q))
        .toList();

    for (final q in requiredQuestions) {
      if (!answers.containsKey(q.id)) return false;
    }

    return true;
  }

  static List<Tuple2<String, String>> getRecommendations({
    required Map<int, Answer> answers,
    required PMaterial material,
  }) {
    final recommendations = <Tuple2<String, String>>[];
    for (final a in answers.values) {
      final critical = a.recommendation;
      final alternative = a.getRecommendation(material);
      if (critical != null && alternative != null) {
        recommendations.add(Tuple2(critical, alternative));
      }
    }
    return recommendations;
  }

  static const _ratingToDescription = {
    Rating.a:
        'As características de conceção da sua embalagem permitem que seja totalmente reciclável. Caso aplicável, consulte a lista de recomendações apresentada para as características que ainda podem ser melhoradas.',
    Rating.b:
        'A sua embalagem reúne uma ou mais características que podem afetar ligeiramente a reciclabilidade, mas sem comprometer a sua recuperação nas estações de triagem para que possa ser encaminhada para reciclagem. Consulte a lista de recomendações apresentada para as características de conceção que podem ser melhoradas.',
    Rating.c:
        'A sua embalagem reúne uma ou mais características que podem condicionar moderadamente a reciclabilidade, assim como reduzir a probabilidade de os materiais da embalagem serem recuperados nas estações de triagem e posteriormente encaminhados para reciclagem. Consulte a lista de recomendações apresentada para as características de conceção que devem ser melhoradas.',
    Rating.d:
        'A sua embalagem reúne uma ou mais características que condicionam a reciclabilidade, assim como reduzem a capacidade de recuperação dos materiais da embalagem nas estações de triagem e posteriormente encaminhamento para reciclagem. Consulte a lista de recomendações apresentada para as características de conceção que devem ser melhoradas.',
    Rating.e:
        'A sua embalagem reúne uma ou mais características que condicionam muito a reciclabilidade, impedindo a capacidade de recuperação dos materiais da embalagem nas estações de triagem, não podendo ser encaminhados para reciclagem. Consulte a lista de recomendações apresentada para as características de conceção que devem ser melhoradas.',
    Rating.f:
        'A sua embalagem reúne uma ou mais características que condicionam totalmente a reciclabilidade, impedindo a capacidade de recuperação dos materiais da embalagem nas estações de triagem, não podendo ser encaminhados para reciclagem. Consulte a lista de recomendações apresentada para as características de conceção que devem ser melhoradas.',
  };

  static String getRatingDescription(Rating rating) =>
      _ratingToDescription[rating] ?? '';

  static const aMap = <PMaterial, double>{
    PMaterial.vidro: 0.2,
    PMaterial.aco: 0.2,
    PMaterial.aluminio: 0.2,
    PMaterial.pet: 0.5,
    PMaterial.pead: 0.5,
    PMaterial.pebd: 0.5,
    PMaterial.eps: 0.5,
    PMaterial.pp: 0.5,
    PMaterial.outrosPlasticos: 0.5,
    PMaterial.ecal: 0.5,
    PMaterial.papel: 0.2,
    PMaterial.cartao: 0.2,
  };

  static const sinMap = <PMaterial, double>{
    PMaterial.vidro: 1,
    PMaterial.aco: 1,
    PMaterial.aluminio: 1,
    PMaterial.pet: 0.9,
    PMaterial.pead: 0.9,
    PMaterial.pebd: 0.75,
    PMaterial.eps: 0.75,
    PMaterial.pp: 0.9,
    PMaterial.outrosPlasticos: 0.9,
    PMaterial.ecal: 0.85,
    PMaterial.papel: 0.85,
    PMaterial.cartao: 0.85,
  };

  static const soutMap = <PMaterial, double>{
    PMaterial.vidro: 1,
    PMaterial.aco: 1,
    PMaterial.aluminio: 1,
    PMaterial.pet: 0.9,
    PMaterial.pead: 0.9,
    PMaterial.pebd: 0.75,
    PMaterial.eps: 0.75,
    PMaterial.pp: 0.9,
    PMaterial.outrosPlasticos: 0.9,
    PMaterial.ecal: 0.85,
    PMaterial.papel: 0.85,
    PMaterial.cartao: 0.85,
  };

  static const bMap = <PMaterial, double>{
    PMaterial.vidro: 0,
    PMaterial.aco: 0,
    PMaterial.aluminio: 0,
    PMaterial.pet: 0,
    PMaterial.pead: 0,
    PMaterial.pebd: 0,
    PMaterial.eps: 0,
    PMaterial.pp: 0,
    PMaterial.outrosPlasticos: 0,
    PMaterial.ecal: 0,
    PMaterial.papel: 0,
    PMaterial.cartao: 0,
  };

  static const lhvMap = <PMaterial, double>{
    PMaterial.vidro: -0.00555556,
    PMaterial.aco: -0.00555556,
    PMaterial.aluminio: -0.00555556,
    PMaterial.pet: 7.11945014,
    PMaterial.pead: 7.11945014,
    PMaterial.pebd: 7.11945014,
    PMaterial.eps: 7.11945014,
    PMaterial.pp: 7.11945014,
    PMaterial.outrosPlasticos: 7.11945014,
    PMaterial.ecal: 3.01111352,
    PMaterial.papel: 3.01111352,
    PMaterial.cartao: 3.01111352,
  };

  static const evMap = <PMaterial, double>{
    PMaterial.papel: 1.30637282600000,
    PMaterial.cartao: 0.77339966500000,
    PMaterial.ecal: 1.92160738500000,
    PMaterial.vidro: 1.26207242200000,
    PMaterial.aco: 2.09492328200000,
    PMaterial.aluminio: 19.6110164400000,
    PMaterial.pet: 3.82377621539920,
    PMaterial.pead: 2.79863413114644,
    PMaterial.pebd: 2.45527042364000,
    PMaterial.eps: 3.72564350600000,
    PMaterial.pp: 2.78532057247041,
    PMaterial.outrosPlasticos: 3.45243818179074,
  };

  static const erecycledMap = <PMaterial, double>{
    PMaterial.papel: 1.437710111859840,
    PMaterial.cartao: 0.853332379874917,
    PMaterial.ecal: 0.731627912000000,
    PMaterial.vidro: 0.997140261077844,
    PMaterial.aco: 0.682783764362378,
    PMaterial.aluminio: 0.584939072747455,
    PMaterial.pet: 1.022421466250000,
    PMaterial.pead: 0.384816452432500,
    PMaterial.pebd: 0.677172920756443,
    PMaterial.eps: 0.677172920756443,
    PMaterial.pp: 0.677172920756443,
    PMaterial.outrosPlasticos: 0.677172920756443,
  };

  static const ereceolMap = <PMaterial, double>{
    PMaterial.papel: 0.807365291572000,
    PMaterial.cartao: 0.720654085030306,
    PMaterial.ecal: 0.731627912000000,
    PMaterial.vidro: 0.698680227710000,
    PMaterial.aco: 0.544059796339510,
    PMaterial.aluminio: 0.575390047770198,
    PMaterial.pet: 0.672699345000000,
    PMaterial.pead: 0.348527260208314,
    PMaterial.pebd: 0.527054561897874,
    PMaterial.eps: 0.527054561897874,
    PMaterial.pp: 0.621015056897874,
    PMaterial.outrosPlasticos: 0.527054561897874,
  };

  static const edMap = <PMaterial, double>{
    PMaterial.papel: 1.8469708820,
    PMaterial.cartao: 1.8469708820,
    PMaterial.ecal: 1.1530396484,
    PMaterial.vidro: 0.0080415570,
    PMaterial.aco: 0.0086443530,
    PMaterial.aluminio: 0.0130592450,
    PMaterial.pet: 0.1431767990,
    PMaterial.pead: 0.1431767990,
    PMaterial.pebd: 0.1431767990,
    PMaterial.eps: 0.1121427980,
    PMaterial.pp: 0.1218560350,
    PMaterial.outrosPlasticos: 0.1121427980,
  };

  static const eerMap = <PMaterial, double>{
    PMaterial.papel: 0.0231414590,
    PMaterial.cartao: 0.0231414590,
    PMaterial.ecal: 0.9523313122,
    PMaterial.vidro: 0.0127948280,
    PMaterial.aco: 0.0104051270,
    PMaterial.aluminio: 0.0160623730,
    PMaterial.pet: 2.9932185980,
    PMaterial.pead: 2.9932185980,
    PMaterial.pebd: 2.9932185980,
    PMaterial.eps: 3.1742333490,
    PMaterial.pp: 2.5322341270,
    PMaterial.outrosPlasticos: 2.3461160920,
  };

  static const evastMap = <PMaterial, double>{
    PMaterial.papel: 0.96932863689200,
    PMaterial.cartao: 0.58909828657009,
    PMaterial.ecal: 0.36010492470000,
    PMaterial.vidro: 1.05383047237000,
    PMaterial.aco: 1.85163335565978,
    PMaterial.aluminio: 19.4364783936839,
    PMaterial.pet: 2.40295621280000,
    PMaterial.pead: 1.87211016343883,
    PMaterial.pebd: 1.76495189325347,
    PMaterial.eps: 3.25012679588134,
    PMaterial.pp: 1.71712706449315,
    PMaterial.outrosPlasticos: 0.22626674837260,
  };

  static PackageImpact getPackageImpact({
    required PMaterial material,
    required int weight,
    required double recycledPercentage,
    required Rating rating,
  }) {
    final r1 = recycledPercentage;
    final r2 = rating.potential;
    final r3 = (1 - r2) * 0.27;

    final a = aMap[material]!;
    final qsin = sinMap[material]!;
    final qsout = soutMap[material]!;
    final b = bMap[material]!;

    final lhv = lhvMap[material]!;
    const eficiencaEletrica = 0.3;
    const pu = 0.259743372;

    final ev = evMap[material]!;
    final erecycled = erecycledMap[material]!;
    final ereceol = ereceolMap[material]!;
    final ed = edMap[material]!;
    final eer = eerMap[material]!;
    final evast = evastMap[material]!;

    final eol = ((1 - a) * r2 * (ereceol - (evast * qsout)) +
            (1 - b) * r3 * (eer - (lhv * eficiencaEletrica * pu)) +
            (1 - r2 - r3) * ed) *
        (weight / 1000);
    final materiais = ((1 - r1) * ev) +
        (r1 * (a * erecycled + (1 - a) * ev * qsin)) * (weight / 1000);
    final impacteTotal = materiais + eol;
    final producao = ev * (weight / 1000);
    final incorporacao = (ev * (weight / 1000)) - materiais;

    return PackageImpact(
      producao: producao,
      incorporacao: incorporacao,
      eol: eol,
      impacteTotal: impacteTotal,
    );
  }
}
