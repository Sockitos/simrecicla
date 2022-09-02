import 'package:flutter/material.dart';
import 'package:simtech/constants/colors.dart';
import 'package:simtech/data/packager_data.dart';
import 'package:simtech/models/answer.dart';
import 'package:simtech/models/enums.dart';
import 'package:simtech/models/package_impact.dart';
import 'package:simtech/models/question.dart';
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
    PMaterial.pet: 1,
    PMaterial.pead: 1,
    PMaterial.pebd: 1,
    PMaterial.eps: 1,
    PMaterial.pp: 1,
    PMaterial.outrosPlasticos: 1,
    PMaterial.ecal: 1,
    PMaterial.papel: 1,
    PMaterial.cartao: 1,
  };

  static const soutMap = <PMaterial, double>{
    PMaterial.vidro: 1,
    PMaterial.aco: 1,
    PMaterial.aluminio: 1,
    PMaterial.pet: 1,
    PMaterial.pead: 1,
    PMaterial.pebd: 1,
    PMaterial.eps: 1,
    PMaterial.pp: 1,
    PMaterial.outrosPlasticos: 1,
    PMaterial.ecal: 1,
    PMaterial.papel: 1,
    PMaterial.cartao: 1,
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
    PMaterial.vidro: 0,
    PMaterial.aco: 0,
    PMaterial.aluminio: 0,
    PMaterial.pet: 7.11945014,
    PMaterial.pead: 7.11945014,
    PMaterial.pebd: 7.11945014,
    PMaterial.eps: 7.11945014,
    PMaterial.pp: 7.11945014,
    PMaterial.outrosPlasticos: 7.11945014,
    PMaterial.ecal: 3.7534196694,
    PMaterial.papel: 3.01111352,
    PMaterial.cartao: 3.01111352,
  };

  static const evMap = <PMaterial, double>{
    PMaterial.papel: 1.306372826,
    PMaterial.cartao: 0.640671321,
    PMaterial.ecal: 1.921607385,
    PMaterial.vidro: 1.262072422,
    PMaterial.aco: 2.094923282,
    PMaterial.aluminio: 19.611016440,
    PMaterial.pet: 3.003695266,
    PMaterial.pead: 1.981628608,
    PMaterial.pebd: 2.023176932,
    PMaterial.eps: 3.725643506,
    PMaterial.pp: 1.968354990,
    PMaterial.outrosPlasticos: 2.513638265,
  };

  static const erecycledMap = <PMaterial, double>{
    PMaterial.papel: 1.049480451132000,
    PMaterial.cartao: 0.427792406398400,
    PMaterial.ecal: 0.682674786140593,
    PMaterial.vidro: 0.829253311565000,
    PMaterial.aco: 0.814024028393000,
    PMaterial.aluminio: 1.067753310901160,
    PMaterial.pet: 1.639968058960880,
    PMaterial.pead: 1.167603887874620,
    PMaterial.pebd: 0.997647876162264,
    PMaterial.eps: 0.594135218786533,
    PMaterial.pp: 1.403058309749780,
    PMaterial.outrosPlasticos: 1.519620709074980,
  };

  static const ereceolMap = <PMaterial, double>{
    PMaterial.papel: 1.414394138991910,
    PMaterial.cartao: 0.395957429098852,
    PMaterial.ecal: 1.155006298936210,
    PMaterial.vidro: 0.993564719045931,
    PMaterial.aco: 0.539074877076000,
    PMaterial.aluminio: 0.570288219262000,
    PMaterial.pet: 0.664267391000000,
    PMaterial.pead: 0.339555411640000,
    PMaterial.pebd: 0.518382978391250,
    PMaterial.eps: 0.518382978391250,
    PMaterial.pp: 0.121856035000000,
    PMaterial.outrosPlasticos: 0.518382978391250,
  };

  static const edMap = <PMaterial, double>{
    PMaterial.papel: 1.691104081709160,
    PMaterial.cartao: 1.691104081709160,
    PMaterial.ecal: 1.298995723619230,
    PMaterial.vidro: 0.993564719045931,
    PMaterial.aco: 0.008644353000000,
    PMaterial.aluminio: 0.013059245000000,
    PMaterial.pet: 0.143176799000000,
    PMaterial.pead: 0.143176799000000,
    PMaterial.pebd: 0.143176799000000,
    PMaterial.eps: 0.112142798000000,
    PMaterial.pp: 0.121856035000000,
    PMaterial.outrosPlasticos: 0.112142798000000,
  };

  static const eerMap = <PMaterial, double>{
    PMaterial.papel: 0.02314145900,
    PMaterial.cartao: 0.02314145900,
    PMaterial.ecal: 0.51068296849,
    PMaterial.vidro: 0.01279482800,
    PMaterial.aco: 0.01040512700,
    PMaterial.aluminio: 0.01606237300,
    PMaterial.pet: 2.99321859800,
    PMaterial.pead: 2.99321859800,
    PMaterial.pebd: 2.99321859800,
    PMaterial.eps: 3.17423334900,
    PMaterial.pp: 2.53223412700,
    PMaterial.outrosPlasticos: 2.34611609200,
  };

  static const evastMap = <PMaterial, double>{
    PMaterial.papel: 1.760610277628030,
    PMaterial.cartao: 0.435138709274343,
    PMaterial.ecal: 0.295486173745000,
    PMaterial.vidro: 1.512158959457010,
    PMaterial.aco: 1.851912181288000,
    PMaterial.aluminio: 19.434517292040000,
    PMaterial.pet: 2.402956212800000,
    PMaterial.pead: 1.872639034560000,
    PMaterial.pebd: 1.765221873170000,
    PMaterial.eps: 3.250623958985000,
    PMaterial.pp: 1.717389728775000,
    PMaterial.outrosPlasticos: 0.139980222540424,
  };

  static PackageImpact getPackageImpact({
    required PMaterial material,
    required int weight,
    required double recycledPercentage,
    required Rating rating,
  }) {
    final r1 = recycledPercentage;
    final r2 = rating.potential;
    final r3 = (1 - r2) * 27 / 100;

    final a = aMap[material]!;
    final qsin = sinMap[material]!;
    final qsout = soutMap[material]!;
    final b = bMap[material]!;

    final lhv = lhvMap[material]!;
    const eficiencaEletrica = 0.3;
    const pu = 0.398805993;

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
    final materiais =
        (((1 - r1) * ev) + (r1 * (a * erecycled + (1 - a) * ev * qsin))) *
            (weight / 1000);
    final impacteTotal = materiais + eol;
    final producao = ev * (weight / 1000);
    final incorporacao = producao - materiais;

    return PackageImpact(
      producao: producao,
      incorporacao: incorporacao,
      eol: eol,
      impacteTotal: impacteTotal,
    );
  }
}
