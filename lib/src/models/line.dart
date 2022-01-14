class Line {
  const Line({
    this.papel = 0.0,
    this.cartao = 0.0,
    this.ecal = 0.0,
    this.filmePlastico = 0.0,
    this.pet = 0.0,
    this.pead = 0.0,
    this.plasticosMistos = 0.0,
    this.metaisFerrosos = 0.0,
    this.metaisNaoFerrosos = 0.0,
    this.vidro = 0.0,
    this.eps = 0.0,
    this.fracaoResto = 0.0,
  });

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
        fracaoResto: value,
      );

  static const Line zero = Line();

  final double papel;
  final double cartao;
  final double ecal;
  final double filmePlastico;
  final double pet;
  final double pead;
  final double plasticosMistos;
  final double metaisFerrosos;
  final double metaisNaoFerrosos;
  final double vidro;
  final double eps;
  final double fracaoResto;

  @override
  String toString() {
    return '| ${papel.toStringAsFixed(7)} | ${cartao.toStringAsFixed(7)} | ${ecal.toStringAsFixed(7)} | ${filmePlastico.toStringAsFixed(7)} | ${pet.toStringAsFixed(7)} | ${pead.toStringAsFixed(7)} | ${plasticosMistos.toStringAsFixed(7)} | ${metaisFerrosos.toStringAsFixed(7)} | ${vidro.toStringAsFixed(7)} | ${eps.toStringAsFixed(7)} | ${fracaoResto.toStringAsFixed(7)} |';
  }

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
        eps +
        fracaoResto;
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
      fracaoResto: fracaoResto + other.fracaoResto,
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
      fracaoResto: fracaoResto - other.fracaoResto,
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
      fracaoResto: fracaoResto * other.fracaoResto,
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
      fracaoResto: fracaoResto + other,
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
      fracaoResto: fracaoResto * other,
    );
  }
}
