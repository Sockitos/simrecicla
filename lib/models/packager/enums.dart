import 'package:flutter/painting.dart';
import 'package:simtech/constants/colors.dart';

enum PMaterial {
  vidro('Vidro'),
  aco('Aço'),
  aluminio('Alumínio'),
  pet('PET'),
  pead('PEAD'),
  pebd('PEBD'),
  eps('EPS'),
  pp('PP'),
  outrosPlasticos('Outros Plásticos'),
  ecal('ECAL'),
  papel('Papel'),
  cartao('Cartão');

  const PMaterial(this.name);
  final String name;
}

enum Rating {
  a(
    AppColors.ratingA,
    1,
    'As características de conceção da sua embalagem permitem que seja totalmente reciclável. Caso aplicável, consulte a lista de recomendações apresentada para as características que ainda podem ser melhoradas.',
  ),
  b(
    AppColors.ratingB,
    0.9,
    'A sua embalagem reúne uma ou mais características que podem afetar ligeiramente a reciclabilidade, mas sem comprometer a sua recuperação nas estações de triagem para que possa ser encaminhada para reciclagem.',
  ),
  c(
    AppColors.ratingC,
    0.85,
    'A sua embalagem reúne uma ou mais características que podem condicionar moderadamente a reciclabilidade, assim como reduzir a probabilidade de os materiais da embalagem serem recuperados nas estações de triagem e posteriormente encaminhados para reciclagem.',
  ),
  d(
    AppColors.ratingD,
    0.75,
    'A sua embalagem reúne uma ou mais características que condicionam a reciclabilidade, assim como reduzem a capacidade de recuperação dos materiais da embalagem nas estações de triagem e posteriormente encaminhamento para reciclagem.',
  ),
  e(
    AppColors.ratingE,
    0.7,
    'A sua embalagem reúne uma ou mais características que condicionam muito a reciclabilidade, impedindo a capacidade de recuperação dos materiais da embalagem nas estações de triagem, não podendo ser encaminhados para reciclagem.',
  ),
  f(
    AppColors.ratingF,
    0,
    'A sua embalagem reúne uma ou mais características que condicionam totalmente a reciclabilidade, impedindo a capacidade de recuperação dos materiais da embalagem nas estações de triagem, não podendo ser encaminhados para reciclagem.',
  );

  const Rating(this.color, this.potential, this.description);
  final Color color;
  final double potential;
  final String description;
}
