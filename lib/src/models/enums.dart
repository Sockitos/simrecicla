enum PMaterial {
  vidro,
  aco,
  aluminio,
  pet,
  pead,
  pebd,
  eps,
  pp,
  outrosPlasticos,
  ecal,
  papel,
  cartao,
}

extension PMaterialUtils on PMaterial {
  String toStr() {
    switch (this) {
      case PMaterial.vidro:
        return 'Vidro';
      case PMaterial.aco:
        return 'Aço';

      case PMaterial.aluminio:
        return 'Alumínio';

      case PMaterial.pet:
        return 'PET';

      case PMaterial.pead:
        return 'PEAD';

      case PMaterial.pebd:
        return 'PEBD';

      case PMaterial.eps:
        return 'EPS';

      case PMaterial.pp:
        return 'PP';

      case PMaterial.outrosPlasticos:
        return 'Outros Plástics';

      case PMaterial.ecal:
        return 'ECAL';

      case PMaterial.papel:
        return 'Papel';

      case PMaterial.cartao:
        return 'Cartão';
    }
  }
}
