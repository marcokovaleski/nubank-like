# Nubank Clone - Flutter

Um clone da interface do aplicativo Nubank desenvolvido em Flutter, ideal para estudantes de Engenharia de Software que estão aprendendo desenvolvimento mobile.

## 📱 Sobre o Projeto

Este projeto é uma réplica visual da interface do Nubank, desenvolvida com foco na **clareza do código** e **facilidade de aprendizado**. O código foi estruturado de forma didática para ser compreendido por iniciantes em Flutter.

### 🎯 Objetivos de Aprendizado

- **Navegação entre telas** usando rotas nomeadas
- **Gerenciamento de estado** com StatefulWidget
- **Criação de widgets reutilizáveis**
- **Aplicação de temas** personalizados
- **Estruturação de projeto** Flutter

## 🚀 Funcionalidades

### Telas Implementadas

1. **Splash Screen** - Tela inicial com logo e loading
2. **Login Screen** - Tela de autenticação com validação
3. **Home Screen** - Tela principal com saldo e ações

### Características

- ✅ **Navegação funcional** entre todas as telas
- ✅ **Design fiel** ao Nubank original
- ✅ **Código limpo** e bem comentado
- ✅ **Widgets reutilizáveis** para manutenção fácil
- ✅ **Validação de formulários** na tela de login
- ✅ **Responsivo** para diferentes tamanhos de tela

## 🛠️ Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento
- **Dart** - Linguagem de programação
- **Material Design** - Design system
- **SVG** - Ícones vetoriais (flutter_svg)

## 📁 Estrutura do Projeto

```
lib/
├── main.dart                 # Ponto de entrada da aplicação
├── screens/                  # Telas do aplicativo
│   ├── splash_screen.dart   # Tela inicial
│   ├── login_screen.dart    # Tela de login
│   └── home_screen.dart     # Tela principal
├── widgets/                 # Widgets reutilizáveis
│   └── action_item.dart     # Botões de ação e cards
└── utils/                   # Constantes e utilitários
    ├── constants.dart       # Cores, dimensões e constantes
    └── app_styles.dart      # Estilos de texto centralizados
```

## 🎨 Design System

### Cores Principais
- **Roxo Nubank**: `#8A05BE`
- **Fundo**: `#F6F6F8`
- **Cards**: `#FFFFFF`

### Componentes
- **Botões circulares** para ações principais
- **Cards com sombra** para seções
- **Ícones Material** para interface
- **Tipografia** consistente

## 🚀 Como Executar

### Pré-requisitos
- Flutter SDK instalado
- Android Studio ou VS Code
- Emulador Android ou dispositivo físico

### Passos

1. **Clone o repositório**
   ```bash
   git clone [url-do-repositorio]
   cd nubank_like
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Execute o aplicativo**
   ```bash
   flutter run
   ```

## 📚 Conceitos Flutter Demonstrados

### 1. Navegação
```dart
// Navegação entre telas
Navigator.pushReplacementNamed(context, '/login');
```

### 2. Gerenciamento de Estado
```dart
// Controle de visibilidade do saldo
bool _isBalanceVisible = true;

void _toggleBalance() {
  setState(() {
    _isBalanceVisible = !_isBalanceVisible;
  });
}
```

### 3. Widgets Reutilizáveis
```dart
// Widget customizado para botões de ação
ActionItem(
  icon: Icons.pix,
  label: 'Área Pix',
  onTap: () {},
)
```

### 4. Validação de Formulários
```dart
// Validação de campos obrigatórios
validator: (value) {
  if (value == null || value.isEmpty) {
    return 'Por favor, digite seu CPF ou e-mail';
  }
  return null;
}
```

## 🎓 Para Estudantes

### O que você vai aprender:

1. **Estrutura básica** de um app Flutter
2. **Navegação** entre telas
3. **Formulários** com validação
4. **Layout responsivo** com Column, Row, Container
5. **Temas** e estilização
6. **Widgets customizados**
7. **Gerenciamento de estado** básico

### Próximos Passos:

- Adicionar animações
- Implementar persistência de dados
- Integrar com APIs reais
- Adicionar testes unitários
- Implementar autenticação real

## 📝 Notas Importantes

- Este é um projeto **educacional** - não possui integração com APIs reais
- O foco está na **interface** e **navegação**
- Código otimizado para **legibilidade** e **aprendizado**
- Ideal para **portfólio** de estudantes

## 🤝 Contribuições

Contribuições são bem-vindas! Este projeto é perfeito para:
- Estudantes que querem praticar Flutter
- Desenvolvedores iniciantes
- Qualquer pessoa interessada em aprender desenvolvimento mobile

---

**Desenvolvido com ❤️ para a comunidade Flutter**