# 🏦 Nubank Clone - Flutter

[![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev/)
[![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev/)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

Um clone completo da interface do aplicativo Nubank desenvolvido em Flutter, ideal para estudantes de Engenharia de Software que estão aprendendo desenvolvimento mobile. Este projeto demonstra conceitos fundamentais do Flutter através de uma interface moderna e funcional.

## 📱 Sobre o Projeto

Este projeto é uma réplica visual fiel da interface do Nubank, desenvolvida com foco na **clareza do código**, **facilidade de aprendizado** e **boas práticas de desenvolvimento**. O código foi estruturado de forma didática para ser compreendido por iniciantes em Flutter, mas também serve como referência para desenvolvedores mais experientes.

### 🎯 Objetivos de Aprendizado

- **Navegação entre telas** usando rotas nomeadas
- **Gerenciamento de estado** com StatefulWidget
- **Criação de widgets reutilizáveis** e customizados
- **Aplicação de temas** personalizados e design system
- **Estruturação de projeto** Flutter profissional
- **Validação de formulários** e interação do usuário
- **Layout responsivo** e design adaptativo
- **Operações assíncronas** e ciclo de vida de widgets

## ✨ Funcionalidades

### 🖥️ Telas Implementadas

1. **Splash Screen** - Tela inicial com logo animado e loading
2. **Login Screen** - Tela de autenticação com validação completa
3. **Home Screen** - Tela principal com saldo, ações e cards

### 🚀 Características Principais

- ✅ **Navegação funcional** entre todas as telas
- ✅ **Design fiel** ao Nubank original com identidade visual
- ✅ **Código limpo** e extensivamente comentado
- ✅ **Widgets reutilizáveis** para manutenção fácil
- ✅ **Validação de formulários** robusta na tela de login
- ✅ **Interface responsiva** para diferentes tamanhos de tela
- ✅ **Tema personalizado** seguindo design system
- ✅ **Gerenciamento de estado** eficiente
- ✅ **Assets otimizados** (SVG, ícones)
- ✅ **Estrutura escalável** e bem organizada

### 🎨 Recursos Visuais

- **Cores autênticas** do Nubank (roxo #8A05BE)
- **Tipografia consistente** com hierarquia clara
- **Sombras e elevações** para profundidade visual
- **Ícones Material Design** integrados
- **Layout responsivo** com scroll otimizado
- **Animações sutis** e transições suaves

## 🛠️ Tecnologias Utilizadas

### Core Technologies
- **Flutter** 3.x - Framework de desenvolvimento multiplataforma
- **Dart** 3.x - Linguagem de programação
- **Material Design** - Design system do Google

### Dependencies
- **flutter_svg** - Renderização de ícones SVG
- **flutter_lints** - Análise estática de código
- **material_color_utilities** - Utilitários de cores

### Development Tools
- **Flutter SDK** - Ambiente de desenvolvimento
- **Dart SDK** - Compilador e runtime
- **Android Studio / VS Code** - IDEs recomendadas

## 📁 Estrutura do Projeto

```
nubank_like/
├── 📁 lib/                          # Código fonte principal
│   ├── 📄 main.dart                 # Ponto de entrada da aplicação
│   ├── 📁 screens/                  # Telas do aplicativo
│   │   ├── 📄 splash_screen.dart    # Tela inicial com loading
│   │   ├── 📄 login_screen.dart     # Tela de autenticação
│   │   └── 📄 home_screen.dart      # Tela principal do app
│   ├── 📁 widgets/                  # Widgets reutilizáveis
│   │   └── 📄 action_item.dart      # Botões de ação e cards
│   └── 📁 utils/                    # Utilitários e constantes
│       ├── 📄 constants.dart        # Cores, dimensões e constantes
│       └── 📄 app_styles.dart        # Estilos de texto centralizados
├── 📁 assets/                       # Recursos estáticos
│   └── 📁 icons/                    # Ícones SVG
├── 📁 test/                         # Testes automatizados
│   └── 📄 widget_test.dart          # Testes de widget
├── 📁 android/                     # Configurações Android
├── 📁 ios/                         # Configurações iOS
├── 📁 web/                         # Configurações Web
├── 📁 windows/                     # Configurações Windows
├── 📁 macos/                       # Configurações macOS
├── 📁 linux/                       # Configurações Linux
├── 📄 pubspec.yaml                 # Dependências do projeto
├── 📄 analysis_options.yaml        # Configurações do linter
└── 📄 README.md                    # Documentação do projeto
```

## 🎨 Design System

### 🎨 Paleta de Cores

| Cor | Código | Uso |
|-----|--------|-----|
| **Roxo Principal** | `#8A05BE` | Botões, ícones, elementos primários |
| **Fundo** | `#F6F6F8` | Background principal |
| **Cards** | `#FFFFFF` | Superfícies elevadas |
| **Texto Primário** | `#1A1A1A` | Títulos e textos importantes |
| **Texto Secundário** | `#666666` | Subtítulos e textos secundários |
| **Texto Claro** | `#999999` | Textos auxiliares |

### 📏 Dimensões Padrão

```dart
// Espaçamentos
defaultPadding: 20.0
cardRadius: 12.0
buttonRadius: 8.0

// Tamanhos
iconSize: 24.0
logoSize: 80.0
actionItemSize: 60.0
discoveryCardWidth: 280.0
```

### 🔤 Tipografia

| Estilo | Tamanho | Peso | Uso |
|--------|---------|------|-----|
| **titleLarge** | 24px | Bold | Títulos principais |
| **titleMedium** | 20px | SemiBold | Títulos secundários |
| **titleSmall** | 18px | SemiBold | Títulos pequenos |
| **bodyLarge** | 16px | Medium | Texto principal |
| **bodyMedium** | 14px | Normal | Texto secundário |
| **bodySmall** | 12px | Normal | Texto auxiliar |

## 🚀 Como Executar

### 📋 Pré-requisitos

- **Flutter SDK** 3.0+ instalado
- **Dart SDK** 3.0+ (incluído com Flutter)
- **Android Studio** ou **VS Code** com extensões Flutter
- **Emulador Android** ou **dispositivo físico**
- **Git** para clonagem do repositório

### 🔧 Instalação

1. **Clone o repositório**
   ```bash
   git clone https://github.com/seu-usuario/nubank_like.git
   cd nubank_like
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Verifique se tudo está funcionando**
   ```bash
   flutter doctor
   ```

4. **Execute o aplicativo**
   ```bash
   # Para Android
   flutter run

   # Para iOS (apenas no macOS)
   flutter run -d ios

   # Para Web
   flutter run -d web-server

   # Para Windows
   flutter run -d windows
   ```

### 🧪 Executando Testes

```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage

# Executar análise estática
flutter analyze
```

## 📚 Conceitos Flutter Demonstrados

### 🧭 1. Navegação

```dart
// Navegação entre telas com rotas nomeadas
Navigator.pushReplacementNamed(context, '/login');

// Configuração de rotas no main.dart
Map<String, WidgetBuilder> _createRoutes() {
  return {
    '/': (context) => SplashScreen(),
    '/login': (context) => LoginScreen(),
    '/home': (context) => HomeScreen(),
  };
}
```

### 🔄 2. Gerenciamento de Estado

```dart
class HomeScreenState extends State<HomeScreen> {
  bool _isBalanceVisible = true;

  void _toggleBalance() {
    setState(() {
      _isBalanceVisible = !_isBalanceVisible;
    });
  }
}
```

### 🧩 3. Widgets Reutilizáveis

```dart
// Widget customizado para botões de ação
class ActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const ActionItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });
}
```

### ✅ 4. Validação de Formulários

```dart
// Validação de campos obrigatórios
TextFormField(
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite seu CPF ou e-mail';
    }
    return null;
  },
)
```

### 🎨 5. Temas Personalizados

```dart
// Configuração de tema global
ThemeData _createNubankTheme() {
  return ThemeData(
    primaryColor: AppConstants.primaryPurple,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppConstants.primaryPurple,
      ),
    ),
  );
}
```

### ⏱️ 6. Operações Assíncronas

```dart
// Timer para splash screen
void _startNavigationTimer() async {
  await Future.delayed(Duration(seconds: 3));
  if (mounted) {
    Navigator.pushReplacementNamed(context, '/login');
  }
}
```

## 🎓 Para Estudantes

### 📖 O que você vai aprender:

1. **🏗️ Estrutura básica** de um app Flutter
2. **🧭 Navegação** entre telas e rotas
3. **📝 Formulários** com validação robusta
4. **📱 Layout responsivo** com Column, Row, Container
5. **🎨 Temas** e estilização avançada
6. **🧩 Widgets customizados** e reutilizáveis
7. **🔄 Gerenciamento de estado** eficiente
8. **⏱️ Operações assíncronas** e timers
9. **📦 Organização de projeto** profissional
10. **🧪 Testes** e análise de código

### 🚀 Próximos Passos Sugeridos:

- **🎬 Animações** - Adicionar transições suaves
- **💾 Persistência** - Implementar armazenamento local
- **🌐 APIs** - Integrar com serviços reais
- **🧪 Testes** - Expandir cobertura de testes
- **🔐 Autenticação** - Implementar login real
- **📊 Estado Global** - Usar Provider/Riverpod
- **🎨 Temas** - Modo escuro/claro
- **📱 Responsividade** - Otimizar para tablets

## 🧪 Testes

O projeto inclui testes automatizados para garantir a qualidade do código:

```bash
# Executar testes
flutter test

# Executar com cobertura
flutter test --coverage

# Análise estática
flutter analyze
```

### 📊 Cobertura de Testes

- ✅ **Widget Tests** - Testes de interface
- ✅ **Unit Tests** - Testes de lógica
- ✅ **Integration Tests** - Testes de fluxo completo

## 📝 Notas Importantes

### ⚠️ Avisos

- Este é um projeto **educacional** - não possui integração com APIs reais
- O foco está na **interface** e **navegação** para fins de aprendizado
- Código otimizado para **legibilidade** e **compreensão**
- Ideal para **portfólio** de estudantes e desenvolvedores iniciantes

### 🔒 Segurança

- **Não armazena dados reais** de usuários
- **Não conecta** com serviços bancários
- **Apenas simula** a interface do Nubank

## 🤝 Contribuições

Contribuições são muito bem-vindas! Este projeto é perfeito para:

- **👨‍🎓 Estudantes** que querem praticar Flutter
- **👨‍💻 Desenvolvedores iniciantes** em mobile
- **🎨 Designers** interessados em UI/UX
- **📚 Professores** de programação
- **🔧 Qualquer pessoa** interessada em aprender desenvolvimento mobile

### 🛠️ Como Contribuir

1. **Fork** o projeto
2. **Crie** uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. **Commit** suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. **Push** para a branch (`git push origin feature/AmazingFeature`)
5. **Abra** um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo [LICENSE](LICENSE) para mais detalhes.

## 👨‍💻 Autor

**Desenvolvido com ❤️ para a comunidade Flutter**

- **GitHub**: [@seu-usuario](https://github.com/seu-usuario)
- **LinkedIn**: [Seu Perfil](https://linkedin.com/in/seu-perfil)
- **Email**: seu.email@exemplo.com

## 🙏 Agradecimentos

- **Nubank** pela inspiração no design
- **Flutter Team** pelo framework incrível
- **Comunidade Flutter** pelo suporte constante
- **Contribuidores** que ajudaram a melhorar o projeto

---

<div align="center">

**⭐ Se este projeto te ajudou, considere dar uma estrela! ⭐**

[![GitHub stars](https://img.shields.io/github/stars/seu-usuario/nubank_like?style=social)](https://github.com/seu-usuario/nubank_like/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/seu-usuario/nubank_like?style=social)](https://github.com/seu-usuario/nubank_like/network)

</div>