const questions = [
  {
    'id': 0,
    'question': 'De que cor é a embalagem?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Transparente ou incolor',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Cores claras',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes.'
        },
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A presença de coloração no PET prejudica a recuperação deste material para reciclagem e deve ser evitada.'
      },
      {
        'id': 2,
        'answer': 'Preto ou com cores muito escuras',
        'vidro': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de vidro incolor ou azul, verde e castanho transparente.'
        },
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes.'
        },
        'pead': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pebd': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'eps': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pp': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'outros_plasticos': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras que não afetem a purificação e recuperação das fibras durante o processo de reciclagem.'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras que não afetem a purificação e recuperação das fibras durante o processo de reciclagem.'
        },
        'recommendation':
            'Os sistemas óticos de triagem estão definidos para reconhecer materiais de embalagem transparentes ou de cores claras. A utilização da cor preta ou cores muito escuras prejudica a recuperação deste material para reciclagem e deve ser evitada.'
      },
      {
        'id': 3,
        'answer': 'Pigmento negro de fumo',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes.'
        },
        'pead': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pebd': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'eps': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pp': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'outros_plasticos': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de pigmento negro de fumo prejudica a deteçao e recuperação deste material pelos sistemas de triagem automatizados e deve ser evitada.'
      },
      {
        'id': 4,
        'answer': 'Verde ou castanho',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 5,
        'answer': 'Cores metalizadas (superiores a 30%)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'cartao': {
          'value': -5,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'recommendation':
            'A utilização de metalizações acima de 30% prejudica a reciclagem deste material e deve ser evitada.'
      },
      {
        'id': 6,
        'answer': 'Outras cores (ex. opacas, flourescentes, outras)',
        'vidro': {
          'value': -10,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de vidro incolor ou azul, verde e castanho transparente.'
        },
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens transparentes ou de cores claras.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens de cores claras.'
        },
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'Os sistemas óticos de triagem estão definidos para reconhecer materiais de embalagem transparentes ou de cores claras. A utilização de outras cores não convencionais prejudica a recuperação deste material para reciclagem e deve ser evitada.'
      }
    ]
  },
  {
    'id': 1,
    'question':
        'A embalagem apresenta algum tipo de barreira ou revestimento externo?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer':
            'Sim, barreiras / revestimentos que não afetam a reciclabilidade da embalagem',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer':
            'Sim, barreiras / revestimentos que podem afetar a reciclabilidade da embalagem',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a minimização da diversidade de revestimentos e a consulta das condicionantes relativamente às quantidades compatíveis e aplicação final. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de diversas camadas de materiais que atuam como revestimentos e barreiras podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer':
            'Sim, revestimento de desalcalização (com SO2, flúor, entre outros) ou de resistência mecânica (revestimento a quente ou a frio)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 4,
        'answer':
            'Sim, folha de flandres ou revestimentos de estanho ou de laca',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 5,
        'answer':
            'Sim, revestimento de laca ou de alumina (óxido natural do alumínio)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 6,
        'answer':
            'Sim, agentes ligantes ou PE e PP que atuam como filmes de selo',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 7,
        'answer': 'Sim, revestimento externo de Óxido de Silício (SiOx)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 8,
        'answer':
            'Sim, removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno EPBP',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 9,
        'answer':
            'Sim, removedor de O2 à base de PET, com ligeiro efeito de amarelecimento após teste de forno EPBP',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira com removedor de O2 à base de PET, com ligeiro efeito de amarelecimento após teste de forno EPBP, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 10,
        'answer': 'Sim, revestimento externo por plasma de carbono',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de revestimentos totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com revestimento externo por plasma de carbono, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 11,
        'answer':
            'Sim, barreira de poliamida (PA) multicamada com < 5% (em peso)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreiras de poliamida (PA) multicamada com < 5% (em peso) vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua reciclagem.'
      },
      {
        'id': 12,
        'answer':
            'Sim, barreira de poliamida (PA) multicamada com >5 % (em peso)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreira de poliamida (PA) multicamada com >5 % (em peso) vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 13,
        'answer': 'Sim, barreira de poliamida (PA) monocamada',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreiras de poliamida (PA) monocamada vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua reciclagem.'
      },
      {
        'id': 14,
        'answer': 'Sim, barreira de ácido poliglicólico (PGA) multicamada',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira de ácido poliglicólico (PGA) multicamada, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 15,
        'answer': 'Sim, barreira em liga de naftalato de politrimetileno (PTN)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira em liga de naftalato de politrimetileno (PTN), está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 16,
        'answer':
            'Sim, barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt%',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 17,
        'answer':
            'Sim, barreira de álcool de vinil e etileno (EVOH) > 6 wt% com PE-g-MAH, e MAH > 0,1 wt%',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira de álcool de vinil e etileno (EVOH) > 6 wt% com PE-g-MAH, e MAH > 0,1 wt%, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 18,
        'answer': 'Sim, enkase (fluoração)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 19,
        'answer':
            'Sim, barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 20,
        'answer':
            'Sim, barreira de álcool de vinil e etileno (EVOH) > 6 wt% com PP-g-MAH',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira de álcool de vinil e etileno (EVOH) > 6 wt% com PP-g-MAH, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 21,
        'answer': 'Sim, barreira de álcool de vinil e etileno (EVOH) < 1%',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -3,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreira de álcool de vinil e etileno (EVOH) < 1% podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 22,
        'answer': 'Sim, SiOx e AlOx sem barreiras adicionais',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 23,
        'answer': 'Sim, barreiras metalizadas sem revestimento',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com barreira metalizada sem revestimento, está dependente da quantidade de barreira utilizada e da aplicação final.'
      },
      {
        'id': 24,
        'answer': 'Sim, barreira de cloreto de polivinilideno (PVDC)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreira de cloreto de polivinilideno (PVDC) vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 25,
        'answer': 'Sim, barreira multicamada com PLA; PVC; PS; PETG; outros',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PET, como revestimento externo de SiOx e removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno.'
        },
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEAD, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração).'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PEBD, como revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de barreiras totalmente compatíveis com a reciclagem do PP, como barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de barreira multicamada com PLA, PVC, PS, PETG ou outros, vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 26,
        'answer':
            'Sim, revestimento com reduzidas quantidades de polietileno ou alumínio (menos de 50%)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 27,
        'answer':
            'Sim, revestimento com elevadas quantidades de polietileno ou alumínio (50% ou mais)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {
          'value': -3,
          'recommendation':
              'É recomendado o uso de revestimentos com quantidades de polietileno ou alumínio inferiores a 50%.'
        },
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de revestimentos com elevadas quantidades de polietileno ou alumínio vai prejudicar o processo de recuperação das fibras de papel e cartão e a reciclagem das embalagens de ECAL.'
      },
      {
        'id': 28,
        'answer': 'Sim, revestimentos hidro-solúveis',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 29,
        'answer': 'Sim, revestimentos não hidro-solúveis',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de revestimentos duplos não hidro-solúveis não são compatíveis com a reciclagem de embalagens de papel e cartão, na medida em que não permitem a recuperação das suas fibras no processo de reciclagem.'
      },
      {
        'id': 30,
        'answer':
            'Sim, superfície lacada opaca ou com espessura >5 micrometros',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -3,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de superfícies lacadas opacas ou com espessura >5 micrometros  não são compatíveis com a reciclagem de embalagens de papel e cartão, na medida em que não permitem a recuperação das suas fibras no processo de reciclagem.'
      },
      {
        'id': 31,
        'answer': 'Sim, revestimento de plástico ou laminado',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de revestimentos de plástico ou laminados não são compatíveis com a reciclagem de embalagens de papel e cartão, na medida em que não permitem a recuperação das suas fibras no processo de reciclagem.'
      },
      {
        'id': 32,
        'answer':
            'Sim, revestimento de cera, silicone ou agentes impermeabilizantes',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de revestimentos de cera, silicone ou agentes impermeabilizantes não são compatíveis com a reciclagem de embalagens de papel e cartão, na medida em que não permitem a recuperação das suas fibras no processo de reciclagem.'
      },
      {
        'id': 33,
        'answer': 'Sim, outros revestimentos',
        'vidro': {
          'value': -2,
          'recommendation':
              'Os tratamentos de superfície compatíveis com a reciclagem do vidro são a desalcalização (com SO2, flúor, entre outros) ou a resistência mecânica (revestimento a quente ou a frio). Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -2,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do aço são folha de flandres e revestimentos de estanho ou de laca. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -2,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do alumínio são revestimentos de laca ou de alumina (óxido natural do alumínio). Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {
          'value': -2,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do EPS são agentes ligantes ou PE e PP que atuam como filmes de selo. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de outros revestimentos não especificados podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 34,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Os tratamentos de superfície compatíveis com a reciclagem do vidro são a desalcalização (com SO2, flúor, entre outros) ou a resistência mecânica (revestimento a quente ou a frio). Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do aço são folha de flandres e revestimentos de estanho ou de laca. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do alumínio são revestimentos de laca ou de alumina (óxido natural do alumínio). Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do PET são o revestimento externo de SiOx e o removedor de O2 à base de PET, sem efeito de amarelecimento após teste de forno. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do PEAD são a barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PE-g-MAH, e MAH > 0,1 wt% ou Enkase (fluoração). Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do PEBD são revestimentos de SiOx e AlOx sem barreiras adicionais. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do EPS são agentes ligantes ou PE e PP que atuam como filmes de selo. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do PP são barreira de álcool de vinil e etileno (EVOH) < 6 wt% com PP-g-MAH ou revestimentos de SiOx e AlOx sem barreiras adicionais. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a minimização da diversidade de revestimentos e a consulta das condicionantes relativamente às quantidades compatíveis e aplicação final. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do ECAL não devem sobrepor-se ao teor de papel e cartão na embalagem, pelo que os revestimentos de polietileno ou alumínio devem ser utilizados em quantidades reduzidas. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do Papel têm de permitir a recuperação das suas fibras, como os revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Os revestimentos compatíveis com a reciclagem do Cartão têm de permitir a recuperação das suas fibras, como os revestimentos hidro-solúveis. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de outras barreiras ou revestimentos não especificados podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      }
    ]
  },
  {
    'id': 2,
    'question': 'Foram adicionados aditivos ao material de embalagem?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, aditivos que não afetam a reciclabilidade da embalagem',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer':
            'Sim, aditivos que podem afetar a reciclabilidade da embalagem',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {
          'value': -2,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'aluminio': {
          'value': -2,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos que não afetem a densidade dos plásticos.'
        },
        'ecal': {
          'value': -2,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos inadequados podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer':
            'Sim, são utilizados aditivos como óxido de cobalto (azul transparente), óxidos de cobre, crómio e de ferro (verde) ou óxidos de carbono, enxofre e níquel (castanho)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 4,
        'answer': 'Sim, removedores de oxigénio (O2)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com aditivos removedores de oxigénio (O2), está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Sim, estabilizadores de UV',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com aditivos removedores de oxigénio (O2), está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 6,
        'answer': 'Sim, são utilizados outros aditivos',
        'vidro': {
          'value': -2,
          'recommendation':
              'No caso de utilização de aditivos para coloração de embalagens de vidro, é recomendado o uso de aditivos como óxido de cobalto (azul transparente), óxidos de cobre, crómio e de ferro (verde) e óxidos de carbono, enxofre e níquel (castanho), que correspondem à coloração mais compatível com a reciclagem do vidro. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do EPS, como anti-oxidantes e estabilizadores de UV.'
        },
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de outros aditivos não especificados podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 7,
        'answer': 'Sim, bloqueadores de acetaldeído (AA)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens com aditivos removedores de oxigénio (O2), está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 8,
        'answer': 'Sim, agentes abrilhantadores',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A reciclabilidade de embalagens de PET com aditivos removedores de oxigénio (O2), está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 9,
        'answer': 'Sim, aditivos biodegradaveis',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos biodegradaveis vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 10,
        'answer': 'Sim, aditivos oxodegradaveis',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos oxodegradaveis vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 11,
        'answer': 'Sim, aditivos fotodegradáveis',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -10,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos fotodegradáveis vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 12,
        'answer': 'Sim, nanocompósitos',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos nanocompósitos vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 13,
        'answer':
            'Sim, é utilizado tratamento superficial de silício ou anti-bloqueio masterbatch (máx. 3%)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 14,
        'answer':
            'Sim, são utilizados aditivos com grande solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 15,
        'answer': 'Sim, aditivos de talco',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos separáveis e que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos separáveis e que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de aditivos de talco podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 16,
        'answer': 'Sim, aditivos de carbonato de cálcio ou (CaCO3)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos separáveis e que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos separáveis e que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de aditivos de carbonato de cálcio podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 17,
        'answer': 'Sim, aditivos que não aumentam a densidade do material',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 18,
        'answer':
            'Sim, aditivos que aumentam a densidade do material (>1 g/cm³)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de aditivos aditivos que aumentem a densidade do material (>1 g/cm³) vai contaminar e afetar as propriedades do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 19,
        'answer': 'Sim, é utilizada uma combinação de aditivos',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos que não afetem a densidade dos plásticos.'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de combinação de aditivos podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 20,
        'answer':
            'Sim, fibras de algodão ou outras que não sejam fibras de celulose',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A reciclabilidade de embalagens com fibras de algodão, está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 21,
        'answer': 'Sim, aditivos de dióxido de titânio (TiO2)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A reciclabilidade de embalagens com aditivos de dióxido de titânio (TiO2), está dependente da quantidade de aditivo utilizado e da aplicação final.'
      },
      {
        'id': 22,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'No caso de utilização de aditivos para coloração de embalagens de vidro, é recomendado o uso de aditivos como óxido de cobalto (azul transparente), óxidos de cobre, crómio e de ferro (verde) e óxidos de carbono, enxofre e níquel (castanho), que correspondem à coloração mais compatível com a reciclagem do vidro. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do PET, como tratamento superficial de silicone ou anti-bloqueio masterbatch (máx. 3%), no caso de PET termoformado. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEAD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PEBD. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do EPS, como anti-oxidantes e estabilizadores de UV.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos que não aumentem a densidade do PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos que não afetem a densidade dos plásticos.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'No caso de utilização de aditivos nas embalagens que contactam com alimentos, é recomendado o uso de aditivos que cumpram os requisitos determinados pelas agências nacionais e internacionais para o controlo da segurança alimentar.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do papel, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'É recomendado o uso de aditivos totalmente compatíveis com a reciclagem do cartão, aditivos com maior solubilidade, que permitam a fácil remoção dos contaminantes e a fácil recuperação das fibras de celulose. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de aditivos não compatíveis ou não especificados podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      }
    ]
  },
  {
    'id': 3,
    'question': 'A embalagem contém sistema de fecho / tampa?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, contém sistema de fecho / tampa',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Sim, contém tampa e anel de inviolabilidade',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 3,
        'answer': 'Sim, contém tampa e anel de inviolabilidade e selo',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      }
    ]
  },
  {
    'id': 4,
    'question': 'Que materiais estão presentes no sistema de fecho / tampa?',
    'requirement': {
      'question': 3,
      'answers': [1, 2, 3]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 1,
        'answer': 'Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 2, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 2, 'recommendation': null},
        'pp': {'value': 3, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 4,
        'answer': 'Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Poliestireno expandido (EPS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 2, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 3, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de EPS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 6,
        'answer': 'Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 3, 'recommendation': null},
        'pead': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 7,
        'answer': 'Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {'value': 3, 'recommendation': null},
        'cartao': {'value': 3, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 8,
        'answer': 'Aço',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 3, 'recommendation': null},
        'aluminio': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 9,
        'answer': 'Alumínio',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 3, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 10,
        'answer': 'Cerâmica',
        'vidro': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de cerâmica não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 11,
        'answer': 'Outros materiais',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de sistema de fecho/tampa com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 12,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de tampa cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tampa de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de sistema de fecho/tampa com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 5,
    'question': 'Que materiais compõem o anel de inviolabilidade?',
    'requirement': {
      'question': 3,
      'answers': [2, 3]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 1,
        'answer': 'Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 4,
        'answer': 'Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Poliestireno expandido (EPS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de EPS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 6,
        'answer': 'Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 7,
        'answer': 'Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 8,
        'answer': 'Aço',
        'vidro': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 9,
        'answer': 'Alumínio',
        'vidro': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 10,
        'answer': 'Cerâmica',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de cerâmica não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 11,
        'answer': 'Outros materiais',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de anel de inviolabilidade com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 12,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de anel de inviolabilidade cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de anel de inviolabilidade de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de anel de inviolabilidade com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 6,
    'question': 'Que materiais compõem o selo?',
    'requirement': {
      'question': 3,
      'answers': [3]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 1,
        'answer': 'Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 4,
        'answer': 'Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Poliestireno expandido (EPS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de EPS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 6,
        'answer': 'Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 7,
        'answer': 'Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 8,
        'answer': 'Aço',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 9,
        'answer': 'Alumínio',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 10,
        'answer': 'Cerâmica',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de cerâmica não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 11,
        'answer': 'Outros materiais',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de selos com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 12,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de selos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de selos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de selos com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 7,
    'question': 'A embalagem apresenta rótulo?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, apresenta rótulo',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Sim, apresenta manga retrátil / sleeve',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      }
    ]
  },
  {
    'id': 8,
    'question': 'Percentagem de superfície ocupada pelo rótulo?',
    'requirement': {
      'question': 7,
      'answers': [1]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Até 2/3',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Superior a 2/3',
        'vidro': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a a utilização de rótulos destacáveis e de dimensões reduzidas.'
        },
        'recommendation':
            'Rótulos não destacáveis e com uma superfície de ocupação da embalagem superior a 2/3, dificultam a identificação e separação deste material para reciclagem através de meios mecânicos.'
      }
    ]
  },
  {
    'id': 9,
    'question': 'Que materiais compõem o rótulo?',
    'requirement': {
      'question': 7,
      'answers': [1]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 1,
        'answer': 'Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 2, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 2, 'recommendation': null},
        'pp': {'value': 3, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 4,
        'answer': 'Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 3, 'recommendation': null},
        'pead': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 6,
        'answer': 'Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {'value': 3, 'recommendation': null},
        'cartao': {'value': 3, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 7,
        'answer': 'Aço',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 3, 'recommendation': null},
        'aluminio': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 8,
        'answer': 'Alumínio',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 3, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 9,
        'answer': 'Outros materiais',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de rótulos com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 10,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de rótulos cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de rótulos com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 10,
    'question': 'Que materiais compõem a manga?',
    'requirement': {
      'question': 7,
      'answers': [2]
    },
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 1,
        'answer': 'Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 2, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 2, 'recommendation': null},
        'pp': {'value': 3, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 4,
        'answer': 'Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 5,
        'answer': 'Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 3, 'recommendation': null},
        'pead': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 6,
        'answer': 'Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {'value': 3, 'recommendation': null},
        'cartao': {'value': 3, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 7,
        'answer': 'Aço',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 3, 'recommendation': null},
        'aluminio': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 8,
        'answer': 'Alumínio',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 3, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de rótulos de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 9,
        'answer': 'Outros materiais',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de mangas com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 10,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PET, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de mangas cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de mangas de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de mangas com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 11,
    'question': 'A embalagem apresenta impressão direta?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, impressão a laser',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Sim, impressão da data de fabrico ou prazo de validade',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A compatibilidade da  impressão da data de fabrico ou prazo de validade com o PET está dependente da quantidade de impressão utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Sim, outras impressões diretas',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'pead': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'pebd': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'pp': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'outros_plasticos': {
          'value': -2,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'Outras impressões diretas podem contaminar o material de embalagem e prejudicar a reciclagem do mesmo.'
      },
      {
        'id': 4,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a impressão a laser ou a impressão da data de fabrico ou prazo de validade.'
        },
        'recommendation':
            'A utilização de impressões não especificadas ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 12,
    'question': 'Estão presentes tintas no corpo da embalagem?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, tintas não tóxicas',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Sim, tintas que cumprem as orientações da EuPIA',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 3,
        'answer': 'Sim, tintas que tingem',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'recommendation':
            'As tintas que tingem vão contaminar o material de embalagem, prejudicando a sua purificação e recuperação no processo de reciclagem.'
      },
      {
        'id': 4,
        'answer': 'Sim, tintas tóxicas/perigosas',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'recommendation':
            'Embalagens com tintas tóxicas/perigosas não podem ser depositadas nos ecopontos convencionais, nem encaminhadas para o processo de reciclagem, o que impede a adequada recuperação do material de embalagem.'
      },
      {
        'id': 5,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de tintas não tóxicas e que cumprem as orientações da EuPIA.'
        },
        'recommendation':
            'A utilização de tintas não especificadas ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 13,
    'question': 'Estão presentes colas?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer':
            'Sim, colas não adesivas, alcalinas ou hidrossolúveis a 60 – 80º C',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Sim, colas não solúveis em água ou álcali a 80º C',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'eps': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pp': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'outros_plasticos': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de colas não solúveis em água ou álcali a 80º C não são compatíveis com a reciclagem do material de embalagem, na medida em que não permitem a separação, purificação e recuperação do mesmo.'
      },
      {
        'id': 3,
        'answer': 'Sim, colas solúveis em água e/ou que plastifiquem a < 35°C',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 4,
        'answer':
            'Sim, colas insolúveis em água e/ou que plastifiquem a ≥ 35°C (hot melt)',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'papel': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'cartao': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'recommendation':
            'A utilização de colas hot melt insolúveis em água e/ou que plastifiquem a ≥ 35°C não são compatíveis com a reciclagem do material de embalagem, na medida em que não permitem a separação, purificação e recuperação do mesmo.'
      },
      {
        'id': 5,
        'answer':
            'Sim, colas termofusíveis (colagem a quente) com ponto de amolecimento > 68ºC e espessura <120 micrometros',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A compatibilidade das colas termofusíveis com o PET está dependente da quantidade de cola utilizada e da aplicação final.'
      },
      {
        'id': 6,
        'answer':
            'Sim, colas termofusíveis (colagem a quente) com ponto de amolecimento < 68ºC e espessura <120 micrometros',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A utilização de colas termofusíveis (colagem a quente) com ponto de amolecimento < 68ºC e espessura <120 micrometros podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 7,
        'answer': 'Sim, colas adesivas por pressão manual',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'A compatibilidade de colas adesivas por pressão manual com este material está dependente da quantidade de cola utilizada e da aplicação final.'
      },
      {
        'id': 8,
        'answer': 'Sim, adesivos autoaderentes e permanentes',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pebd': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'eps': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pp': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'outros_plasticos': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'ecal': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'papel': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'cartao': {
          'value': -8,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'recommendation':
            'A utilização de adesivos autoaderentes e permanentes não são compatíveis com a reciclagem do material de embalagem, na medida em que não permitem a separação e recuperação do mesmo.'
      },
      {
        'id': 9,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas não adesivas, alcalinas ou hidrossolúveis a 60 - 80 °C.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Sempre que possível, deve ser privilegiada a utilização de colas hot melt solúveis em água e/ou que plastifiquem a < 35°C, ou com ponto de amolecimento superior a 68 °C.'
        },
        'recommendation':
            'A utilização de colas não especificadas ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 14,
    'question': 'São utilizados outros componentes?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, Polietileno de alta densidade (PEAD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'A compatibilidade do PEAD com o PET está dependente da quantidade de PEAD utilizada e da aplicação final.'
        },
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEAD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 2,
        'answer': 'Sim, Polietileno de baixa densidade (PEBD)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'A compatibilidade do PEBD com o PET está dependente da quantidade de PEBD utilizada e da aplicação final.'
        },
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PEBD não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 3,
        'answer': 'Sim, Polipropileno (PP)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'A compatibilidade do PP com o PET está dependente da quantidade de PP utilizada e da aplicação final.'
        },
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PP não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 4,
        'answer': 'Sim, Policloreto de vinilo (PVC)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PVC não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 5,
        'answer': 'Sim, Poliestireno (PS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 6,
        'answer': 'Sim, Poliestireno Expandido (EPS)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {'value': 0, 'recommendation': null},
        'pp': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de EPS não separáveis podem ser prejudiciais para a reciclagem deste material, ou a sua compatibilidade estar dependente da quantidade utilizada e da aplicação final.'
      },
      {
        'id': 7,
        'answer': 'Sim, Politereftalato de etileno (PET)',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de PET não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 8,
        'answer': 'Sim, Papel / Cartão',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de papel e cartão não separáveis, está dependente da quantidade de material utilizada e da aplicação final.'
      },
      {
        'id': 9,
        'answer': 'Sim, Aço',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de aço não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 10,
        'answer': 'Sim, Alumínio',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de alumínio não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 11,
        'answer': 'Sim, Cerâmica',
        'vidro': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com temperaturas de fusão (°C) compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes de cerâmica não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 12,
        'answer': 'Sim, Silicone',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -6,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation':
            'A utilização de componentes de silicone não separáveis vai prejudicar a reciclagem do material de embalagem, impedindo a sua recuperação.'
      },
      {
        'id': 13,
        'answer': 'Sim, outros materiais',
        'vidro': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      },
      {
        'id': 14,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do vidro, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do aço, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do alumínio, como os plásticos de embalagem e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais com densidades compatíveis com a reciclagem do PET, como o EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PEAD, como o PE, PP e EPS. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do filme, como o PE. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do EPS, como o PE e PP. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do PP, como o PP rígido e flexível. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a produção de embalagens e utilização de componentes cujo material base dispõe de fluxo próprio de reciclagem. A reciclagem de outros plásticos representa downcycling, não sendo possível recuperar estes materiais com o valor técnico e económico que tinham inicialmente. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes com materiais compatíveis com a reciclagem do ECAL, como o PE, o alumínio e o papel/cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Deve ser privilegiada a utilização de componentes de papel e cartão. Para mais informações, consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes com outros materiais não especificados ou não compatíveis, são prejudiciais para a reciclagem deste material.'
      }
    ]
  },
  {
    'id': 15,
    'question':
        'Os diversos componentes são destacáveis e facilmente separáveis?',
    'requirement': null,
    'info':
        'Considerar todos os componentes da embalagem: sistema de fecho, rótulo/manga, revestimentos e outros componentes',
    'answers': [
      {
        'id': 0,
        'answer': 'Sim',
        'vidro': {'value': 3, 'recommendation': null},
        'aco': {'value': 3, 'recommendation': null},
        'aluminio': {'value': 3, 'recommendation': null},
        'pet': {'value': 4, 'recommendation': null},
        'pead': {'value': 4, 'recommendation': null},
        'pebd': {'value': 4, 'recommendation': null},
        'eps': {'value': 4, 'recommendation': null},
        'pp': {'value': 4, 'recommendation': null},
        'outros_plasticos': {'value': 4, 'recommendation': null},
        'ecal': {'value': 4, 'recommendation': null},
        'papel': {'value': 4, 'recommendation': null},
        'cartao': {'value': 4, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Não',
        'vidro': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/vidro/'
        },
        'aco': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/aco/'
        },
        'aluminio': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/aluminio/'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/pet/'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/pead-rigido/'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/eps/'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/filme-plastico/'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/plasticos-mistos/'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-cartao-para-alimentos-liquidos-ecal/'
        },
        'papel': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'cartao': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes multimateriais, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. Para mais informações consultar https://www.pontoverdelab.pt/pack4recycling/embalagens-de-papel-cartao/'
        },
        'recommendation':
            'A utilização de componentes não separáveis e não compatíveis com o material do corpo da embalagem impossibilita a sua reciclagem.'
      },
      {
        'id': 2,
        'answer':
            'Não, a embalagem tem componentes como tampa top down, doseadores ou pulverizadores',
        'vidro': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'aco': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'aluminio': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'pet': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'pead': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'pebd': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'eps': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'pp': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'outros_plasticos': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'ecal': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'papel': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'cartao': {
          'value': -5,
          'recommendation':
              'Sempre que seja necessário utilizar estes componentes, dificilmente separáveis, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem e apresentar peso e dimensões adequadas face ao total da embalagem.'
        },
        'recommendation':
            'A utilização de componentes com peso acrescido pode afetar a triagem automática e impedir a separação da embalagem para o adequado fluxo de reciclagem.'
      }
    ]
  },
  {
    'id': 16,
    'question':
        'O produto acondicionado é perigoso ou passível de contaminar a embalagem?',
    'requirement': null,
    'info':
        'ex. vernizes, tintas, silicones, fitossanitários, gorduras, outros',
    'answers': [
      {
        'id': 0,
        'answer': 'Sim, outros produtos',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pead': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pebd': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'eps': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pp': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'outros_plasticos': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'recommendation':
            'Estes produtos e os seus resíduos vão contaminar as embalagens deste material. O processo de tentativa de descontaminação e de recuperação deste material é muito complexo e dispendioso, prejudicando a possibilidade de ser reciclado.'
      },
      {
        'id': 1,
        'answer': 'Sim, óleos e gorduras',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {'value': null, 'recommendation': null},
        'pead': {'value': null, 'recommendation': null},
        'pebd': {'value': null, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': null, 'recommendation': null},
        'outros_plasticos': {'value': null, 'recommendation': null},
        'ecal': {'value': null, 'recommendation': null},
        'papel': {
          'value': -5,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal, de vidro ou de plásticos adequados.'
        },
        'cartao': {
          'value': -5,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal, de vidro ou de plásticos adequados.'
        },
        'recommendation':
            'Estes produtos e os seus resíduos vão contaminar as embalagens e inviabilizar a reciclagem das fibras de embalagens de papel e cartão. O processo de tentativa de descontaminação e de recuperação deste material é muito complexo e dispendioso, prejudicando a possibilidade de ser reciclado.'
      },
      {
        'id': 2,
        'answer': 'Sim, silicones',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': null, 'recommendation': null},
        'aluminio': {'value': null, 'recommendation': null},
        'pet': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pead': {
          'value': -5,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pebd': {
          'value': -5,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'ecal': {'value': null, 'recommendation': null},
        'papel': {'value': null, 'recommendation': null},
        'cartao': {'value': null, 'recommendation': null},
        'recommendation':
            'Estes produtos e os seus resíduos vão contaminar as embalagens deste material. O processo de tentativa de descontaminação e de recuperação deste material é muito complexo e dispendioso, prejudicando a possibilidade de ser reciclado.'
      },
      {
        'id': 3,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 4,
        'answer': 'Não sei',
        'vidro': {
          'value': -1,
          'recommendation':
              'Apesar do material de vidro ser dificilmente contaminado pelos produtos contidos, as embalagens devem contar com recomendações para esvaziar bem a embalagem, antes de ser colocada no ecoponto.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'Apesar do material de aço ser dificilmente contaminado pelos produtos contidos, as embalagens devem contar com recomendações para esvaziar bem a embalagem, antes de ser colocada no ecoponto.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'Apesar do material de alumínio ser dificilmente contaminado pelos produtos contidos, as embalagens devem contar com recomendações para esvaziar bem a embalagem, antes de ser colocada no ecoponto.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal ou de vidro.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'Apesar do material de ECAL ser dificilmente contaminado pelos produtos contidos, as embalagens devem contar com recomendações para esvaziar bem a embalagem, antes de ser colocada no ecoponto.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'Contaminantes como a gordura e humidade, vão inviabilizar a reciclagem das fibras de embalagens de papel e cartão. No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal, de vidro, ou de plásticos adequados.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'Contaminantes como a gordura e humidade, vão inviabilizar a reciclagem das fibras de embalagens de papel e cartão. No acondicionamento destes produtos, deve ser privilegiada a  utilização de embalagens de metal, de vidro, ou de plásticos adequados.'
        },
        'recommendation':
            'Estes produtos e os seus resíduos vão contaminar as embalagens deste material. O processo de tentativa de descontaminação e de recuperação deste material é muito complexo e dispendioso, prejudicando a possibilidade de ser reciclado.'
      }
    ]
  },
  {
    'id': 17,
    'question':
        'A embalagem tem informação sobre os diferentes materiais que a constituem?',
    'requirement': null,
    'info':
        'Sistema de identificação dos materiais de embalagem, de acordo com a Decisão n.º 97/129/CE',
    'answers': [
      {
        'id': 0,
        'answer': 'Sim',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Não',
        'vidro': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'aco': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'aluminio': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'pet': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'pead': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'pebd': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'eps': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'pp': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'outros_plasticos': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'ecal': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'papel': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'cartao': {
          'value': -1,
          'recommendation':
              'No caso de a embalagem ser constituída por dois ou mais materiais diferentes e separáveis, cada componente deve dispor de identificação clara do tipo de material presente. Para facilitar a identificação pelo consumidor e operadores de triagem, estes elementos devem incorporar simbologia normalizada para a classificação dos seus materiais e deste modo potenciar o adequado encaminhamento para reciclagem.'
        },
        'recommendation':
            'A presença de diferentes materiais, sem adequada identificação, pode prejudicar a reciclabilidade da embalagem, nomeadamente se os materiais forem incompatíveis e não separáveis.'
      }
    ]
  },
  {
    'id': 18,
    'question': 'A embalagem cabe no ecoponto?',
    'requirement': null,
    'info':
        'Embalagens de plástico, metal e ECAL: Diâmetros inferiores a 30 cm; Embalagens de papel/cartão: Dimensões inferiores a 1 m x 13 cm (dimensões incluem embalagens espalmadas)',
    'answers': [
      {
        'id': 0,
        'answer': 'Sim, a embalagem cabe na boca do ecoponto',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer': 'Sim, a embalagem espalmada cabe na boca do ecoponto',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer': 'Não',
        'vidro': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'aco': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'aluminio': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'pet': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'pead': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'pebd': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'eps': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'pp': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'outros_plasticos': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'ecal': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'papel': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'cartao': {
          'value': -13,
          'recommendation':
              'As embalagens devem apresentar dimensões adequadas às bocas dos ecopontos. Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/principios-chave-para-uma-embalagem-mais-reciclavel/'
        },
        'recommendation':
            'A produção de embalagens com dimensões superiores às das bocas dos ecopontos impossibilitam a sua deposição e o correto encaminhamento para reciclagem.'
      }
    ]
  },
  {
    'id': 19,
    'question': 'A embalagem tem componentes com dimensões inferiores a 50 mm?',
    'requirement': null,
    'info': 'Considerar diâmetro ou comprimento/altura',
    'answers': [
      {
        'id': 0,
        'answer': 'Sim',
        'vidro': {
          'value': -2,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'aco': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'aluminio': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'pet': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'pead': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'pebd': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'eps': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'pp': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'outros_plasticos': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'ecal': {
          'value': -4,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'papel': {
          'value': -2,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'cartao': {
          'value': -2,
          'recommendation':
              'Sempre que seja necessário utilizar componentes de dimensões reduzidas, estes deverão ser compatíveis com o processo de reciclagem do material base da embalagem. O consumidor deve ser informado que estes componentes devem ser mantidos na embalagem e colocados no ecoponto para evitar fenómenos de littering.'
        },
        'recommendation':
            'As embalagens ou componentes com dimensões inferiores a 5 cm não são recuperados pelo trommel das estações de triagem e acabam por se perder no processo.'
      },
      {
        'id': 1,
        'answer': 'Não',
        'vidro': {'value': 0, 'recommendation': null},
        'aco': {'value': 0, 'recommendation': null},
        'aluminio': {'value': 0, 'recommendation': null},
        'pet': {'value': 0, 'recommendation': null},
        'pead': {'value': 0, 'recommendation': null},
        'pebd': {'value': 0, 'recommendation': null},
        'eps': {'value': 0, 'recommendation': null},
        'pp': {'value': 0, 'recommendation': null},
        'outros_plasticos': {'value': 0, 'recommendation': null},
        'ecal': {'value': 0, 'recommendation': null},
        'papel': {'value': 0, 'recommendation': null},
        'cartao': {'value': 0, 'recommendation': null},
        'recommendation': null
      }
    ]
  },
  {
    'id': 20,
    'question': 'A embalagem tem informação adequada sobre a deposição?',
    'requirement': null,
    'info': null,
    'answers': [
      {
        'id': 0,
        'answer': 'Sim, a embalagem tem informação sobre o ecoponto adequado',
        'vidro': {'value': 1, 'recommendation': null},
        'aco': {'value': 1, 'recommendation': null},
        'aluminio': {'value': 1, 'recommendation': null},
        'pet': {'value': 1, 'recommendation': null},
        'pead': {'value': 1, 'recommendation': null},
        'pebd': {'value': 1, 'recommendation': null},
        'eps': {'value': 1, 'recommendation': null},
        'pp': {'value': 1, 'recommendation': null},
        'outros_plasticos': {'value': 1, 'recommendation': null},
        'ecal': {'value': 1, 'recommendation': null},
        'papel': {'value': 1, 'recommendation': null},
        'cartao': {'value': 1, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 1,
        'answer':
            'Sim, a embalagem tem informação sobre o ecoponto adequado e sobre a necessidade de separação (ou de manter) dos seus componentes',
        'vidro': {'value': 2, 'recommendation': null},
        'aco': {'value': 2, 'recommendation': null},
        'aluminio': {'value': 2, 'recommendation': null},
        'pet': {'value': 2, 'recommendation': null},
        'pead': {'value': 2, 'recommendation': null},
        'pebd': {'value': 2, 'recommendation': null},
        'eps': {'value': 2, 'recommendation': null},
        'pp': {'value': 2, 'recommendation': null},
        'outros_plasticos': {'value': 2, 'recommendation': null},
        'ecal': {'value': 2, 'recommendation': null},
        'papel': {'value': 2, 'recommendation': null},
        'cartao': {'value': 2, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 2,
        'answer':
            'Sim, a embalagem tem informação sobre o ecoponto adequado e sobre a necessidade de esvaziar e reduzir o volume (ex. espalmar) antes da deposição',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 1, 'recommendation': null},
        'aluminio': {'value': 1, 'recommendation': null},
        'pet': {'value': 1, 'recommendation': null},
        'pead': {'value': 1, 'recommendation': null},
        'pebd': {'value': 1, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 1, 'recommendation': null},
        'outros_plasticos': {'value': 1, 'recommendation': null},
        'ecal': {'value': 1, 'recommendation': null},
        'papel': {'value': 1, 'recommendation': null},
        'cartao': {'value': 1, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 3,
        'answer':
            'Sim, a embalagem tem informação sobre o ecoponto adequado, sobre a necessidade de separação (ou de manter) dos seus componentes e sobre a necessidade de esvaziar e reduzir o volume (ex. espalmar) antes da deposição',
        'vidro': {'value': null, 'recommendation': null},
        'aco': {'value': 3, 'recommendation': null},
        'aluminio': {'value': 3, 'recommendation': null},
        'pet': {'value': 3, 'recommendation': null},
        'pead': {'value': 3, 'recommendation': null},
        'pebd': {'value': 3, 'recommendation': null},
        'eps': {'value': null, 'recommendation': null},
        'pp': {'value': 3, 'recommendation': null},
        'outros_plasticos': {'value': 3, 'recommendation': null},
        'ecal': {'value': 3, 'recommendation': null},
        'papel': {'value': 3, 'recommendation': null},
        'cartao': {'value': 3, 'recommendation': null},
        'recommendation': null
      },
      {
        'id': 4,
        'answer': 'Não',
        'vidro': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'aco': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'aluminio': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'pet': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'pead': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'pebd': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'eps': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'pp': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'outros_plasticos': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'ecal': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'papel': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'cartao': {
          'value': -3,
          'recommendation':
              'Para que a embalagem possa ser colocada no ecoponto adequado, é fundamental que a mesma contenha o ícone desse ecoponto. Nas situações de presença de componentes de materiais diferentes, superiores a 5 cm e separáveis, deve informar-se o consumidor sobre o ecoponto onde deve ser colocado cada componente. Caso o destino correto da embalagem não seja o ecoponto, então o ícone a apresentar é       . Para mais informações consultar https://www.pontoverdelab.pt/ecodesign/desenhar-para-reciclar/torne-a-sua-embalagem-mais-reciclavel/'
        },
        'recommendation':
            'A ausência de identificação clara dos materiais que compõem as embalagens e do contentor adequado, pode prejudicar a sua deposição e o correto encaminhamento para reciclagem.'
      }
    ]
  }
];
