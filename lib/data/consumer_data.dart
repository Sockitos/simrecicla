import 'package:simtech/constants/packages_icons.dart';
import 'package:simtech/models/consumer/category.dart';
import 'package:simtech/models/consumer/component.dart';
import 'package:simtech/models/consumer/package.dart';

class ConsumerData {
  const ConsumerData._();

  static const categories = [
    Category(
      category: 'Garrafas',
      icon: PackagesIcons.garrafas,
      packages: [
        Package(
          id: 0,
          icon: PackagesIcons.garrafa_de_iogurte_l_quido___completa,
          name: 'Garrafa de iogurte líquido (grande)',
          components: [
            Component(
              icon: PackagesIcons.garrafa_de_iogurte_l_quido__grande_,
              name: 'Corpo da garrafa',
              pead: 0.027,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              pead: 0.003,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            ),
            Component(
              icon: PackagesIcons.manga,
              name: 'Manga de plástico',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Caso apresente picotado, este componente deve ser destacado e colocado isoladamente no contentor amarelo!',
              recomendacoes: 'Destacar manga se apresentar picotado',
            )
          ],
        ),
        Package(
          id: 1,
          icon: PackagesIcons.garrafao_de_agua___completa,
          name: 'Garrafão de água',
          components: [
            Component(
              icon: PackagesIcons.garrafao_de_agua,
              name: 'Corpo do garrafão',
              pet: 0.083,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              pead: 0.002,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            ),
            Component(
              icon: PackagesIcons.rotulo,
              name: 'Rótulo',
              papel: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Manter o rótulo na embalagem',
            )
          ],
        ),
        Package(
          id: 2,
          icon: PackagesIcons.garrafa_de_agua___completa,
          name: 'Garrafa de água\n(1,5L)',
          components: [
            Component(
              icon: PackagesIcons.garrafa_de_agua,
              name: 'Corpo da garrafa',
              pet: 0.027,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              pead: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            ),
            Component(
              icon: PackagesIcons.rotulo,
              name: 'Rótulo',
              papel: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Manter o rótulo na embalagem',
            )
          ],
        ),
        Package(
          id: 3,
          icon: PackagesIcons.garrafa_de_oleo___completa,
          name: 'Garrafa de óleo',
          components: [
            Component(
              icon: PackagesIcons.garrafa_de_oleo,
              name: 'Corpo da garrafa',
              pet: 0.026,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              pead: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            ),
            Component(
              icon: PackagesIcons.rotulo,
              name: 'Rótulo',
              papel: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Manter o rótulo na embalagem',
            )
          ],
        ),
        Package(
          id: 4,
          icon: PackagesIcons.garrafa_de_azeite___completa,
          name: 'Garrafa de azeite\n(vidro)',
          components: [
            Component(
              icon: PackagesIcons.garrafa_de_azeite,
              name: 'Corpo da garrafa',
              vidro: 0.432,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar; Manter a tampa na embalagem',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              metaisNaoFerrosos: 0.005,
              where: Where.recolhaVidro,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de metal, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de metal, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        ),
        Package(
          id: 5,
          icon: PackagesIcons.garrafa_de_cerveja___completa,
          name: 'Garrafa de cerveja',
          components: [
            Component(
              icon: PackagesIcons.garrafa_de_cerveja___garrafa,
              name: 'Corpo da garrafa',
              vidro: 0.14,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar; Manter a tampa na embalagem',
            ),
            Component(
              icon: PackagesIcons.garrafa_de_cerveja___carica,
              name: 'Carica',
              metaisFerrosos: 0.002,
              where: Where.recolhaVidro,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de metal, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de metal, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!',
              recomendacoes:
                  'Manter a carica na embalagem porque tem dimensão inferior a 50mm',
            ),
            Component(
              icon: PackagesIcons.rotulo,
              name: 'Rótulo',
              papel: 0.001,
              where: Where.recolhaVidro,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de papel, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de papel, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Manter o rótulo na embalagem',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Boiões',
      icon: PackagesIcons.boioes,
      packages: [
        Package(
          id: 6,
          icon: PackagesIcons.boiao_de_doce_vidro___completa,
          name: 'Boião de doce ou de conservas (vidro)',
          components: [
            Component(
              icon: PackagesIcons.boiao_de_doce_vidro,
              name: 'Boião',
              vidro: 0.195,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              metaisFerrosos: 0.01,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de metal porque não é compatível e tem dimensão superior a 50mm',
            )
          ],
        ),
        Package(
          id: 7,
          icon: PackagesIcons.boiao_de_doce_plastico___completa,
          name: 'Boião de doce ou de conservas (plástico)',
          components: [
            Component(
              icon: PackagesIcons.boiao_de_doce_plastico,
              name: 'Boião',
              pet: 0.34,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              plasticosMistos: 0.01,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque não é compatível e tem dimensão superior a 50mm; Depositar isoladamente',
            ),
            Component(
              icon: PackagesIcons.pelicula_de_selagem,
              name: 'Película de selagem',
              metaisNaoFerrosos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!',
              recomendacoes:
                  'Separar a película de metal; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 8,
          icon: PackagesIcons.boiao_de_creme_hidratante___completa,
          name: 'Boião de creme hidratante (vidro)',
          components: [
            Component(
              icon: PackagesIcons.boiao_de_creme_hidratante,
              name: 'Boião',
              vidro: 0.028,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              plasticosMistos: 0.004,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque não é compatível e tem dimensão superior a 50mm',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Copos/Baldes',
      icon: PackagesIcons.copos_baldes,
      packages: [
        Package(
          id: 9,
          icon: PackagesIcons.copo_iogurte_solido,
          name: 'Copos de iogurte sólido',
          components: [
            Component(
              icon: PackagesIcons.copo_iogurte_solido,
              name: 'Copo',
              plasticosMistos: 0.004,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.pelicula_de_selagem,
              name: 'Película de selagem',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componentes com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter a película de selagem na embalagem',
            )
          ],
        ),
        Package(
          id: 10,
          icon: PackagesIcons.balde_iogurte_solido,
          name: 'Balde de iogurte sólido',
          components: [
            Component(
              icon: PackagesIcons.balde_iogurte_solido,
              name: 'Balde',
              plasticosMistos: 0.033,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              plasticosMistos: 0.007,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque tem dimensão superior a 50mm; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 11,
          icon: PackagesIcons.copo_de_gelado,
          name: 'Copo de gelado\n(cartão)',
          components: [
            Component(
              icon: PackagesIcons.copo_de_gelado,
              name: 'Copo',
              cartao: 0.007,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Esta embalagem não é reciclável e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão mas está suja e com gordura, pelo que deve ser mantida separada do cartão reciclável. Esta embalagem deve ser colocada no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              cartao: 0.004,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Este componente não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de cartão mas está sujo e com gordura, pelo que deve ser mantido separado do cartão reciclável. Este material deve ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes: 'Manter a tampa na embalagem',
            ),
            Component(
              icon: PackagesIcons.pelicula_de_selagem,
              name: 'Película de selagem',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Separar a película de plástico',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Pacotes para líquidos alimentares',
      icon: PackagesIcons.pacotes_bebidas,
      packages: [
        Package(
          id: 12,
          icon: PackagesIcons.pacote_de_leite_sem_tampa,
          name: 'Pacote sem tampa',
          components: [
            Component(
              icon: PackagesIcons.pacote_de_leite_sem_tampa,
              name: 'Pacote',
              ecal: 0.027,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de ECAL e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de ECAL e deve ser colocada no contentor amarelo! Este encaminhamento assegura a sua triagem e a recuperação dos diferentes materiais que a constituem (plástico, alumínio e cartão).',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 13,
          icon: PackagesIcons.pacote_de_leite_com_tampa,
          name: 'Pacote com tampa',
          components: [
            Component(
              icon: PackagesIcons.pacote_de_leite_com_tampa,
              name: 'Pacote',
              ecal: 0.035,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de ECAL e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de ECAL e deve ser colocada no contentor amarelo! Este encaminhamento assegura a sua triagem e a recuperação dos diferentes materiais que a constituem (plástico, alumínio e cartão).',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              pead: 0.002,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        ),
        Package(
          id: 14,
          icon: PackagesIcons.pacote_flexivel_para_sumo___completa,
          name: 'Pacote flexível',
          components: [
            Component(
              icon: PackagesIcons.pacote_flexivel_para_sumo,
              name: 'Pacote',
              plasticosMistos: 0.005,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Esvaziar; Espalmar; Manter a tampa na embalagem espalmada',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Caixas',
      icon: PackagesIcons.caixas,
      packages: [
        Package(
          id: 15,
          icon: PackagesIcons.caixa_de_sobremesa_refrigerada___completa,
          name: 'Caixa de sobremesa refrigerada',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_sobremesa_refrigerada___caixa,
              name: 'Caixa',
              pet: 0.009,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.caixa_de_sobremesa_refrigerada___tampa,
              name: 'Tampa',
              pet: 0.004,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque tem dimensão superior a 50mm; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 16,
          icon: PackagesIcons.caixa_de_ovos__cartao_,
          name: 'Caixa de ovos\n(cartão)',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_ovos__cartao_,
              name: 'Caixa',
              cartao: 0.03,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 17,
          icon: PackagesIcons.caixa_de_ovos__plastico_,
          name: 'Caixa de ovos\n(plástico)',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_ovos__plastico_,
              name: 'Caixa',
              pet: 0.057,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            )
          ],
        ),
        Package(
          id: 18,
          icon: PackagesIcons.caixa_de_manteiga___completa,
          name: 'Caixa de manteiga\ne semelhantes',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_manteiga___caixa,
              name: 'Caixa',
              plasticosMistos: 0.01,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.caixa_de_manteiga___tampa,
              name: 'Tampa',
              plasticosMistos: 0.007,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque tem dimensão superior a 50mm; Depositar isoladamente',
            ),
            Component(
              icon: PackagesIcons.caixa_de_manteiga___pelicula,
              name: 'Película de selagem',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter a película de selagem na embalagem',
            )
          ],
        ),
        Package(
          id: 19,
          icon: PackagesIcons.caixa_de_bolo_fresco,
          name: 'Caixa de bolo fresco',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_bolo_fresco___caixa,
              name: 'Caixa',
              cartao: 0.133,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Esta embalagem não é reciclável e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão mas está suja e com gordura, pelo que deve ser mantida separada do cartão reciclável. Esta embalagem deve ser colocada no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.caixa_de_bolo_fresco___pelicula_interior,
              name: 'Película interior',
              papel: 0.001,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Este material de embalagem não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este material é de papel mas está sujo e com gordura, pelo que deve ser mantido separado do papel reciclável. Este material deve ser ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes: 'Manter a película na embalagem',
            ),
            Component(
              icon: PackagesIcons.caixa_de_bolo_fresco___janela,
              name: 'Janela de plástico',
              plasticosMistos: 0.0006,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes: 'Manter na embalagem',
            )
          ],
        ),
        Package(
          id: 20,
          icon: PackagesIcons.caixa_de_detergente_em_po,
          name: 'Caixa de detergente\nem pó',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_detergente_em_po,
              name: 'Caixa',
              cartao: 0.231,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 21,
          icon: PackagesIcons.caixa_de_sapatos,
          name: 'Caixa de sapatos',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_sapatos,
              name: 'Caixa',
              cartao: 0.225,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 22,
          icon: PackagesIcons.caixa_de_folha_de_aluminio_ou_de_pelicula___caixa,
          name: 'Caixa de folha de alumínio ou de película',
          components: [
            Component(
              icon: PackagesIcons
                  .caixa_de_folha_de_aluminio_ou_de_pelicula___caixa,
              name: 'Caixa',
              cartao: 0.028,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons
                  .caixa_de_folha_de_aluminio_ou_de_pelicula___rolo,
              name: 'Rolo',
              cartao: 0.032,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de cartão e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de cartão e deve ser separado da embalagem e colocado isoladamente no contentor azul!',
              recomendacoes:
                  'Separar o rolo da caixa de cartão; Depositar isoladamente',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Cuvetes e Tubos',
      icon: PackagesIcons.cuvetes_e_tubos,
      packages: [
        Package(
          id: 23,
          icon: PackagesIcons.cuvete_de_legumes___completo,
          name: 'Cuvete de legumes frescos',
          components: [
            Component(
              icon: PackagesIcons.cuvete_de_legumes___cuvete,
              name: 'Cuvete',
              eps: 0.005,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.filme_de_selagem,
              name: 'Filme de selagem',
              pebd: 0.003,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!',
              recomendacoes:
                  'Separar o filme de selagem da embalagem; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 24,
          icon: PackagesIcons.cuvete_de_carne_ou_peixe_frescos___completo,
          name: 'Cuvete de carne ou\npeixe frescos',
          components: [
            Component(
              icon: PackagesIcons.cuvete_de_legumes___cuvete,
              name: 'Cuvete',
              plasticosMistos: 0.024,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar a embalagem',
            ),
            Component(
              icon: PackagesIcons.filme_de_selagem,
              name: 'Filme de selagem',
              pebd: 0.002,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!',
              recomendacoes:
                  'Separar o filme de selagem da embalagem; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 25,
          icon: PackagesIcons.tabuleiro_met_lico_de_pronto_a_comer___completo,
          name: 'Tabuleiro metálico de pronto-a-comer',
          components: [
            Component(
              icon: PackagesIcons
                  .tabuleiro_met_lico_de_pronto_a_comer___tabuleiro,
              name: 'Tabuleiro',
              metaisNaoFerrosos: 0.015,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons
                  .tabuleiro_met_lico_de_pronto_a_comer___tampa_cartao,
              name: 'Tampa de cartão',
              cartao: 0.003,
              where: Where.recolhaIndiferenciada,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Este material de embalagem não é reciclável e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este material é de cartão plastificado, está sujo e com gordurapelo que deve ser mantido separado do cartão reciclável. Este material deve ser colocado no contentor dos indiferenciados (contentor cinzento para o lixo doméstico comum).',
              recomendacoes: 'Separar a tampa de cartão',
            )
          ],
        ),
        Package(
          id: 26,
          icon: PackagesIcons.tubo_de_creme_hidratante___completo,
          name: 'Tubo de creme\nhidratante',
          components: [
            Component(
              icon: PackagesIcons.tubo_de_creme_hidratante___tubo,
              name: 'Tubo',
              pebd: 0.013,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              plasticosMistos: 0.005,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Frascos',
      icon: PackagesIcons.frascos,
      packages: [
        Package(
          id: 27,
          icon: PackagesIcons.frasco_de_molho_de_tempero___completo,
          name: 'Frasco de molho de tempero (plástico)',
          components: [
            Component(
              icon: PackagesIcons.frasco_de_molho_de_tempero___frasco,
              name: 'Frasco',
              pet: 0.017,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.tampa_boiao___frasco,
              name: 'Tampa',
              plasticosMistos: 0.009,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        ),
        Package(
          id: 28,
          icon: PackagesIcons.frasco_de_desodorizante_roll_on___completo,
          name: 'Frasco de desodorizante roll-on (vidro)',
          components: [
            Component(
              icon: PackagesIcons.frasco_de_desodorizante_roll_on___frasco,
              name: 'Frasco',
              vidro: 0.099,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.frasco_de_desodorizante_roll_on___tampa,
              name: 'Tampa',
              plasticosMistos: 0.006,
              where: Where.recolhaVidro,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        ),
        Package(
          id: 29,
          icon: PackagesIcons.frasco_de_cafe___completo,
          name: 'Frasco de café ou outras misturas solúveis (vidro)',
          components: [
            Component(
              icon: PackagesIcons.frasco_de_cafe___frasco,
              name: 'Frasco',
              vidro: 0.239,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.frasco_de_cafe___tampa,
              name: 'Tampa',
              plasticosMistos: 0.014,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque não é compatível e tem dimensão superior a 50mm',
            ),
            Component(
              icon: PackagesIcons.pelicula_de_selagem,
              name: 'Película de selagem',
              metaisNaoFerrosos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes:
                  'Separar a película de metal; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 30,
          icon: PackagesIcons.frasco_de_champo_ou_amaciador___completo,
          name: 'Frasco de produtos\nde higiene',
          components: [
            Component(
              icon: PackagesIcons.frasco_de_champo_ou_amaciador___frasco,
              name: 'Frasco',
              pead: 0.037,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.frasco_de_champo_ou_amaciador___tampa,
              name: 'Tampa',
              pead: 0.004,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter a tampa na embalagem',
            )
          ],
        ),
        Package(
          id: 31,
          icon: PackagesIcons
              .frasco_de_produto_de_limpeza_com_dispensador___completo,
          name: 'Frasco de produto de limpeza com dispensador',
          components: [
            Component(
              icon: PackagesIcons
                  .frasco_de_produto_de_limpeza_com_dispensador___frasco,
              name: 'Frasco',
              pead: 0.046,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons
                  .frasco_de_produto_de_limpeza_com_dispensador___tampa,
              name: 'Tampa com dispensador',
              plasticosMistos: 0.025,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!',
              recomendacoes:
                  'Separar o dispensador da embalagem; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 32,
          icon: PackagesIcons.frasco_sal___completo,
          name: 'Frasco de sal',
          components: [
            Component(
              icon: PackagesIcons.frasco_sal___frasco,
              name: 'Frasco',
              plasticosMistos: 0.019,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.frasco_sal___tampa,
              name: 'Tampa',
              plasticosMistos: 0.006,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        ),
        Package(
          id: 33,
          icon: PackagesIcons.frasco_de_perfume___completo,
          name: 'Frasco de perfume',
          components: [
            Component(
              icon: PackagesIcons.frasco_de_perfume___frasco,
              name: 'Frasco',
              vidro: 0.142,
              where: Where.recolhaVidro,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de vidro e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de vidro e deve ser colocada no contentor verde!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.tampa_garrafa,
              name: 'Tampa',
              plasticosMistos: 0.007,
              where: Where.recolhaVidro,
              reciclavel: false,
              ifTrue:
                  'Muito bem! Apesar de este componente ser de plástico, foi colocado no contentor correto! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Apesar de este componente ser de plástico, como apresenta dimensões reduzidas, deve ser mantido na embalagem e colocado no contentor verde!',
              recomendacoes:
                  'Manter a tampa na embalagem porque tem dimensão inferior a 50mm',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Latas',
      icon: PackagesIcons.latas,
      packages: [
        Package(
          id: 34,
          icon: PackagesIcons.lata_conserva___completo,
          name: 'Lata de peixe em conserva',
          components: [
            Component(
              icon: PackagesIcons.lata_conserva___lata,
              name: 'Lata',
              metaisFerrosos: 0.023,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.lata_conserva___tampa,
              name: 'Tampa metálica\n(com anilha)',
              metaisFerrosos: 0.007,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter as anilhas na embalagem',
            )
          ],
        ),
        Package(
          id: 35,
          icon: PackagesIcons.lata_de_refrigerante___completo,
          name: 'Lata de refrigerante',
          components: [
            Component(
              icon: PackagesIcons.lata_de_refrigerante___lata,
              name: 'Lata',
              metaisNaoFerrosos: 0.01,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.lata_de_refrigerante___anilha,
              name: 'Anilha',
              metaisNaoFerrosos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter as anilhas na embalagem',
            )
          ],
        ),
        Package(
          id: 36,
          icon: PackagesIcons.lata_de_espuma_barbear___completo,
          name: 'Lata de espuma de barbear',
          components: [
            Component(
              icon: PackagesIcons.lata_de_espuma_barbear___lata,
              name: 'Lata',
              metaisNaoFerrosos: 0.051,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.lata_de_espuma_barbear___tampa,
              name: 'Tampa',
              plasticosMistos: 0.005,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado isoladamente no contentor amarelo!',
              recomendacoes:
                  'Separar a tampa de plástico porque não é compatível e tem dimensão superior a 50mm; Depositar isoladamente',
            )
          ],
        ),
        Package(
          id: 37,
          icon: PackagesIcons.lata_de_ra_ao_para_animal___completo,
          name: 'Lata de ração\npara animal',
          components: [
            Component(
              icon: PackagesIcons.lata_de_ra_ao_para_animal___lata,
              name: 'Lata',
              metaisFerrosos: 0.042,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de metal e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de metal e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.lata_de_ra_ao_para_animal___tampa,
              name: 'Tampa metálica\n(com anilha)',
              metaisFerrosos: 0.007,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de metal e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de metal e deve ser colocado no contentor amarelo! Por ser um componente com dimensões reduzidas, deve ser mantido na embalagem e encaminhado conjuntamente!',
              recomendacoes: 'Manter as anilhas na embalagem',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Pacotes flexíveis/Sacos',
      icon: PackagesIcons.pacotes_flexiveis_sacos,
      packages: [
        Package(
          id: 38,
          icon: PackagesIcons.pacote_flex_vel_de_a_ucar___papel,
          name: 'Pacote de açúcar e semelhantes (papel)',
          components: [
            Component(
              icon: PackagesIcons.pacote_flex_vel_de_a_ucar___papel,
              name: 'Pacote flexível',
              papel: 0.008,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 39,
          icon: PackagesIcons.pacote_flex_vel_de_a_ucar___plastico,
          name: 'Pacote de açúcar e semelhantes (plástico)',
          components: [
            Component(
              icon: PackagesIcons.pacote_flex_vel_de_a_ucar___plastico,
              name: 'Pacote flexível',
              pebd: 0.006,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 40,
          icon: PackagesIcons.pacote_flex_vel_manteiga,
          name: 'Pacote de margarina\ne semelhantes\n(plástico metalizado)',
          components: [
            Component(
              icon: PackagesIcons.pacote_flex_vel_manteiga,
              name: 'Pacote flexível',
              plasticosMistos: 0.002,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 41,
          icon: PackagesIcons.pacote_flexivel_pao___completo,
          name: 'Pacote flexível de pão',
          components: [
            Component(
              icon: PackagesIcons.pacote_flexivel_pao___pacote,
              name: 'Pacote flexível',
              plasticosMistos: 0.005,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 42,
          icon: PackagesIcons.pacote_padaria_com_janela___completo,
          name: 'Saco para padaria\ne pastelaria\n(com janela)',
          components: [
            Component(
              icon: PackagesIcons.pacote_padaria_com_janela___pacote,
              name: 'Saco para padaria e pastelaria',
              papel: 0.007,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.pacote_padaria_com_janela___janela,
              name: 'Janela de plástico',
              plasticosMistos: 0.0006,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Separar a janela de plástico',
            )
          ],
        ),
        Package(
          id: 43,
          icon: PackagesIcons.pacote_flexivel_esparguete,
          name: 'Pacote de esparguete e massas secas',
          components: [
            Component(
              icon: PackagesIcons.pacote_flexivel_esparguete,
              name: 'Pacote flexível',
              plasticosMistos: 0.006,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 44,
          icon: PackagesIcons.pacote_flexivel_papel_higienico___plastico,
          name: 'Pacote de papel higiénico (plástico)',
          components: [
            Component(
              icon: PackagesIcons.pacote_flexivel_papel_higienico___plastico,
              name: 'Pacote flexível',
              pebd: 0.026,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 45,
          icon: PackagesIcons.pacote_flexivel_papel_higienico___papel,
          name: 'Pacote de papel higiénico (papel)',
          components: [
            Component(
              icon: PackagesIcons.pacote_flexivel_papel_higienico___papel,
              name: 'Pacote flexível',
              papel: 0.01,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 46,
          icon: PackagesIcons.saco_compras_plastico,
          name: 'Saco de asas para as compras (plástico)',
          components: [
            Component(
              icon: PackagesIcons.saco_compras_plastico,
              name: 'Saco de asas\npara as compras',
              pead: 0.024,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        ),
        Package(
          id: 47,
          icon: PackagesIcons.saco_compras_papel,
          name: 'Saco de asas para as compras (papel)',
          components: [
            Component(
              icon: PackagesIcons.saco_compras_papel,
              name: 'Saco de asas\npara as compras',
              papel: 0.059,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de papel e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de papel e deve ser colocada no contentor azul!',
              recomendacoes: 'Esvaziar; Espalmar',
            )
          ],
        )
      ],
    ),
    Category(
      category: 'Multi-embalagem',
      icon: PackagesIcons.multi_embalagens,
      packages: [
        Package(
          id: 48,
          icon: PackagesIcons.caixa_de_pasta_de_dentes___completo,
          name: 'Caixa de pasta de dentes',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_pasta_de_dentes___caixa,
              name: 'Caixa',
              cartao: 0.01,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes: 'Separar os materiais de embalagem; Espalmar',
            ),
            Component(
              icon: PackagesIcons.caixa_de_pasta_de_dentes___tubo,
              name: 'Tubo da pasta de dentes',
              plasticosMistos: 0.01,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes:
                  'Separar os materiais de embalagem; Manter a tampa na embalagem',
            )
          ],
        ),
        Package(
          id: 49,
          icon: PackagesIcons.caixa_de_peixe_congelado___caixa,
          name: 'Caixa de peixe congelado',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_peixe_congelado___caixa,
              name: 'Caixa',
              cartao: 0.041,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes:
                  'Separar os materiais de embalagem; Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.caixa_de_peixe_congelado___involucro_plastico,
              name: 'Invólucros de plástico',
              pebd: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este material de embalagem é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este material é de plástico e deve ser separado da embalagem e colocado no contentor amarelo!',
              recomendacoes:
                  'Separar os materiais de embalagem; Separar os invólucros de plástico',
            )
          ],
        ),
        Package(
          id: 50,
          icon: PackagesIcons.caixa_de_cereais___caixa,
          name: 'Caixa de cereais',
          components: [
            Component(
              icon: PackagesIcons.caixa_de_cereais___caixa,
              name: 'Caixa',
              cartao: 0.065,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de cartão e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de cartão e deve ser colocada no contentor azul!',
              recomendacoes:
                  'Separar os materiais de embalagem; Esvaziar; Espalmar',
            ),
            Component(
              icon: PackagesIcons.caixa_de_cereais___bolsa_plastico,
              name: 'Bolsa de plástico',
              plasticosMistos: 0.011,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Separar os materiais de embalagem; Esvaziar',
            )
          ],
        ),
        Package(
          id: 51,
          icon: PackagesIcons.cuvete_de_pronto_a_comer___completa,
          name: 'Cuvete de\npronto-a-comer',
          components: [
            Component(
              icon: PackagesIcons.cuvete_de_pronto_a_comer___cuvete,
              name: 'Cuvete',
              plasticosMistos: 0.024,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Esta embalagem é de plástico e foi colocada no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Esta embalagem é de plástico e deve ser colocada no contentor amarelo!',
              recomendacoes: 'Esvaziar',
            ),
            Component(
              icon: PackagesIcons.cuvete_de_pronto_a_comer___pelicula,
              name: 'Película de selagem',
              plasticosMistos: 0.001,
              where: Where.recolhaPlasticoMetal,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de plástico e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de plástico e deve ser mantido na embalagem e colocado no contentor amarelo!',
              recomendacoes: 'Manter a película de selagem na embalagem',
            ),
            Component(
              icon: PackagesIcons.cuvete_de_pronto_a_comer___rotulo,
              name: 'Rótulo',
              cartao: 0.007,
              where: Where.recolhaPapelCartao,
              reciclavel: true,
              ifTrue:
                  'Muito bem! Este componente é de papel e foi colocado no contentor correto! Vê aqui mais dicas sobre boas práticas de deposição de resíduos.',
              ifFalse:
                  'O destino selecionado não está correto. Este componente é de papel e, sempre que possível, deve ser separado da embalagem e colocado no contentor azul!',
              recomendacoes: 'Separar o rótulo de papel',
            )
          ],
        )
      ],
    ),
  ];
}
